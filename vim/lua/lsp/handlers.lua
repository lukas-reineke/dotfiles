local util = require "vim.lsp.util"
local log = require "vim.lsp.log"

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
    })(...)
    pcall(vim.diagnostic.setloclist, { open = false })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = vim.g.floating_window_border_dark,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = vim.g.floating_window_border_dark,
})

local function location_handler(_, result, ctx, config)
    if result == nil or vim.tbl_isempty(result) then
        local _ = log.info() and log.info(ctx.method, "No location found")
        return nil
    end
    local client = vim.lsp.get_client_by_id(ctx.client_id)

    config = config or {}
    if vim.tbl_islist(result) then
        local title = "LSP locations"

        local seen = {}
        local new_result = {}
        for _, r in ipairs(result) do
            local uri = r.targetUri .. tostring(r.targetRange.start.line)
            if not seen[uri] then
                table.insert(new_result, r)
            end
            seen[uri] = true
        end

        if #new_result == 1 then
            util.jump_to_location(new_result[1], client.offset_encoding, config.reuse_win)
            return
        end
        local items = util.locations_to_items(new_result, client.offset_encoding)

        util.jump_to_location(result[1], client.offset_encoding, config.reuse_win)

        vim.fn.setqflist({}, " ", { title = title, items = items })
        require("lists").change_active "Quickfix"

        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_command "botright copen"
        vim.api.nvim_set_current_win(win)
    else
        util.jump_to_location(result, client.offset_encoding, config.reuse_win)
    end
end

-- vim.lsp.handlers["textDocument/declaration"] = location_handler
-- vim.lsp.handlers["textDocument/definition"] = location_handler
-- vim.lsp.handlers["textDocument/typeDefinition"] = location_handler
-- vim.lsp.handlers["textDocument/implementation"] = location_handler

-- local client_notifs = {}

-- local function get_notif_data(client_id, token)
--     if not client_notifs[client_id] then
--         client_notifs[client_id] = {}
--     end
--
--     if not client_notifs[client_id][token] then
--         client_notifs[client_id][token] = {}
--     end
--
--     return client_notifs[client_id][token]
-- end
--
-- local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

-- local function update_spinner(client_id, token)
--     local notif_data = get_notif_data(client_id, token)
--
--     if notif_data.spinner then
--         local new_spinner = (notif_data.spinner + 1) % #spinner_frames
--         notif_data.spinner = new_spinner
--
--         notif_data.notification = vim.notify(nil, nil, {
--             hide_from_history = true,
--             icon = spinner_frames[new_spinner],
--             replace = notif_data.notification,
--         })
--
--         vim.defer_fn(function()
--             update_spinner(client_id, token)
--         end, 100)
--     end
-- end
--
-- local function format_title(title, client_name)
--     return client_name .. (#title > 0 and ": " .. title or "")
-- end
--
-- local function format_message(message, percentage)
--     return (percentage and percentage .. "%\t" or "") .. (message or "")
-- end

-- vim.lsp.handlers["$/progress"] = function(_, result, ctx)
--     local client_id = ctx.client_id
--     local client = vim.lsp.get_client_by_id(client_id)
--     if client.name == "sumneko_lua" or client.name == "rust_analyzer" or client.name == "clangd" then
--         return
--     end
--     local val = result.value
--
--     if not val.kind then
--         return
--     end
--
--     local notif_data = get_notif_data(client_id, result.token)
--
--     if val.kind == "begin" then
--         local message = format_message(val.message, val.percentage)
--
--         notif_data.notification = vim.notify(message, "info", {
--             title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
--             icon = spinner_frames[1],
--             timeout = false,
--             hide_from_history = false,
--         })
--
--         notif_data.spinner = 1
--         update_spinner(client_id, result.token)
--     elseif val.kind == "report" and notif_data then
--         notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
--             replace = notif_data.notification,
--             hide_from_history = false,
--         })
--     elseif val.kind == "end" and notif_data then
--         notif_data.notification = vim.notify(val.message and format_message(val.message) or "Complete", "info", {
--             icon = "",
--             replace = notif_data.notification,
--             timeout = 3000,
--         })
--
--         notif_data.spinner = nil
--     end
-- end
