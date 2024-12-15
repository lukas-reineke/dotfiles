return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
        "jbyuki/one-small-step-for-vimkind",
        "mxsdev/nvim-dap-vscode-js",
        "LiadOz/nvim-dap-repl-highlights",
    },
    keys = {
        "<Space>dc",
        "<Space>db",
        "<Space>dB",
    },
    config = function()
        require("dap-go").setup()
        require("dap-python").setup()
        require("nvim-dap-repl-highlights").setup()
        local lists = require "lists"
        local dap = require "dap"
        local dapui = require "dapui"

        require("nvim-dap-virtual-text").setup {
            all_frames = true,
        }

        dapui.setup {
            icons = { expanded = "", collapsed = "" },
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.5 },
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 0.3,
                    position = "right",
                },
                -- {
                --     elements = {
                --         -- "repl",
                --         "console",
                --     },
                --     size = 0.35,
                --     position = "right",
                -- },
            },
            floating = {
                border = vim.g.floating_window_border,
            },
        }

        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "Function", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "Comment", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "🠶", texthl = "String", linehl = "DiffAdd", numhl = "" })

        require("dap-vscode-js").setup {
            adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
        }

        local cargo_compiled_changedtick = -1
        local cargo_config = nil

        local function parse_cargo_metadata(cargo_metadata)
            for i = 1, #cargo_metadata do
                local json_table = cargo_metadata[#cargo_metadata + 1 - i]
                if string.len(json_table) ~= 0 then
                    json_table = vim.json.decode(json_table)
                    if json_table["reason"] == "compiler-artifact" and json_table["executable"] ~= vim.NIL then
                        return json_table["executable"]
                    end
                end
            end

            return nil
        end

        -- Largely based on https://github.com/mfussenegger/nvim-dap/discussions/671#discussioncomment-4286738
        local function cargo_inspector(config)
            if cargo_compiled_changedtick == vim.g.rust_changedtick and cargo_config ~= nil then
                return cargo_config
            end

            local final_config = vim.deepcopy(config)
            local compiler_msg_buf = vim.api.nvim_create_buf(false, true)
            vim.api.nvim_set_option_value("buftype", "nofile", { buf = compiler_msg_buf })
            local window_width = 100
            local window_height = 12
            local compiler_msg_window = vim.api.nvim_open_win(compiler_msg_buf, false, {
                relative = "editor",
                width = window_width,
                height = window_height,
                col = vim.api.nvim_get_option_value("columns", {}) - window_width - 1,
                row = vim.api.nvim_get_option_value("lines", {}) - window_height - 1,
                border = vim.g.floating_window_border_dark,
                style = "minimal",
                title = "Cargo build",
            })

            local message_format = "--message-format=json"
            if final_config.cargo.args ~= nil then
                table.insert(final_config.cargo.args, message_format)
            else
                final_config.cargo.args = { message_format }
            end
            table.insert(final_config.cargo.args, 1, "cargo")

            local compiler_metadata = {}
            local cargo_job = vim.fn.jobstart(final_config.cargo.args, {
                clear_env = false,
                env = final_config.cargo.env,
                cwd = final_config.cwd,

                stdout_buffered = true,
                on_stdout = function(_, data)
                    compiler_metadata = data
                end,

                on_stderr = function(_, data)
                    local complete_line = ""

                    for _, partial_line in ipairs(data) do
                        if string.len(partial_line) ~= 0 then
                            complete_line = complete_line .. partial_line
                        end
                    end

                    if vim.api.nvim_buf_is_valid(compiler_msg_buf) then
                        vim.fn.appendbufline(compiler_msg_buf, "$", complete_line)
                        vim.api.nvim_win_set_cursor(
                            compiler_msg_window,
                            { vim.api.nvim_buf_line_count(compiler_msg_buf), 1 }
                        )
                        vim.cmd "redraw"
                    end
                end,

                on_exit = function(_, exit_code)
                    if vim.api.nvim_win_is_valid(compiler_msg_window) then
                        vim.api.nvim_win_close(compiler_msg_window, true)
                    end

                    if vim.api.nvim_buf_is_valid(compiler_msg_buf) then
                        vim.api.nvim_buf_delete(compiler_msg_buf, { force = true })
                    end

                    if exit_code == 0 then
                        local executable_name = parse_cargo_metadata(compiler_metadata)
                        if executable_name ~= nil then
                            final_config.program = executable_name
                            cargo_compiled_changedtick = vim.g.rust_changedtick
                        else
                            vim.notify(
                                "Cargo could not find an executable for debug configuration:\n\n\t" .. final_config.name,
                                vim.log.levels.ERROR
                            )
                        end
                    else
                        vim.notify(
                            "Cargo failed to compile debug configuration:\n\n\t" .. final_config.name,
                            vim.log.levels.ERROR
                        )
                    end
                end,
            })

            -- rustup
            -- local rust_hash = ""
            -- local rust_hash_stdout = {}
            -- local rust_hash_job = vim.fn.jobstart({ "rustc", "--version", "--verbose" }, {
            --     clear_env = false,
            --     stdout_buffered = true,
            --     on_stdout = function(_, data)
            --         rust_hash_stdout = data
            --     end,
            --     on_exit = function()
            --         for _, line in pairs(rust_hash_stdout) do
            --             local start, finish = string.find(line, "commit-hash: ", 1, true)
            --
            --             if start ~= nil then
            --                 rust_hash = string.sub(line, finish + 1)
            --             end
            --         end
            --     end,
            -- })

            -- system install
            local rust_version = ""
            local rust_version_stdout = {}
            local rust_version_job = vim.fn.jobstart({ "rustc", "--version" }, {
                clear_env = false,
                stdout_buffered = true,
                on_stdout = function(_, data)
                    rust_version_stdout = data
                end,
                on_exit = function()
                    rust_version = vim.split(rust_version_stdout[1], " ")[2]
                end,
            })

            local rust_source_path = ""
            local rust_source_job = vim.fn.jobstart({ "rustc", "--print", "sysroot" }, {
                clear_env = false,
                stdout_buffered = true,
                on_stdout = function(_, data)
                    rust_source_path = data[1]
                end,
            })

            vim.fn.jobwait {
                cargo_job,
                rust_version_job,
                -- rust_hash_job,
                rust_source_job,
            }

            local src_path
            for _, src_dir in pairs { "src", "rustc-src" } do
                src_path = vim.fs.joinpath(rust_source_path, "lib", "rustlib", src_dir, "rust")
                if vim.uv.fs_stat(src_path) then
                    break
                end
                src_path = nil
            end

            final_config.sourceLanguages = { "rust" }
            if src_path ~= nil then
                if final_config.sourceMap == nil then
                    final_config["sourceMap"] = {}
                end
                -- rustup
                -- final_config.sourceMap["/rustc/" .. rust_hash] = src_path
                -- system install
                final_config.sourceMap["/usr/src/debug/rust/rustc-" .. rust_version .. "-src/"] = src_path
            end
            final_config.cargo = nil
            cargo_config = final_config

            return final_config
        end

        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "codelldb",
                args = { "--port", "${port}" },
            },
            enrich_config = function(config, on_config)
                if config["cargo"] ~= nil then
                    on_config(cargo_inspector(config))
                end
            end,
        }

        dap.defaults.fallback.external_terminal = {
            command = "tmux",
            args = { "new-window", "-t", "mapbox-runtime", "-n", "Debug", "-c", "<desired-root-dir>" },
        }
        dap.defaults.fallback.force_external_terminal = true

        dap.configurations.rust = {
            {
                name = "Launch",
                type = "codelldb",
                request = "launch",
                args = function()
                    local args = vim.g.dap_args or os.getenv "RUST_DEBUG_ARGS"
                    if args ~= nil then
                        return vim.split(args:gsub("\n", ""), " ")
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
                cwd = "${workspaceFolder}",
                externalConsole = true,
                stopOnEntry = false,
                cargo = {
                    args = { "build" },
                },
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

        vim.keymap.set("n", "<Space>dc", dap.continue)
        vim.keymap.set("n", "<Space>db", dap.toggle_breakpoint)
        vim.keymap.set("n", "<Space>dB", function()
            dap.toggle_breakpoint(vim.fn.input "Breakpoint condition: ")
        end)
        vim.keymap.set("n", "<Space>do", dapui.toggle)
        vim.keymap.set("n", "<Space>di", function()
            lists.change_active "Quickfix"
            dap.list_breakpoints()
            vim.cmd [[copen]]
        end)
        vim.keymap.set("n", "<Space>dp", function()
            dap.terminate()
            dap.clear_breakpoints()
        end)
        vim.keymap.set("n", "<Space>d<CR>", dapui.eval)
        vim.keymap.set("n", "<Space>dh", dap.step_out)
        vim.keymap.set("n", "<Space>dj", dap.step_over)
        vim.keymap.set("n", "<Space>dk", dap.step_back)
        vim.keymap.set("n", "<Space>dl", dap.step_into)
        vim.keymap.set("n", "<Space>dy", dap.terminate)
        vim.keymap.set("n", "<Space>dJ", dap.run_to_cursor)
    end,
}
