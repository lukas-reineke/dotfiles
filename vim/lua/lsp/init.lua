require "lsp.handlers"
local lspconfig = require "lspconfig"
local methods = vim.lsp.protocol.Methods
local M = {}

vim.lsp.protocol.CompletionItemKind = {
    Text = " [text]",
    Method = " [method]",
    Function = "󰊕 [function]",
    Constructor = " [constructor]",
    Field = " [field]",
    Variable = " [variable]",
    Class = " [class]",
    Interface = "i [interface]",
    Module = "󰌗 [module]",
    Property = " [property]",
    Unit = " [unit]",
    Value = "󰕘 [value]",
    Enum = " [enum]",
    Keyword = "󰌆 [key]",
    Snippet = " [snippet]",
    Color = " [color]",
    File = " [file]",
    Reference = " [reference]",
    Folder = " [folder]",
    EnumMember = " [enum member]",
    Constant = " [constant]",
    Struct = " [struct]",
    Event = "⌘ [event]",
    Operator = "󰆕 [operator]",
    TypeParameter = "󰊄 [type]",
}

M.symbol_kind_icons = {
    Function = "󰊕",
    Method = "",
    Variable = "",
    Constant = "",
    Interface = "i",
    Field = "",
    Property = "",
    Struct = "",
    Enum = "",
    Class = "",
    File = "",
    Module = "󰌗",
    Namespace = "󰌗",
    Package = "",
    Constructor = "",
    String = "",
    Number = "󰎠",
    Boolean = "◩",
    Array = "󰅪",
    Object = "",
    Key = "󰌆",
    Null = "󰟢",
    EnumMember = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰊄",
}

M.symbol_kind_colors = {
    Function = "green",
    Method = "green",
    Module = "blue",
    Variable = "blue",
    Constant = "red",
    Interface = "cyan",
    Field = "blue",
    Property = "blue",
    Struct = "cyan",
    Enum = "yellow",
    EnumMember = "yellow",
    Class = "magenta",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.experimental = {
    hoverActions = true,
    hoverRange = true,
    serverStatusNotification = true,
    snippetTextEdit = true,
    codeActionGroup = true,
    ssr = true,
    commands = {
        commands = {
            "rust-analyzer.runSingle",
            "rust-analyzer.debugSingle",
            "rust-analyzer.showReferences",
            "rust-analyzer.gotoLocation",
            "editor.action.triggerParameterHints",
        },
    },
}

vim.fn.sign_define("DiagnosticSignError", { text = "", numhl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", numhl = "DiagnosticHint" })

local group = vim.api.nvim_create_augroup("MyLSPAutogroup", {})

local on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)

    if client.supports_method "textDocument/inlayHint" then
        vim.lsp.inlay_hint.enable(bufnr, true)
    end

    -- if client.supports_method "textDocument/documentSymbol" and client.name ~= "bashls" then
    -- require("nvim-navic").attach(client, bufnr)
    -- end

    if client.supports_method "textDocument/definition" then
        vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, { buffer = bufnr })
    end
    if client.supports_method "textDocument/implementation" then
        vim.keymap.set("n", "<space>&", vim.lsp.buf.implementation, { buffer = bufnr })
    end
    if client.supports_method "textDocument/hover" then
        vim.keymap.set("n", "<CR>", vim.lsp.buf.hover, { buffer = bufnr })
    end
    if client.supports_method "textDocument/definition" then
        vim.keymap.set("n", "<Space>*", function()
            require("lists").change_active "Quickfix"
            vim.lsp.buf.references()
        end, { buffer = bufnr })
    end
    if client.supports_method "textDocument/rename" then
        vim.keymap.set("n", "<Space>rn", require("lsp.rename").rename, { buffer = bufnr })
    end

    if client.supports_method "textDocument/codeLens" then
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
            group = group,
            pattern = "<buffer>",
            callback = function()
                vim.lsp.codelens.refresh()
            end,
        })
        -- -- dirty hack
        -- local timer = vim.uv.new_timer()
        -- timer:start(300, 0, function()
        --     timer:close()
        --     vim.schedule_wrap(function()
        --         vim.lsp.codelens.refresh()
        --     end)()
        -- end)
    end

    require("lsp_signature").on_attach {
        hint_enable = false,
        hi_parameter = "QuickFixLine",
        handler_opts = {
            border = vim.g.floating_window_border,
        },
    }

    vim.keymap.set("n", "<Space><CR>", require("lsp.diagnostics").line_diagnostics, { buffer = bufnr })
