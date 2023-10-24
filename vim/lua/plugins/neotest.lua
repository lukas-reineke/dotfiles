return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "rouge8/neotest-rust",
        "nvim-neotest/neotest-go",
        "nvim-neotest/neotest-plenary",
        "haydenmeade/neotest-jest",
        "nvim-neotest/neotest-python",
    },
    keys = {
        "<Space>tt",
        "<Space>to",
        "<Space>ts",
        "<Space>tf",
        "<Space>td",
    },
    config = function()
        local neotest = require "neotest"
        neotest.setup {
            icons = {
                failed = "",
                passed = "",
                running = "",
                skipped = "○",
                unknown = "",
            },
            output = {
                open_on_run = false,
            },
            adapters = {
                require "neotest-rust" {
                    args = { "--no-capture" },
                    dap_adapter = "lldb",
                },
                require "neotest-go",
                require "neotest-plenary",
                require "neotest-jest" {
                    jestCommand = "npm run test:run --",
                },
                require "neotest-python" {
                    runner = "pytest",
                },
            },
        }

        vim.keymap.set("n", "<Space>tt", function()
            vim.notify_once("Running single test", vim.log.levels.INFO, {
                title = "Neotest",
            })
            neotest.run.run()
        end)
        vim.keymap.set("n", "<Space>to", function()
            neotest.output.open {
                enter = true,
                open_win = function(settings)
                    local height = math.min(settings.height, vim.o.lines - 2)
                    local width = math.min(settings.width, vim.o.columns - 2)
                    return vim.api.nvim_open_win(0, true, {
                        relative = "editor",
                        row = 7,
                        col = (vim.o.columns - width) / 2,
                        width = width,
                        height = height,
                        style = "minimal",
                        border = vim.g.floating_window_border,
                        noautocmd = true,
                    })
                end,
            }
        end)
        vim.keymap.set("n", "<Space>ts", function()
            neotest.summary.toggle()
        end)
        vim.keymap.set("n", "<Space>tf", function()
            vim.notify_once("Running tests", vim.log.levels.INFO, {
                title = "Neotest",
            })
            neotest.run.run(vim.fn.expand "%")
        end)
        vim.keymap.set("n", "<Space>td", function()
            vim.notify_once("Start debugging test", vim.log.levels.INFO, {
                title = "Neotest",
            })
            neotest.run.run { strategy = "dap" }
        end)
    end,
}
