vim.cmd [[syntax enable]]
vim.cmd [[filetype plugin indent on]]

local opt = setmetatable({}, {
    __newindex = function(_, key, value)
        vim.o[key] = value
        vim.bo[key] = value
    end,
})

opt.dict = "~/dotfiles/lib/10k.txt"
opt.expandtab = true
opt.formatoptions = "crqnbj"
vim.opt.grepprg = "rg --vimgrep --hidden --smart-case --ignore-file ~/dotfiles/fzf-ignore"
vim.opt.grepformat = "%f:%l:%c:%m"
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4
opt.spellcapcheck = ""
opt.swapfile = false
opt.tabstop = 4
opt.textwidth = 80
opt.undofile = true
opt.undolevels = 10000
vim.opt.jumpoptions = "stack"

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noinsert,noselect"
vim.o.confirm = true
vim.o.diffopt = "internal,filler,closeoff,foldcolumn:1,hiddenoff,algorithm:patience,linematch:60"
vim.o.emoji = false
-- vim.o.foldclose = "all"
-- vim.o.foldopen = "all"
vim.wo.foldtext = ""
-- vim.wo.foldtext = "v:lua.foldtext()"
vim.opt.sessionoptions:remove "folds"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.hidden = true
vim.o.history = 10000
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.infercase = true
vim.o.lazyredraw = true
vim.o.mouse = "a"
vim.o.pumblend = 10
vim.o.ruler = false
vim.o.scrolloff = 8
vim.o.showbreak = "↳⋅"
vim.o.showcmd = false
vim.o.showmode = false
vim.o.showtabline = 0
vim.o.sidescroll = 1
vim.o.sidescrolloff = 15
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.undodir = vim.fn.expand "~/.config/nvim/backups"
vim.o.updatetime = 0
vim.o.viewoptions = ""
vim.o.virtualedit = "onemore"
vim.o.whichwrap = "b,h,l"
vim.o.wildmode = "longest,full"
vim.o.wildoptions = "pum"

vim.wo.foldenable = false
vim.wo.foldlevel = 2
vim.wo.signcolumn = "yes:1"
vim.wo.conceallevel = 2
vim.wo.concealcursor = "n"
vim.wo.breakindent = true
vim.wo.linebreak = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.winhighlight = "NormalNC:WinNormalNC"
vim.wo.spell = true
vim.opt.list = true
vim.opt.listchars = {
    space = "⋅",
    eol = "↴",
    tab = "▎_",
    -- tab = ">.",
    trail = "•",
    extends = "❯",
    precedes = "❮",
    nbsp = "",
}
vim.opt.fillchars = {
    fold = " ",
    foldsep = " ",
    foldopen = "",
    foldclose = "",
    diff = "╱",
}
vim.opt.shortmess:append "W"
vim.opt.shortmess:append "A"
vim.opt.shortmess:append "F"

vim.g.floating_window_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
vim.g.floating_window_border_dark = {
    { "╭", "FloatBorderDark" },
    { "─", "FloatBorderDark" },
    { "╮", "FloatBorderDark" },
    { "│", "FloatBorderDark" },
    { "╯", "FloatBorderDark" },
    { "─", "FloatBorderDark" },
    { "╰", "FloatBorderDark" },
    { "│", "FloatBorderDark" },
}
vim.g.no_man_maps = true
vim.g.vim_json_syntax_conceal = false
vim.g.vim_json_conceal = false

vim.diagnostic.config {
    virtual_lines = false,
    virtual_text = {
        spacing = 3,
        prefix = " ",
        severity_sort = true,
        source = "if_many",
    },
}
