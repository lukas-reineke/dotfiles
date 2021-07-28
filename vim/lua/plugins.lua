vim.g.loaded_netrwPlugin = false
vim.cmd [[packadd cfilter]]

require("packer").startup(
    function()
        use "wbthomason/packer.nvim"

        use "neovim/nvim-lspconfig"
        use {
            "hrsh7th/nvim-compe",
            requires = {
                {"andersevenrud/compe-tmux"}
            },
            config = function()
                require "compe".setup {
                    enabled = true,
                    debug = false,
                    autocomplete = false,
                    min_length = 1,
                    preselect = "disable",
                    allow_prefix_unmatch = false,
                    source = {
                        path = true,
                        buffer = true,
                        nvim_lsp = true,
                        nvim_lua = true,
                        ultisnips = true,
                        calc = true,
                        tmux = true,
                        treesitter = true
                    }
                }
            end
        }
        use "ray-x/lsp_signature.nvim"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require "nvim-treesitter.configs".setup {
                    ensure_installed = "all",
                    highlight = {
                        enable = true,
                        language_tree = true
                    },
                    indent = {
                        enable = true
                    },
                    refactor = {
                        highlight_definitions = {
                            enable = true
                        }
                    },
                    autotag = {
                        enable = true
                    },
                    context_commentstring = {
                        enable = true
                    },
                    textobjects = {
                        select = {
                            enable = true,
                            keymaps = {
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner"
                            }
                        }
                    }
                }
            end
        }
        use "nvim-treesitter/playground"
        use "nvim-treesitter/nvim-treesitter-refactor"
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use "windwp/nvim-ts-autotag"

        use {
            "~/dev/onedark.nvim",
            config = function()
                require "onedark".setup {}
            end
        }
        use {
            "~/dev/indent-blankline.nvim",
            branch = "lua",
            config = function()
                require("indent_blankline").setup {
                    filetype_exclude = {
                        "help",
                        "defx",
                        "vimwiki",
                        "man",
                        "gitmessengerpopup",
                        "diagnosticpopup",
                        "lspinfo"
                    },
                    buftype_exclude = {"terminal"},
                    space_char_blankline = " ",
                    show_foldtext = false,
                    strict_tabs = true,
                    debug = true,
                    show_current_context = true,
                    context_patterns = {
                        "class",
                        "function",
                        "method",
                        "^if",
                        "while",
                        "for",
                        "with",
                        "func_literal",
                        "block",
                        "try",
                        "except",
                        "argument_list",
                        "object",
                        "dictionary",
                        "element"
                    }
                }
            end
        }

        use {
            "junegunn/fzf.vim",
            requires = {
                {"junegunn/fzf"}
            },
            config = function()
                vim.g.fzf_buffers_jump = true
                vim.g.fzf_layout = {window = {width = 0.8, height = 0.4, yoffset = 0.2}}
                vim.cmd [[let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi']]
            end
        }
        use "vijaymarupudi/nvim-fzf"

        use {
            "kyazdani42/nvim-web-devicons",
            config = function()
                require "nvim-web-devicons".setup {
                    default = true
                }
            end
        }

        use "tpope/vim-commentary"
        use "tpope/vim-fugitive"
        use "tpope/vim-rhubarb"
        use "tpope/vim-repeat"
        use "tpope/vim-eunuch"
        use "tpope/vim-obsession"
        use "tpope/vim-sleuth"

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
            end
        }

        use "wincent/vcs-jump"
        use {
            "pwntester/octo.nvim",
            requires = {
                {"nvim-lua/plenary.nvim"},
                {"nvim-lua/popup.nvim"},
                {"nvim-telescope/telescope.nvim"}
            }
        }
        use {
            "rhysd/git-messenger.vim",
            config = function()
                vim.g.git_messenger_floating_win_opts = {border = vim.g.floating_window_border_dark}
            end
        }

        use {
            "Shougo/defx.nvim",
            run = ":UpdateRemotePlugins",
            requires = {
                {"kristijanhusak/defx-git"},
                {"kristijanhusak/defx-icons"}
            },
            config = function()
                vim.g.defx_icons_root_opened_tree_icon = "├"
                vim.g.defx_icons_nested_opened_tree_icon = "├"
                vim.g.defx_icons_nested_closed_tree_icon = "│"
                vim.g.defx_icons_directory_icon = "│"
                vim.g.defx_icons_parent_icon = "├"

                vim.fn["defx#custom#column"](
                    "mark",
                    {
                        ["readonly_icon"] = "◆",
                        ["selected_icon"] = "■"
                    }
                )

                vim.fn["defx#custom#column"](
                    "indent",
                    {
                        ["indent"] = "    "
                    }
                )

                vim.fn["defx#custom#option"](
                    "_",
                    {
                        ["columns"] = "indent:mark:icons:git:filename"
                    }
                )

                vim.fn["defx#custom#column"](
                    "git",
                    "indicators",
                    {
                        ["Modified"] = "◉",
                        ["Staged"] = "✚",
                        ["Untracked"] = "◈",
                        ["Renamed"] = "➜",
                        ["Unmerged"] = "═",
                        ["Ignored"] = "▨",
                        ["Deleted"] = "✖",
                        ["Unknown"] = "?"
                    }
                )
            end
        }

        use {
            "numToStr/Navigator.nvim",
            config = function()
                require("Navigator").setup()
            end
        }

        use {
            "SirVer/ultisnips",
            config = function()
                vim.g.UltiSnipsSnippetsDir = "~/dotfiles/vim/ultisnips"
                vim.g.UltiSnipsSnippetDirectories = {"ultisnips"}
            end
        }

        use {
            "cohama/lexima.vim",
            config = function()
                vim.g.lexima_no_default_rules = true
                vim.fn["lexima#set_default_rules"]()
                vim.g.completion_confirm_key = ""
            end
        }

        use "michaeljsmith/vim-indent-object"
        use "wellle/targets.vim"

        use {
            "rrethy/vim-hexokinase",
            run = "make hexokinase",
            config = function()
                vim.g.Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla"
            end
        }

        use "vim-scripts/UnconditionalPaste"

        use {
            "haya14busa/incsearch.vim",
            config = function()
                vim.g["incsearch#auto_nohlsearch"] = true
                vim.g["incsearch#magic"] = "\\v"
                vim.g["incsearch#consistent_n_direction"] = true
                vim.g["incsearch#do_not_save_error_message_history"] = true
            end
        }
        use "vim-scripts/CmdlineComplete"

        use {
            "mileszs/ack.vim",
            config = function()
                vim.g.ackprg = "rg --vimgrep --no-heading --hidden --smart-case"
            end
        }

        use {
            "romainl/vim-qf",
            config = function()
                vim.g.qf_nowrap = false
                vim.g.qf_max_height = 20
            end
        }

        use "machakann/vim-sandwich"

        use "bounceme/poppy.vim"

        use {
            "vimwiki/vimwiki",
            branch = "dev",
            requires = {{"inkarkat/vim-SyntaxRange"}},
            config = function()
                vim.g.vimwiki_list = {
                    {
                        path = "~/vimwiki/",
                        auto_tags = 1,
                        auto_generate_links = 1,
                        auto_generate_tags = 1,
                        links_space_char = "-"
                    }
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
                    mouse = 1
                }
            end
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
            end
        }
        use "kepbod/quick-scope"

        use {
            "AndrewRadev/splitjoin.vim",
            config = function()
                vim.g.conjoin_map_J = "gJ"
                vim.g.conjoin_map_gJ = "<con-nope>"
            end
        }

        use {
            "kshenoy/vim-signature",
            config = function()
                vim.g.SignatureForceRemoveGlobal = true
            end
        }

        use "kana/vim-niceblock"

        use {
            "tyru/open-browser.vim",
            config = function()
                vim.g.openbrowser_default_search = "duckduckgo"
            end
        }

        use "glepnir/galaxyline.nvim"

        use "jparise/vim-graphql"
    end
)
