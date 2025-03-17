return {
    "stevearc/profile.nvim",
    enabled = false,
    config = function()
        if os.getenv "NVIM_PROFILE" then
            require("profile").instrument_autocmds()
            require("profile").instrument "*"

            local function toggle_profile()
                local prof = require "profile"
                if prof.is_recording() then
                    prof.stop()
                    vim.ui.input(
                        { prompt = "Save profile to:", completion = "file", default = "profile.json" },
                        function(filename)
                            if filename then
                                prof.export(filename)
                                vim.notify(string.format("Wrote %s", filename))
                            end
                        end
                    )
                else
                    prof.start "*"
                end
            end
            vim.keymap.set("", "<f1>", toggle_profile)
        end
    end,
}
