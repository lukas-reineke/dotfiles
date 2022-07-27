require "lsp.handlers"
local lspconfig = require "lspconfig"
local utils = require "utils"
local M = {}

vim.lsp.protocol.CompletionItemKind = {
    Text = " [text]",
    Method = " [method]",
    Function = " [function]",
    Constructor = " [constructor]",
    Field = "ﰠ [field]",
    Variable = " [variable]",
    Class = " [class]",
    Interface = " [interface]",
    Module = " [module]",
    Property = " [property]",
    Unit = " [unit]",
    Value = " [value]",
    Enum = " [enum]",
    Keyword = " [key]",
    Snippet = "﬌ [snippet]",
    Color = " [color]",
    File = " [file]",
    Reference = " [reference]",
    Folder = " [folder]",
    EnumMember = " [enum member]",
    Constant = " [constant]",
    Struct = " [struct]",
    Event = "⌘ [event]",
    Operator = " [operator]",
    TypeParameter = " [type]",
}

M.symbol_kind_icons = {
    Function = "",
    Method = "",
    Variable = "",
    Constant = "",
    Interface = "練",
    Field = "ﰠ",
    Property = "",
    Struct = "",
    Enum = "",
    Class = "",
    File = "",
    Module = "",
    Namespace = "",
    Package = "",
    Constructor = "",
    String = "",
    Number = "",
    Boolean = "◩",
    Array = "",
    Object = "",
    Key = "",
    Null = "ﳠ",
    EnumMember = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

M.symbol_kind_colors = {
    Function = "green",
    Method = "green",
    Variable = "blue",
    Constant = "red",
    Interface = "cyan",
    Field = "blue",
    Property = "blue",
    Struct = "cyan",
    Enum = "yellow",
    Class = "magenta",
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.fn.sign_define("DiagnosticSignError", { text = "", numhl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", numhl = "DiagnosticHint" })

local on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client)

    if client.supports_method "textDocument/documentSymbol" then
        require("nvim-navic").attach(client, bufnr)
    end

    if client.supports_method "textDocument/definition" then
        utils.map("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = true })
    end
    if client.supports_method "textDocument/implementation" then
        utils.map("n", "<space>&", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = true })
    end
    if client.supports_method "textDocument/hover" then
        utils.map("n", "<CR>", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = true })
    end
    if client.supports_method "textDocument/definition" then
        utils.map(
            "n",
            "<Space>*",
            ":lua require('lists').change_active('Quickfix')<CR>:lua vim.lsp.buf.references()<CR>",
            { buffer = true }
        )
    end
    if client.supports_method "textDocument/rename" then
        utils.map("n", "<Space>rn", "<cmd>lua require'lsp.rename'.rename()<CR>", { silent = true, buffer = true })
    end
    utils.map("n", "<Space>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true, buffer = true })

    require("lsp_signature").on_attach {
        hint_enable = false,
        hi_parameter = "QuickFixLine",
        handler_opts = {
            border = vim.g.floating_window_border,
        },
    }

    utils.map("n", "<Space><CR>", "<cmd>lua require'lsp.diagnostics'.line_diagnostics()<CR>", { buffer = true })
end

function _G.activeLSP()
    local servers = {}
    for _, lsp in pairs(vim.lsp.get_active_clients()) do
        table.insert(servers, { name = lsp.name, id = lsp.id })
    end
    _G.P(servers)
end
function _G.bufferActiveLSP()
    local servers = {}
    for _, lsp in pairs(vim.lsp.buf_get_clients()) do
        table.insert(servers, { name = lsp.name, id = lsp.id })
    end
    _G.P(servers)
end

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
        },
    },
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.pyright.setup { capabilities = capabilities, on_attach = on_attach }

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
lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "lua-language-server" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = { "lua/?.lua", "lua/?/init.lua" },
            },
            completion = {
                keywordSnippet = "Disable",
                callSnippet = "Replace",
            },
            workspace = {
                ignoreDir = "~/.config/nvim/backups",
                maxPreload = 10000,
                preloadFileSize = 10000,
            },
            diagnostics = {
                enable = true,
                globals = {
                    -- Neovim
                    "vim",
                    -- Busted
                    "describe",
                    "it",
                    "before_each",
                    "after_each",
                    "teardown",
                    "pending",
                    -- packer
                    "use",
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
                workspace = {
                    library = get_lua_runtime(),
                    maxPreload = 1000,
                    preloadFileSize = 1000,
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
    cmd = { "json-languageserver", "--stdio" },
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
lspconfig.yamlls.setup { capabilities = capabilities, on_attach = on_attach }

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
-- https://github.com/mattn/efm-langserver
lspconfig.efm.setup {
    capabilities = capabilities,
    cmd = { "/home/lukas/dev/golib/bin/efm-langserver" },
    on_attach = on_attach,
    init_options = { documentFormatting = true },
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = { ".git/" },
        lintDebounce = 100,
        -- logLevel = 5,
        languages = {
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
            markdown = { prettier },
            sh = { shellcheck, shfmt },
            terraform = { terraform },
            rego = { opa },
        },
    },
}

lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

return M
