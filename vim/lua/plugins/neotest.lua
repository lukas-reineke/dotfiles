require("neotest").setup {
    icons = {
        failed = "",
    },
    adapters = {
        require "neotest-jest" {
            jestCommand = "npm run test:run --",
            jestConfigFile = "",
            -- jestConfigFile = "custom.jest.config.ts",
            -- env = { CI = true },
            -- cwd = function(path)
            --     return vim.fn.getcwd()
            -- end,
        },
    },
}