end

local float_ns = vim.api.nvim_create_namespace "lsp_float"
---LSP handler that adds extra inline highlights, keymaps, and window options.
---Code inspired from `noice` and `MariaSolOs`.
---@param handler fun(err: any, result: any, ctx: any, config: any): integer, integer
---@return function
local function enhanced_float_handler(handler)
    return function(err, result, ctx, config)
        local buf, win = handler(
            err,
            result,
            ctx,
            vim.tbl_deep_extend("force", config or {}, {
                border = vim.g.floating_window_border,
                max_height = math.floor(vim.o.lines * 0.5),
                max_width = math.floor(vim.o.columns * 0.4),
            })
        )

        if not buf or not win then
            return
        end

        -- Extra highlights.
        for l, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
            for pattern, hl_group in pairs {
                ["|%S-|"] = "@text.reference",
                ["@%S+"] = "@parameter",
                ["^%s*(Parameters:)"] = "@text.title",
                ["^%s*(Return:)"] = "@text.title",
                ["^%s*(See also:)"] = "@text.title",
                ["{%S-}"] = "@parameter",
            } do
                local from = 1 ---@type integer?
                while from do
                    local to
                    from, to = line:find(pattern, from)
                    if from then
                        vim.api.nvim_buf_set_extmark(buf, float_ns, l - 1, from - 1, {
                            end_col = to,
                            hl_group = hl_group,
                        })
                    end
                    from = to and to + 1 or nil
                end
            end
        end

        -- Add keymaps for opening links.
        if not vim.b[buf].markdown_keys then
            vim.keymap.set("n", "<CR>", function()
                -- Vim help links.
                local url = (vim.fn.expand "<cWORD>" --[[@as string]]):match "|(%S-)|"
                if url then
                    return vim.cmd.help(url)
                end

                -- Markdown links.
                local col = vim.api.nvim_win_get_cursor(0)[2] + 1
                local from, to
                from, to, url = vim.api.nvim_get_current_line():find "%[.-%]%((%S-)%)"
                if from and col >= from and col <= to then
                    vim.system({ "open", url }, nil, function(res)
                        if res.code ~= 0 then
                            vim.notify("Failed to open URL" .. url, vim.log.levels.ERROR)
                        end
                    end)
                end
            end, { buffer = buf, silent = true })
            vim.b[buf].markdown_keys = true
        end
    end
end

vim.lsp.handlers[methods.textDocument_hover] = enhanced_float_handler(vim.lsp.handlers.hover)
vim.lsp.handlers[methods.textDocument_signatureHelp] = enhanced_float_handler(vim.lsp.handlers.signature_help)

-- https://github.com/golang/tools/tree/master/gopls
lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        gopls = {
            usePlaceholders = true,
            analyses = {
                nilness = true,
                shadow = true,
                unusedparams = true,
                unusewrites = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            lens = {
                enabled = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
}

lspconfig.taplo.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.pyright.setup { capabilities = capabilities, on_attach = on_attach }

lspconfig.ruff_lsp.setup { capabilities = capabilities, on_attach = on_attach }

-- https://github.com/theia-ide/typescript-language-server
lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    single_file_support = true,
    init_options = {
        preferences = {
            includeCompletionsWithSnippetText = true,
            includeCompletionsWithInsertText = true,
        },
    },
    settings = {
        completions = {
            completeFunctionCalls = true,
        },
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
}

local function get_lua_runtime()
    local result = {}
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. "/lua/"
        if vim.fn.isdirectory(lua_path) then
            result[lua_path] = true
        end
    end
    result[vim.fn.expand "$VIMRUNTIME/lua"] = true
    result[vim.fn.expand "~/dev/neovim/src/nvim/lua"] = true

    return result
end

lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "lua-language-server" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = { "?.lua", "?/init.lua" },
            },
            format = {
                enable = false,
            },
            hint = {
                enable = true,
                arrayIndex = "Disable",
                setType = true,
            },
            completion = {
                keywordSnippet = "Disable",
                callSnippet = "Replace",
            },
            workspace = {
                checkThirdParty = false,
                library = get_lua_runtime(),
                ignoreDir = "~/.config/nvim/backups",
                maxPreload = 10000,
                preloadFileSize = 10000,
            },
            diagnostics = {
                enable = true,
                globals = {
                    -- luasnip
                    "s",
                    "i",
                    "fmt",
                    "rep",
                    "conds",
                    "f",
                    "c",
                    "t",
                },
            },
        },
    },
}

