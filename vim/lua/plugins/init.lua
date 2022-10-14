vim.g.loaded_netrwPlugin = false
vim.cmd [[packadd cfilter]]

require("packer").startup {
    function()
        use "wbthomason/packer.nvim"

        use "neovim/nvim-lspconfig"
        use "ray-x/lsp_signature.nvim"
        use {
            "Kasama/nvim-custom-diagnostic-highlight",
            config = "require 'plugins.nvim_custom_diagnostic_highlight'",
        }
        use {
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            config = "require 'plugins.lsp_lines'",
        }
        use {
            "lvimuser/lsp-inlayhints.nvim",
            config = "require 'plugins.lsp_inlayhints'",
        }

        use {
            "smjonas/inc-rename.nvim",
            config = "require 'plugins.inc_rename'",
        }

        use {
            "Saecki/crates.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = "require 'plugins.crates'",
        }
        use {
            "vuki656/package-info.nvim",
            config = "require 'plugins.package_info'",
        }

        use {
            "mfussenegger/nvim-dap",
            config = "require 'plugins.nvim_dap'",
        }
        use {
            "rcarriga/nvim-dap-ui",
            config = "require 'plugins.nvim_dap_ui'",
        }
        use {
            "theHamsta/nvim-dap-virtual-text",
            config = "require 'plugins.nvim_dap_virtual_text'",
        }
        use {
            "leoluz/nvim-dap-go",
            config = "require 'plugins.nvim_dap_go'",
        }
        use {
            "mfussenegger/nvim-dap-python",
            config = "require 'plugins.nvim_dap_python'",
        }
        use "jbyuki/one-small-step-for-vimkind"

        use {
            "nvim-neotest/neotest",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
                "antoinemadec/FixCursorHold.nvim",
                "haydenmeade/neotest-jest",
            },
            config = "require 'plugins.neotest'",
        }

        use {
            "kevinhwang91/nvim-ufo",
            requires = "kevinhwang91/promise-async",
            config = "require 'plugins.nvim_ufo'",
        }

        use {
            "stevearc/dressing.nvim",
            config = "require 'plugins.dressing'",
        }

        use {
            "kyazdani42/nvim-web-devicons",
            config = "require 'plugins.nvim-web-devicons'",
        }

        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                "kyazdani42/nvim-web-devicons",
                "mrbjarksen/neo-tree-diagnostics.nvim",
            },
            after = { "nvim-web-devicons" },
            config = "require 'plugins.neo-tree'",
        }
        use {
            "rcarriga/nvim-notify",
            config = "require 'plugins.nvim_notify'",
        }

        use {
            "hrsh7th/nvim-cmp",
            requires = {
                { "andersevenrud/cmp-tmux" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/cmp-path" },
                { "hrsh7th/cmp-nvim-lua" },
                { "hrsh7th/cmp-nvim-lsp" },
                { "saadparwaiz1/cmp_luasnip" },
                { "hrsh7th/cmp-cmdline" },
                { "dmitmel/cmp-cmdline-history" },
                { "~/dev/cmp-under-comparator" },
                { "~/dev/cmp-rg" },
                { "octaltree/cmp-look" },
                { "rcarriga/cmp-dap" },
                { "petertriho/cmp-git" },
            },
            config = "require 'plugins.nvim-cmp'",
        }
        use {
            "L3MON4D3/LuaSnip",
            config = "require 'plugins.lua-snip'",
        }

        use "folke/lua-dev.nvim"
        use "milisims/nvim-luaref"

        use {
            "ThePrimeagen/refactoring.nvim",
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = "require 'plugins.nvim-treesitter'",
        }
        use "nvim-treesitter/playground"
        use "nvim-treesitter/nvim-treesitter-refactor"
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "RRethy/nvim-treesitter-textsubjects"
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use "David-Kunz/treesitter-unit"
        use {
            "lewis6991/spellsitter.nvim",
            config = "require 'plugins.spellsitter'",
        }
        use "windwp/nvim-ts-autotag"
        use {
            "spywhere/detect-language.nvim",
            config = "require 'plugins.dectect-language'",
        }
        use {
            "m-demare/hlargs.nvim",
            config = "require 'plugins.hlargs-nvim'",
        }

        use {
            "~/dev/lsp-format.nvim",
            config = "require 'plugins.lsp-format'",
        }

        use {
            "~/dev/orgmode.nvim",
            config = "require 'plugins.orgmode'",
        }
        use {
            "akinsho/org-bullets.nvim",
            config = "require 'plugins.org-bullets'",
        }

        use {
            "dhruvasagar/vim-table-mode",
            config = "require 'plugins.vim-table-mode'",
        }

        use {
            "~/dev/onedark.nvim",
            config = "require 'plugins.onedark'",
        }
        use {
            "~/dev/headlines.nvim",
            config = "require 'plugins.headlines'",
        }
        use "jghauser/follow-md-links.nvim"
        use {
            "~/dev/virt-column.nvim",
            config = "require 'plugins.virt-column'",
        }
        use {
            "~/dev/indent-blankline.nvim",
            config = "require 'plugins.indent-blankline'",
        }

        use {
            "junegunn/fzf.vim",
            requires = {
                { "junegunn/fzf" },
            },
            config = "require 'plugins.fzf'",
        }
        use "vijaymarupudi/nvim-fzf"

        use "tpope/vim-fugitive"
        use "tpope/vim-rhubarb"
        use "tpope/vim-repeat"
        use "tpope/vim-eunuch"
        use "tpope/vim-obsession"
        use "tpope/vim-sleuth"

        use {
            "numToStr/Comment.nvim",
            config = "require 'plugins.comment'",
        }

        use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }

        use {
            "rmagatti/auto-session",
            config = "require 'plugins.auto-session'",
        }

        use "krisajenkins/vim-projectlocal"

        use {
            "airblade/vim-gitgutter",
            config = "require 'plugins.vim-gitgutter'",
        }

        use {
            "pwntester/octo.nvim",
            requires = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-lua/popup.nvim" },
                { "nvim-telescope/telescope.nvim" },
            },
            config = "require 'plugins.octo'",
        }

        use {
            "numToStr/Navigator.nvim",
            config = "require 'plugins.navigator'",
        }

        use {
            "cohama/lexima.vim",
            config = "require 'plugins.lexima'",
        }

        use "michaeljsmith/vim-indent-object"
        use "wellle/targets.vim"

        use {
            "rrethy/vim-hexokinase",
            run = "make hexokinase",
            config = "require 'plugins.hexokinase'",
        }

        use "vim-scripts/UnconditionalPaste"

        use {
            "haya14busa/is.vim",
        }

        use {
            "andythigpen/nvim-coverage",
            config = "require 'plugins.nvim_coverage'",
        }

        use {
            "romainl/vim-qf",
            config = "require 'plugins.vim-qf'",
        }
        use {
            "kevinhwang91/nvim-bqf",
            config = "require 'plugins.nvim-bqf'",
        }
        use {
            "https://gitlab.com/yorickpeterse/nvim-pqf.git",
            config = "require 'plugins.nvim-pqf'",
        }

        use "machakann/vim-sandwich"

        use "bounceme/poppy.vim"

        use "bkad/camelcasemotion"

        use "vim-scripts/ReplaceWithRegister"
        use "vim-scripts/ReplaceWithSameIndentRegister"

        use "arthurxavierx/vim-caser"

        use "z1mm32m4n/vim-superman"

        use {
            "rhysd/clever-f.vim",
            config = "require 'plugins.clever-f'",
        }
        use "kepbod/quick-scope"

        use {
            "kshenoy/vim-signature",
            config = "require 'plugins.vim-signature'",
        }

        use "kana/vim-niceblock"

        use {
            "tyru/open-browser.vim",
            config = "require 'plugins.open-browser'",
        }

        use "famiu/feline.nvim"
        use {
            "SmiteshP/nvim-navic",
            config = "require 'plugins.nvim_navic'",
        }
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = vim.g.floating_window_border }
            end,
        },
    },
}
