require("neotest").setup {
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
