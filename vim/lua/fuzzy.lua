local fzf = require "fzf"
local devicons = require "nvim-web-devicons"
local lists = require "lists"
local utils = require "utils"
local lsp = require "lsp"
local git = require "git"
local M = {}

local nbs = " "

local get_diff_files = function()
    local diff_files = {}
    if not git.is_repo() then
        return diff_files
    end

    local status = vim.fn.systemlist("git diff --name-status " .. vim.g.git_head .. " --")
    for i = 1, #status do
        local split = vim.split(status[i], "	")
        diff_files[split[2]] = split[1]
    end

    return diff_files
end

local get_untracked_files = function()
    local untracked_files = {}

    if not git.is_repo() then
        return untracked_files
    end

    local status = vim.fn.systemlist "git ls-files --exclude-standard --others"
    for i = 1, #status do
        untracked_files[status[i]] = "?"
    end

    return untracked_files
end

local icon_color_map = {
    [""] = "cyan",
    [""] = "cyan",
    [""] = "dark_grey",
    [""] = "dark_grey",
    [""] = "white",
    [""] = "cyan",
    [""] = "blue",
    [""] = "yellow",
    [""] = "yellow",
    [""] = "green",
    [""] = "green",
    [""] = "blue",
    [""] = "cyan",
    [""] = "yellow",
    ["M"] = "yellow",
    ["D"] = "red",
    ["A"] = "green",
    ["?"] = "blue",
}

local get_color_icon = function(icon)
    return utils.ansi_codes[icon_color_map[icon] or "green"](utils.ansi_codes, icon)
end

local get_git_icon = function(file, diff_files, untracked_files)
    if diff_files[file] then
        return diff_files[file]
    end
    if untracked_files[file] then
        return untracked_files[file]
    end
    return nbs
end

local get_window_options = function()
    local height = math.floor(vim.o.lines * 0.4)
    local width = math.floor(vim.o.columns * 0.8)
    local row = math.floor((vim.o.lines - height) * 0.2)

    return { height = height, width = width, row = row }
end

M.fzf_files = function(files, prompt, show_git)
    coroutine.wrap(function()
        local diff_files = get_diff_files()
        local untracked_files = get_untracked_files()

        for i = 1, #files do
            local extension = vim.fn.fnamemodify(files[i], ":e")
            local icon = devicons.get_icon(files[i], extension)
            local git_icon = get_git_icon(files[i], diff_files, untracked_files)
            files[i] = get_color_icon(git_icon) .. nbs .. get_color_icon(icon) .. " " .. files[i]
        end

        local preview = ""
        if show_git then
            preview =
                "--preview 'bat --italic-text=always --style=numbers,changes --color always {2..-1} | grep -A5 -B5 --color=never -P \"^..\\d+.{0,7}[+|_|~]\"'"
        end

        local result = fzf.fzf(
            files,
            string.format("--ansi --multi %s --prompt %s/", preview, prompt),
            get_window_options()
        )

        if not result then
            return
        end

        local qf_list = {}
        for i = 1, #result do
            result[i] = result[i]:gsub("^[^ ]* ", "")
            table.insert(qf_list, { filename = result[i], lnum = 1, col = 1 })
        end

        if #result == 1 then
            vim.cmd(string.format("silent edit %s", result[1]))
            if show_git then
                local timer = vim.loop.new_timer()
                timer:start(100, 0, function()
                    timer:close()
                    vim.schedule_wrap(function()
                        vim.cmd [[normal gg]]
                        vim.cmd [[GitGutterNextHunk]]
                    end)()
                end)
            end
        else
            vim.fn.setqflist(qf_list)
            lists.change_active [[Quickfix]]
            vim.cmd [[copen]]
            vim.cmd [[cc]]
        end
    end)()
end

M.files = function(path)
    local files = vim.fn.systemlist(os.getenv "FZF_DEFAULT_COMMAND" .. " -- " .. path)
    return M.fzf_files(files, path)
end

M.git_files = function()
    local diff_files = vim.fn.systemlist("git diff --name-only " .. vim.g.git_head .. " --")
    local untracked_files = vim.fn.systemlist "git ls-files --exclude-standard --others"
    local files = vim.list_extend(diff_files, untracked_files)
    return M.fzf_files(files, "git", true)
end

local symbols_to_items = function(symbols)
    local function _symbols_to_items(_symbols, _items, _parent)
        for _, symbol in ipairs(_symbols) do
            local kind = vim.lsp.protocol.SymbolKind[symbol.kind] or "Unknown"
            local range = symbol.location and symbol.location.range or symbol.range
            local name = utils._if(_parent, string.format("%s -> %s", _parent, symbol.name), symbol.name)
            table.insert(_items, {
                lnum = range.start.line + 1,
                col = range.start.character,
                kind = kind,
                icon = lsp.symbol_kind_icons[kind],
                name = name,
            })
            if symbol.children then
                for _, v in ipairs(_symbols_to_items(symbol.children, _items, name)) do
                    vim.list_extend(_items, v)
                end
            end
        end
        return _items
    end
    return _symbols_to_items(symbols, {})
end

M.symbols = function()
    coroutine.wrap(function()
        local params = vim.lsp.util.make_position_params()
        local results_lsp = vim.lsp.buf_request_sync(0, "textDocument/documentSymbol", params, 5000)

        if not results_lsp or vim.tbl_isempty(results_lsp) then
            print "No results"
            return
        end

        local locations = {}
        for _, server_results in pairs(results_lsp) do
            if server_results.result then
                vim.list_extend(locations, symbols_to_items(server_results.result) or {})
            end
        end

        if vim.tbl_isempty(locations) then
            print "No results"
            return
        end

        local lines = {}

        local name_length = math.floor(vim.o.columns * 0.5)

        for i = 1, #locations do
            local short_name = utils.shorten_string(locations[i].name, name_length - 1)
            local name = short_name:gsub("->", utils.ansi_codes:grey "->") .. (" "):rep(name_length - #short_name)
            local color = lsp.symbol_kind_colors[locations[i].kind] or "green"
            local kind = utils.ansi_codes:grey "["
                .. utils.ansi_codes[color](utils.ansi_codes, locations[i].kind)
                .. utils.ansi_codes:grey "]"
                .. (" "):rep(10 - #locations[i].kind)
            local line = string.format(
                "%s %s %s%s%s",
                utils.ansi_codes[color](utils.ansi_codes, locations[i].icon or "?"),
                name,
                kind,
                nbs,
                utils.ansi_codes:red(locations[i].lnum .. ":" .. locations[i].col)
            )
            table.insert(lines, line)
        end

        local result = fzf.fzf(lines, "--ansi --multi --prompt 'Symbols '", get_window_options())

        if not result then
            return
        end

        local lnum, col = unpack(vim.split(vim.split(result[1], nbs)[2], ":"))
        vim.cmd [[normal m']]
        vim.api.nvim_win_set_cursor(0, { tonumber(lnum), tonumber(col) })
        vim.cmd [[normal zt]]
    end)()
end

return M
