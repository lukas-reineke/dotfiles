local nvim_lsp = require "nvim_lsp"
local configs = require "nvim_lsp/configs"
local util = require "nvim_lsp/util"

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
vim.g.completion_chain_complete_list = {
    default = {
        {complete_items = {"lsp"}},
        {complete_items = {"snippet"}},
        {complete_items = {"path"}, triggered_only = {"/"}},
        {mode = "<c-n>"}
    }
}
vim.g.completion_enable_auto_paren = 1

vim.fn.sign_define("LspDiagnosticsSignError", {text = " ", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = " ", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = " ", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = " ", numhl = "LspDiagnosticsDefaultHint"})

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        vim.api.nvim_command("noautocmd :update")
        vim.api.nvim_command("GitGutter")
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
    vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            -- Enable underline, use default values
            underline = true,
            -- Enable virtual text, override spacing to 4
            -- virtual_text = {
            --   spacing = 2,
            --   prefix = '~',
            -- },
            -- Use a function to dynamically turn signs off
            -- and on, using buffer local variables
            -- signs = function(bufnr, client_id)
            --   return vim.bo[bufnr].show_signs == false
            -- end,
            -- ■
            -- Disable a feature
            update_in_insert = false
        }
    )(...)
    vim.lsp.diagnostic.set_loclist({open_loclist = false})
end

local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
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

-- https://github.com/golang/tools/tree/master/gopls
nvim_lsp.gopls.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

-- https://github.com/palantir/python-language-server
-- nvim_lsp.pyls.setup {
--     on_attach = on_attach,
--     settings = {
--         pyls = {
--             plugins = {
--                 pycodestyle = {
--                     enabled = false,
--                     ignore = {
--                         "E501"
--                     }
--                 }
--             }
--         }
--     }
-- }

-- https://github.com/theia-ide/typescript-language-server
nvim_lsp.tsserver.setup {on_attach = on_attach}

-- https://github.com/sumneko/lua-language-server
require("nlua.lsp.nvim").setup(
    nvim_lsp,
    {
        on_attach = on_attach,
        cmd = {"lua-language-server"}
    }
)

-- https://github.com/iamcco/vim-language-server
nvim_lsp.vimls.setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-json-languageserver
nvim_lsp.jsonls.setup {
    on_attach = on_attach,
    cmd = {
        "json-languageserver",
        "--stdio"
    }
}

-- https://github.com/redhat-developer/yaml-language-server
nvim_lsp.yamlls.setup {on_attach = on_attach}

-- https://github.com/joe-re/sql-language-server
nvim_lsp.sqlls.setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-css-languageserver-bin
nvim_lsp.cssls.setup {on_attach = on_attach}

-- https://github.com/vscode-langservers/vscode-html-languageserver-bin
nvim_lsp.html.setup {on_attach = on_attach}

-- https://github.com/bash-lsp/bash-language-server
nvim_lsp.bashls.setup {on_attach = on_attach}

-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
nvim_lsp.dockerls.setup {on_attach = on_attach}

-- https://github.com/hashicorp/terraform-ls
nvim_lsp.terraformls.setup {
    on_attach = on_attach,
    cmd = {
        "terraform-ls",
        "serve"
    }
}

-- https://github.com/mattn/efm-langserver
nvim_lsp.efm.setup {on_attach = on_attach}

configs["pyright"] = {
    default_config = {
        cmd = {"pyright-langserver", "--stdio"},
        filetypes = {"python"},
        root_dir = util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt"),
        settings = {
            analysis = {autoSearchPaths = true},
            pyright = {useLibraryCodeForTypes = true}
        },
        before_init = function(initialize_params)
            initialize_params["workspaceFolders"] = {
                {
                    name = "workspace",
                    uri = initialize_params["rootUri"]
                }
            }
        end
    }
}

nvim_lsp.pyright.setup {on_attach = on_attach}
