vim.g.loaded_netrwPlugin = false
vim.cmd [[packadd cfilter]]

require("packer").startup {
    function()
        use "wbthomason/packer.nvim"

        use "neovim/nvim-lspconfig"
        use "ray-x/lsp_signature.nvim"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"
        use {
            "Kasama/nvim-custom-diagnostic-highlight",
            config = "require 'plugins.nvim_custom_diagnostic_highlight'",
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
            },
            config = "require 'plugins.nvim-cmp'",
        }
        use {
            "L3MON4D3/LuaSnip",
            config = "require 'plugins.lua-snip'",
        }

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
        use "windwp/nvim-ts-autotag"
        use {
            "spywhere/detect-language.nvim",
            config = "require 'plugins.dectect-language'",
        }

        use {
            "~/dev/lsp-format.nvim",
            config = "require 'plugins.lsp-format'",
        }

        use {
            "~/dev/orgmode.nvim",
            config = "require 'plugins.orgmode'",
        }
        use "overcache/NeoSolarized"
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
            "mileszs/ack.vim",
            config = "require 'plugins.ack'",
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
            "AndrewRadev/splitjoin.vim",
            config = "require 'plugins.splitjoin'",
        }

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
