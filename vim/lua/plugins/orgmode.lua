local onedark = require "onedark"
require("orgmode").setup_ts_grammar()
require("orgmode").setup {
    org_default_notes_file = "~/dev/org/notes.org",
    org_agenda_templates = {
        f = {
            description = "File notes",
            template = "* TODO %?\n  %u\n  %a",
            target = "~/dev/org/notes.org",
        },
    },
    org_todo_keywords = { "TODO(t)", "|", "DONE", "CANCELED" },
    org_todo_keyword_faces = {
        TODO = ":foreground " .. onedark.colors.purple .. " :weight bold",
        DONE = ":foreground " .. onedark.colors.green .. " :weight bold",
        CANCELED = ":foreground " .. onedark.colors.red .. " :weight bold",
    },
    org_hide_emphasis_markers = true,
    mappings = {
        disable_all = true,
    },
}
