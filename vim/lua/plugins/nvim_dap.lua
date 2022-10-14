local dap = require "dap"
local dapui = require "dapui"

vim.fn.sign_define("DapBreakpoint", { text = "ﱣ", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ﱣ", texthl = "Function", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "Comment", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🠶", texthl = "String", linehl = "DiffAdd", numhl = "" })

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb",
}

dap.configurations.rust = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.getcwd() .. "/target/debug/${workspaceFolderBasename}"
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
            local co = coroutine.running()
            vim.ui.input({
                prompt = "Args: ",
                relative = "win",
            }, function(input)
                coroutine.resume(co, vim.split(input or "", " "))
            end)

            return coroutine.yield()
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
