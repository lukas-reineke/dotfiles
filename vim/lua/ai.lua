local M = {}

local function relpath()
    local abs = vim.fn.expand "%:p"
    if abs == "" then
        return ""
    end
    return vim.fn.fnamemodify(abs, ":.")
end

local function active_ai_pane()
    local out = vim.fn.systemlist {
        "bash",
        "-lc",
        [[tmux list-panes -F '#{pane_id} #{pane_active}' -t ai 2>/dev/null | awk '$2==1{print $1}']],
    }
    return (out and out[1] ~= "" and out[1]) or nil
end

local function visual_lines()
    local _, s_line, _, _ = unpack(vim.fn.getpos "v") -- visual start
    local _, e_line, _, _ = unpack(vim.fn.getcurpos()) -- cursor pos
    if s_line > e_line then
        s_line, e_line = e_line, s_line
    end
    return s_line, e_line
end

function M.send_visual_filepath_range_to_ai(submit)
    local path = relpath()
    if path == "" then
        vim.notify("No file path (empty buffer?)", vim.log.levels.WARN)
        return
    end

    local s, e = visual_lines()
    if not s or not e then
        vim.notify("No visual selection", vim.log.levels.WARN)
        return
    end

    local msg = string.format("%s:%d-%d", path, s, e)

    local pane = active_ai_pane()
    if not pane then
        vim.notify("Could not find active pane in tmux session 'ai'", vim.log.levels.ERROR)
        return
    end

    vim.fn.system({ "tmux", "load-buffer", "-" }, msg)
    vim.fn.system { "tmux", "paste-buffer", "-t", pane, "-p", "-d" }
    if submit ~= false then
        vim.fn.system { "tmux", "send-keys", "-t", pane, "Enter" }
    end

    vim.notify("Sent to tmux " .. pane .. ": " .. msg, vim.log.levels.INFO)
end

return M
