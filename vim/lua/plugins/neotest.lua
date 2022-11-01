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
        require "neotest-rust",
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
