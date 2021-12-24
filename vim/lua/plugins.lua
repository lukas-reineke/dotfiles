vim.g.loaded_netrwPlugin = false
vim.cmd [[packadd cfilter]]

require("packer").startup {
    function()
        use "wbthomason/packer.nvim"

        use "neovim/nvim-lspconfig"
        use "ray-x/lsp_signature.nvim"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"

        use {
            "hrsh7th/nvim-cmp",
            requires = {
                { "andersevenrud/compe-tmux", branch = "cmp" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/cmp-path" },
                { "hrsh7th/cmp-nvim-lua" },
                { "hrsh7th/cmp-nvim-lsp" },
                { "saadparwaiz1/cmp_luasnip" },
                { "hrsh7th/cmp-cmdline" },
                { "~/dev/cmp-under-comparator" },
                { "~/dev/cmp-rg" },
                { "octaltree/cmp-look" },
            },
            config = function()
                local cmp = require "cmp"
                local cmp_compare = require "cmp_compare"
                cmp.setup {
                    completion = {
                        autocomplete = false,
                    },

                    mapping = {
                        ["<C-d>"] = cmp.mapping.scroll_docs(-5),
                        ["<C-f>"] = cmp.mapping.scroll_docs(5),
                        ["<C-e>"] = cmp.mapping.close(),
                        ["<CR>"] = function(fallback)
                            if cmp.visible() then
                                return cmp.mapping.confirm {
                                    behavior = cmp.ConfirmBehavior.Insert,
                                    select = true,
                                }(fallback)
                            else
                                return fallback()
                            end
                        end,
                        ["<c-n>"] = function(fallback)
                            if cmp.visible() then
                                return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }(fallback)
                            else
                                return cmp.mapping.complete()(fallback)
                            end
                        end,
                        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    },

                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    },

                    sorting = {
                        comparators = {
                            cmp.config.compare.offset,
                            cmp.config.compare.exact,
                            cmp.config.compare.score,
                            require("cmp-under-comparator").under,
                            cmp_compare.kind,
                            cmp.config.compare.sort_text,
                            cmp.config.compare.length,
                            cmp.config.compare.order,
                        },
                    },

                    sources = {
                        { name = "path", priority_weight = 110 },
                        { name = "nvim_lsp", max_item_count = 20, priority_weight = 100 },
                        { name = "nvim_lua", priority_weight = 90 },
                        { name = "luasnip", priority_weight = 80 },
                        { name = "buffer", max_item_count = 5, priority_weight = 70 },
                        { name = "rg", keyword_length = 5, max_item_count = 5, priority_weight = 60 },
                        { name = "tmux", max_item_count = 5, opts = { all_panes = false }, priority_weight = 50 },
                        {
                            name = "look",
                            keyword_length = 5,
                            max_item_count = 5,
                            opts = { convert_case = true, loud = true },
                            priority_weight = 40,
                        },
                    },

                    formatting = {
                        format = function(entry, vim_item)
                            local menu_map = {
                                gh_issues = "[Issues]",
                                buffer = "[Buf]",
                                nvim_lsp = "[LSP]",
                                nvim_lua = "[API]",
                                path = "[Path]",
                                luasnip = "[Snip]",
                                tmux = "[Tmux]",
                                look = "[Look]",
                                rg = "[RG]",
                            }
                            vim_item.menu = menu_map[entry.source.name] or string.format("[%s]", entry.source.name)

                            vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
                            return vim_item
                        end,
                    },

                    documentation = {
                        border = vim.g.floating_window_border_dark,
                    },

                    experimental = {
                        native_menu = false,
                        ghost_text = true,
                    },
                }
                cmp.setup.cmdline(":", {
                    sources = {
                        { name = "cmdline" },
                    },
                })
            end,
        }
        use {
            "L3MON4D3/LuaSnip",
            config = function()
                require("luasnip").config.set_config {
                    enable_autosnippets = true,
                }
            end,
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
                parser_config.org = {
                    install_info = {
                        url = "/home/lukas/dev/tree-sitter-org",
                        revision = "main",
                        files = { "src/parser.c", "src/scanner.cc" },
                    },
                    filetype = "org",
                }

                require("nvim-treesitter.configs").setup {
                    ensure_installed = "all",
                    highlight = {
                        enable = true,
                        language_tree = true,
                        additional_vim_regex_highlighting = { "org" },
                    },
                    indent = {
                        enable = true,
                    },
                    refactor = {
                        highlight_definitions = {
                            enable = true,
                        },
                    },
                    autotag = {
                        enable = true,
                    },
                    context_commentstring = {
                        enable = true,
                    },
                    textobjects = {
                        select = {
                            enable = true,
                            keymaps = {
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner",
                            },
                        },
                    },
                }
            end,
        }
        use "nvim-treesitter/playground"
        use "nvim-treesitter/nvim-treesitter-refactor"
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use "David-Kunz/treesitter-unit"
        use "windwp/nvim-ts-autotag"
        use "spywhere/detect-language.nvim"

        use {
            "~/dev/orgmode.nvim",
            config = function()
                local onedark = require "onedark"
                require("orgmode").setup {
                    org_default_notes_file = "~/dev/org/notes.org",
                    org_agenda_templates = {
                        f = {
                            description = "File notes",
                            template = "* TODO %?\n  %u\n  %a",
                            target = "~/dev/org/notes.org",
                        },
                    },
                    org_todo_keywords = { "TODO(t)", "|", "DONE", "CANCELED" },
                    org_todo_keyword_faces = {
                        TODO = ":foreground " .. onedark.colors.purple .. " :weight bold",
                        DONE = ":foreground " .. onedark.colors.green .. " :weight bold",
                        CANCELED = ":foreground " .. onedark.colors.red .. " :weight bold",
                    },
                    org_hide_emphasis_markers = true,
                    mappings = {
                        disable_all = true,
                    },
                }
            end,
        }
        use {
            "akinsho/org-bullets.nvim",
            config = function()
                require("org-bullets").setup {}
            end,
        }

        use {
            "dhruvasagar/vim-table-mode",
            config = function()
                vim.g.table_mode_verbose = false
            end,
        }

        use {
            "~/dev/onedark.nvim",
            config = function()
                require("onedark").setup {}
            end,
        }
        use {
            "~/dev/headlines.nvim",
            config = function()
                require("headlines").setup {
                    markdown = {
                        headline_signs = { "HeadlineGreen", "HeadlineYellow", "HeadlineBlue" },
                    },
                    vimwiki = {
                        headline_signs = { "HeadlineGreen", "HeadlineYellow", "HeadlineBlue" },
                    },
                    org = {
                        headline_signs = {
                            "HeadlineGreen",
                            "HeadlineBlue",
                            "HeadlineRed",
                            "HeadlinePurple",
                            "HeadlineYellow",
                        },
                    },
                }
            end,
        }
        use {
            "~/dev/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup {
                    filetype_exclude = {
                        "vimwiki",
                        "man",
                        "gitmessengerpopup",
                        "diagnosticpopup",
                        "lspinfo",
                        "packer",
                        "TelescopePrompt",
                        "TelescopeResults",
                        "",
                    },
                    buftype_exclude = { "terminal" },
                    space_char_blankline = " ",
                    show_foldtext = false,
                    strict_tabs = true,
                    debug = true,
                    disable_with_nolist = true,
                    max_indent_increase = 1,
                    show_current_context = true,
                    show_current_context_start = true,
                    context_patterns = {
                        "class",
                        "function",
                        "func_literal",
                        "method",
                        "^if",
                        "while",
                        "for",
                        "with",
                        "try",
                        "except",
                        "argument_list",
                        "object",
                        "dictionary",
                        "element",
                    },
                }
            end,
        }

        use {
            "junegunn/fzf.vim",
            requires = {
                { "junegunn/fzf" },
            },
            config = function()
                vim.g.fzf_buffers_jump = true
                vim.g.fzf_layout = { window = { width = 0.8, height = 0.4, yoffset = 0.2 } }
                vim.cmd [[let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi']]
            end,
        }
        use "vijaymarupudi/nvim-fzf"

        use {
            "kyazdani42/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup {
                    default = true,
                }
            end,
        }

        use "tpope/vim-commentary"
        use "tpope/vim-fugitive"
        use "tpope/vim-rhubarb"
        use "tpope/vim-repeat"
        use "tpope/vim-eunuch"
        use "tpope/vim-obsession"
        use "tpope/vim-sleuth"

        use {
            "rmagatti/auto-session",
            config = function()
                require("auto-session").setup {
                    log_level = "error",
                }
            end,
        }

        use "krisajenkins/vim-projectlocal"

        use {
            "airblade/vim-gitgutter",
            config = function()
                vim.g.gitgutter_map_keys = false
                vim.g.gitgutter_sign_added = "│"
                vim.g.gitgutter_sign_modified = "│"
                vim.g.gitgutter_sign_removed = "│"
                vim.g.gitgutter_sign_removed_first_line = "│"
                vim.g.gitgutter_sign_removed_above_and_below = "│"
                vim.g.gitgutter_sign_modified_removed = "│"
            end,
        }

        use {
            "pwntester/octo.nvim",
            requires = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-lua/popup.nvim" },
                { "nvim-telescope/telescope.nvim" },
            },
            config = function()
                require("octo").setup()
            end,
        }
        use {
            "rhysd/git-messenger.vim",
            config = function()
                vim.g.git_messenger_floating_win_opts = { border = vim.g.floating_window_border_dark }
            end,
        }

        use {
            "Shougo/defx.nvim",
            run = ":UpdateRemotePlugins",
            requires = {
                { "kristijanhusak/defx-git" },
                { "kristijanhusak/defx-icons" },
            },
            config = function()
                vim.g.defx_icons_root_opened_tree_icon = "├"
                vim.g.defx_icons_nested_opened_tree_icon = "├"
                vim.g.defx_icons_nested_closed_tree_icon = "│"
                vim.g.defx_icons_directory_icon = "│"
                vim.g.defx_icons_parent_icon = "├"

                vim.fn["defx#custom#column"]("mark", {
                    ["readonly_icon"] = "◆",
                    ["selected_icon"] = "■",
                })

                vim.fn["defx#custom#column"]("indent", {
                    ["indent"] = "    ",
                })

                vim.fn["defx#custom#option"]("_", {
                    ["columns"] = "indent:mark:icons:git:filename",
                })

                vim.fn["defx#custom#column"]("git", "indicators", {
                    ["Modified"] = "◉",
                    ["Staged"] = "✚",
                    ["Untracked"] = "◈",
                    ["Renamed"] = "➜",
                    ["Unmerged"] = "═",
                    ["Ignored"] = "▨",
                    ["Deleted"] = "✖",
                    ["Unknown"] = "?",
                })
            end,
        }

        use {
            "numToStr/Navigator.nvim",
            config = function()
                require("Navigator").setup()
            end,
        }

        use {
            "SirVer/ultisnips",
            config = function()
                vim.g.UltiSnipsSnippetsDir = "~/dotfiles/vim/ultisnips"
                vim.g.UltiSnipsSnippetDirectories = { "ultisnips" }
            end,
        }

        use {
            "cohama/lexima.vim",
            config = function()
                vim.g.lexima_no_default_rules = true
                vim.fn["lexima#set_default_rules"]()
                vim.g.completion_confirm_key = ""
            end,
        }

        use "michaeljsmith/vim-indent-object"
        use "wellle/targets.vim"

        use {
            "rrethy/vim-hexokinase",
            run = "make hexokinase",
            config = function()
                vim.g.Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla"
            end,
        }

        use "vim-scripts/UnconditionalPaste"

        use {
            "haya14busa/incsearch.vim",
            config = function()
                vim.g["incsearch#auto_nohlsearch"] = true
                vim.g["incsearch#magic"] = "\\v"
                vim.g["incsearch#consistent_n_direction"] = true
                vim.g["incsearch#do_not_save_error_message_history"] = true
            end,
        }
        use "vim-scripts/CmdlineComplete"

        use {
            "mileszs/ack.vim",
            config = function()
                vim.g.ackprg = "rg --vimgrep --no-heading --hidden --smart-case"
            end,
        }

        use {
            "romainl/vim-qf",
            config = function()
                vim.g.qf_nowrap = false
                vim.g.qf_max_height = 20
            end,
        }
        use {
            "kevinhwang91/nvim-bqf",
            config = function()
                require("bqf").setup {
                    preview = {
                        delay_syntax = 0,
                    },
                }
            end,
        }
        use {
            "https://gitlab.com/yorickpeterse/nvim-pqf.git",
            config = function()
                require("pqf").setup {
                    signs = {
                        error = "",
                        warning = "",
                        info = "",
                        hint = "",
                    },
                }
            end,
        }

        use "machakann/vim-sandwich"

        use "bounceme/poppy.vim"

        use {
            "vimwiki/vimwiki",
            branch = "dev",
            requires = { { "inkarkat/vim-SyntaxRange" } },
            config = function()
                vim.g.vimwiki_list = {
                    {
                        path = "~/vimwiki/",
                        auto_tags = 1,
                        auto_generate_links = 1,
                        auto_generate_tags = 1,
                        links_space_char = "-",
                    },
                }
                vim.g.vimwiki_folding = "custom"
                vim.g.vimwiki_use_calendar = 0
                vim.g.vimwiki_global_ext = 0
                vim.g.vimwiki_valid_html_tags = "b,i,s,u,sub,sup,kbd,br,hr,span"

                vim.g.vimwiki_key_mappings = {
                    all_maps = 1,
                    global = 0,
                    headers = 0,
                    text_objs = 1,
                    table_format = 0,
                    table_mappings = 1,
                    lists = 1,
                    links = 0,
                    html = 0,
                    mouse = 1,
                }
            end,
        }

        use "bkad/camelcasemotion"

        use "vim-scripts/ReplaceWithRegister"
        use "vim-scripts/ReplaceWithSameIndentRegister"

        use "arthurxavierx/vim-caser"

        use "z1mm32m4n/vim-superman"

        use {
            "rhysd/clever-f.vim",
            config = function()
                vim.g.clever_f_use_migemo = true
            end,
        }
        use "kepbod/quick-scope"

        use {
            "AndrewRadev/splitjoin.vim",
            config = function()
                vim.g.conjoin_map_J = "gJ"
                vim.g.conjoin_map_gJ = "<con-nope>"
            end,
        }

        use {
            "kshenoy/vim-signature",
            config = function()
                vim.g.SignatureForceRemoveGlobal = true
            end,
        }

        use "kana/vim-niceblock"

        use {
            "tyru/open-browser.vim",
            config = function()
                vim.g.openbrowser_default_search = "duckduckgo"
            end,
        }

        use "famiu/feline.nvim"

        use "jparise/vim-graphql"

        use "milisims/nvim-luaref"
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = vim.g.floating_window_border }
            end,
        },
    },
}
