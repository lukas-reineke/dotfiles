local lspconfig = require "lspconfig"

local map = function(mode, key, result, noremap)
    if noremap == nil then
        noremap = true
    end
    vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = noremap, silent = true})
end

vim.g.completion_enable_auto_popup = false
vim.g.completion_enable_snippet = "UltiSnips"
vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy", "all"}
vim.g.completion_auto_change_source = 1
vim.g.completion_matching_smart_case = 1
vim.g.completion_chain_complete_list = {
    default = {
        {complete_items = {"lsp"}},
        {complete_items = {"snippet"}},
        {complete_items = {"path"}},
        {mode = "<c-n>"},
        {mode = "dict"}
    }
}
vim.g.completion_enable_auto_paren = 1
vim.g.completion_customize_lsp_label = {
    Function = " [function]",
    Method = " [method]",
    Reference = " [refrence]",
    Enum = " [enum]",
    Field = "ﰠ [field]",
    Keyword = " [key]",
    Variable = " [variable]",
    Folder = " [folder]",
    Snippet = " [snippet]",
    Operator = " [operator]",
    Module = " [module]",
    Text = "ﮜ[text]",
    Class = " [class]",
    Interface = " [interface]"
}

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.cmd("noautocmd :update")
            vim.cmd("GitGutter")
        end
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
    vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            underline = true,
            update_in_insert = false
        }
    )(...)
    pcall(vim.lsp.diagnostic.set_loclist, {open_loclist = false})
end

local format_options_prettier = {
    tabWidth = 4,
    singleQuote = true,
    trailingComma = "all",
    configPrecedence = "prefer-file"
}
vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_scss = format_options_prettier
vim.g.format_options_html = format_options_prettier
vim.g.format_options_yaml = format_options_prettier
vim.g.format_options_markdown = format_options_prettier

FormatToggle = function(value)
    vim.g[string.format("format_disabled_%s", vim.bo.filetype)] = value
end
vim.cmd [[command! FormatDisable lua FormatToggle(true)]]
vim.cmd [[command! FormatEndable lua FormatToggle(false)]]

_G.formatting = function()
    if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
        vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
    end
end

local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
        vim.cmd [[augroup END]]
    end
    if client.resolved_capabilities.goto_definition then
        map("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
    end
    if client.resolved_capabilities.completion then
        require "completion".on_attach(client)
        map("i", "<c-n>", "<Plug>(completion_trigger)", false)
        map("i", "<c-j>", "<Plug>(completion_next_source)", false)
        map("i", "<c-k>", "<Plug>(completion_prev_source)", false)
    end
    if client.resolved_capabilities.hover then
        map("n", "<CR>", "<cmd>lua vim.lsp.buf.hover()<CR>")
    end
    if client.resolved_capabilities.find_references then
        map("n", "<Leader>*", ":call lists#ChangeActiveList('Quickfix')<CR>:lua vim.lsp.buf.references()<CR>")
    end
    if client.resolved_capabilities.rename then
        map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    end
end

function _G.activeLSP()
    local servers = {}
    for _, lsp in pairs(vim.lsp.get_active_clients()) do
        table.insert(servers, {name = lsp.name, id = lsp.id})
    end
    _G.dump(servers)
end
function _G.bufferActiveLSP()
    local servers = {}
    for _, lsp in pairs(vim.lsp.buf_get_clients()) do
        table.insert(servers, {name = lsp.name, id = lsp.id})
    end
    _G.dump(servers)
end

-- https://github.com/golang/tools/tree/master/gopls
lspconfig.gopls.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

-- https://github.com/palantir/python-language-server
lspconfig.pyls.setup {
    on_attach = on_attach,
    settings = {
        pyls = {
            plugins = {
                pycodestyle = {
                    enabled = false,
                    ignore = {
                        "E501"
                    }
                }
            }
        }
    }
}

lspconfig.pyright.setup {on_attach = on_attach}

-- https://github.com/theia-ide/typescript-language-server
lspconfig.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

-- https://github.com/sumneko/lua-language-server
-- require("nlua.lsp.nvim").setup(
--     lspconfig,
--     {
--         on_attach = on_attach,
--         cmd = {"lua-language-server"}
--     }
-- )

local function get_lua_runtime()
    local result = {}
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. "/lua/"
        if vim.fn.isdirectory(lua_path) then
            result[lua_path] = true
        end
    end
    result[vim.fn.expand("$VIMRUNTIME/lua")] = true
    result[vim.fn.expand("~/build/neovim/src/nvim/lua")] = true

    return result
end
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {"lua-language-server"},
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            completion = {
                keywordSnippet = "Disable"
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
                    "pending"
                },
                workspace = {
                    library = get_lua_runtime(),
                    maxPreload = 1000,
                    preloadFileSize = 1000
                }
            }
        }
    }
}

-- https://github.com/iamcco/vim-language-server
lspconfig.vimls.setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-json-languageserver
lspconfig.jsonls.setup {
    on_attach = on_attach,
    cmd = {"json-languageserver", "--stdio"}
}

-- https://github.com/redhat-developer/yaml-language-server
lspconfig.yamlls.setup {on_attach = on_attach}

-- https://github.com/joe-re/sql-language-server
lspconfig.sqlls.setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-css-languageserver-bin
lspconfig.cssls.setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-html-languageserver-bin
lspconfig.html.setup {on_attach = on_attach}

-- https://github.com/bash-lsp/bash-language-server
lspconfig.bashls.setup {on_attach = on_attach}

-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
lspconfig.dockerls.setup {on_attach = on_attach}

-- https://github.com/hashicorp/terraform-ls
lspconfig.terraformls.setup {
    on_attach = on_attach,
    cmd = {"terraform-ls", "serve"},
    filetypes = {"tf"}
}

local vint = require "efm/vint"
local luafmt = require "efm/luafmt"
local golint = require "efm/golint"
local goimports = require "efm/goimports"
local black = require "efm/black"
local isort = require "efm/isort"
local flake8 = require "efm/flake8"
local mypy = require "efm/mypy"
local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
local shellcheck = require "efm/shellcheck"
local terraform = require "efm/terraform"
local misspell = require "efm/misspell"
-- https://github.com/mattn/efm-langserver
lspconfig.efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            ["="] = {misspell},
            vim = {vint},
            lua = {luafmt},
            go = {golint, goimports},
            python = {black, isort, flake8, mypy},
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            markdown = {prettier},
            sh = {shellcheck},
            tf = {terraform}
        }
    }
}

lspconfig.clangd.setup {on_attach = on_attach}
