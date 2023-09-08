local dap = require "dap"
local dapui = require "dapui"

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "Function", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "Comment", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🠶", texthl = "String", linehl = "DiffAdd", numhl = "" })

require("dap-vscode-js").setup {
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
}

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb",
}

function foo()
    vim.lsp.buf_request(0, "experimental/runnables", {
        textDocument = vim.lsp.util.make_text_document_params(),
        position = nil, -- get em all
    }, function(_, result)
        for _, r in ipairs(result) do
            P(r)
        end
    end)
end

dap.configurations.rust = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            local binary = vim.fn.environ()["RUST_DEBUG_BINARY"] or "/target/debug/${workspaceFolderBasename}"
            return vim.fn.getcwd() .. binary
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
            local args = vim.fn.environ()["RUST_DEBUG_ARGS"]
            if args ~= nil then
                return vim.split(args, " ")
            end
            local co = coroutine.running()
            vim.ui.input({
                prompt = "Args: ",
                relative = "win",
            }, function(input)
                coroutine.resume(co, vim.split(input or "", " "))
            end)

            return coroutine.yield()
        end,
        env = function()
            local variables = {}
            for k, v in pairs(vim.fn.environ()) do
                table.insert(variables, string.format("%s=%s", k, v))
            end
            return variables
        end,
        initCommands = function()
            -- Find out where to look for the pretty printer Python module
            local rustc_sysroot = vim.fn.trim(vim.fn.system "rustc --print sysroot")

            local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
            local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

            local commands = {}
            local file = io.open(commands_file, "r")
            if file then
                for line in file:lines() do
                    table.insert(commands, line)
                end
                file:close()
            end
            table.insert(commands, 1, script_import)

            return commands
        end,
    },
}

dap.configurations.lua = {
    {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
        host = "127.0.0.1",
        port = function()
            local co = coroutine.running()
            vim.ui.input({
                prompt = "Port: ",
                relative = "win",
            }, function(input)
                coroutine.resume(co, tonumber(input))
            end)

            return coroutine.yield()
        end,
    },
}

dap.adapters.nlua = function(callback, config)
    callback { type = "server", host = config.host, port = config.port }
end

dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { "/usr/lib/vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.typescript = {
    {
        name = "Attach to docker",
        type = "node2",
        request = "attach",
        port = 9229,
        host = "localhost",
        sourceMaps = true,
        localRoot = "${workspaceFolder}",
        remoteRoot = "/app",
        sourceMapPathOverrides = {
            ["./*"] = "${workspaceFolder}/src/*",
        },
    },
    {
        name = "Attach",
        type = "node2",
        request = "attach",
        port = 9229,
        host = "localhost",
        sourceMaps = true,
        sourceMapPathOverrides = {
            ["./*"] = "${workspaceFolder}/src/*",
        },
    },
    {
        name = "Attach to Jest",
        type = "node2",
        request = "attach",
        port = 9228,
        host = "localhost",
        sourceMaps = true,
        sourceMapPathOverrides = {
            ["./*"] = "${workspaceFolder}/src/*",
        },
    },
    {
        name = "Jest Neotest",
        type = "pwa-node",
        request = "launch",
        runtimeExecutable = "node",
        runtimeArgs = {
            "-r",
            "tsconfig-paths/register",
            "-r",
            "ts-node/register node_modules/.bin/jest",
            "--runInBand",
            "--no-coverage",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
        sourceMaps = true,
        sourceMapPathOverrides = {
            ["./*"] = "${workspaceFolder}/src/*",
        },
    },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