-- https://github.com/iamcco/vim-language-server
lspconfig.vimls.setup { capabilities = capabilities, on_attach = on_attach }

-- https://github.com/vscode-langservers/vscode-json-languageserver
lspconfig.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "vscode-json-languageserver", "--stdio" },
    settings = {
        json = {
            -- Schemas https://www.schemastore.org
            schemas = {
                {
                    fileMatch = { "package.json" },
                    url = "https://json.schemastore.org/package.json",
                },
                {
                    fileMatch = { "tsconfig*.json" },
                    url = "https://json.schemastore.org/tsconfig.json",
                },
                {
                    fileMatch = {
                        ".prettierrc",
                        ".prettierrc.json",
                        "prettier.config.json",
                    },
                    url = "https://json.schemastore.org/prettierrc.json",
                },
                {
                    fileMatch = { ".eslintrc", ".eslintrc.json" },
                    url = "https://json.schemastore.org/eslintrc.json",
                },
                {
                    fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                    url = "https://json.schemastore.org/babelrc.json",
                },
                {
                    fileMatch = { "lerna.json" },
                    url = "https://json.schemastore.org/lerna.json",
                },
                {
                    fileMatch = {
                        ".stylelintrc",
                        ".stylelintrc.json",
                        "stylelint.config.json",
                    },
                    url = "http://json.schemastore.org/stylelintrc.json",
                },
                {
                    fileMatch = { "/.github/workflows/*" },
                    url = "https://json.schemastore.org/github-workflow.json",
                },
            },
        },
    },
}

-- https://github.com/redhat-developer/yaml-language-server
lspconfig.yamlls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://kubernetesjsonschema.dev/v1.10.3-standalone/service-v1.json"] = "*service.yaml",
                ["https://kubernetesjsonschema.dev/v1.14.0/deployment-apps-v1.json"] = "*deployment.yaml",
                ["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
            },
        },
    },
}

-- https://github.com/joe-re/sql-language-server
lspconfig.sqlls.setup { capabilities = capabilities, on_attach = on_attach }

-- https://github.com/vscode-langservers/vscode-css-languageserver-bin
lspconfig.cssls.setup { capabilities = capabilities, on_attach = on_attach }

-- https://github.com/vscode-langservers/vscode-html-languageserver-bin
lspconfig.html.setup { cmd = { "vscode-html-languageserver" }, capabilities = capabilities, on_attach = on_attach }

-- https://github.com/bash-lsp/bash-language-server
lspconfig.bashls.setup { capabilities = capabilities, on_attach = on_attach }

-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
lspconfig.dockerls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- https://github.com/hashicorp/terraform-ls
lspconfig.terraformls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "terraform-ls", "serve" },
    filetypes = { "tf" },
}

local vint = require "efm/vint"
local stylua = require "efm/stylua"
local luacheck = require "efm/luacheck"
local staticcheck = require "efm/staticcheck"
local go_vet = require "efm/go_vet"
local goimports = require "efm/goimports"
local black = require "efm/black"
local isort = require "efm/isort"
local flake8 = require "efm/flake8"
local mypy = require "efm/mypy"
local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
local shellcheck = require "efm/shellcheck"
local shfmt = require "efm/shfmt"
local terraform = require "efm/terraform"
local misspell = require "efm/misspell"
local opa = require "efm/opa"
local cbfmt = require "efm/cbfmt"
-- https://github.com/mattn/efm-langserver

local languages = {
    ["="] = { misspell },
    vim = { vint },
    lua = { stylua, luacheck },
    go = { staticcheck, goimports, go_vet },
    python = { black, isort, flake8, mypy },
    typescript = { prettier, eslint },
    javascript = { prettier, eslint },
    typescriptreact = { prettier, eslint },
    javascriptreact = { prettier, eslint },
    yaml = { prettier },
    json = { prettier },
    html = { prettier },
    scss = { prettier },
    css = { prettier },
    markdown = { prettier, cbfmt },
    org = { cbfmt },
    sh = { shellcheck, shfmt },
    terraform = { terraform },
    rego = { opa },
}
lspconfig.efm.setup {
    capabilities = capabilities,
    cmd = { "/home/lukas/dev/golib/bin/efm-langserver" },
    on_attach = on_attach,
    init_options = { documentFormatting = true },
    root_dir = vim.loop.cwd,
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { ".git/" },
        lintDebounce = "500ms",
        -- logLevel = 5,
        languages = languages,
    },
}

-- lspconfig.clangd.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }

lspconfig.marksman.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

return M
