vim.opt.expandtab = true
vim.opt.formatoptions = "crqnbj"
vim.opt.grepprg = "rg --vimgrep --hidden --smart-case --ignore-file ~/dotfiles/fzf-ignore"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.spellcapcheck = ""
vim.opt.swapfile = false
vim.opt.textwidth = 80
vim.opt.jumpoptions = "stack"

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noinsert,noselect"
vim.o.confirm = true
vim.o.diffopt = "internal,filler,closeoff,foldcolumn:1,hiddenoff,algorithm:histogram,linematch:120,indent-heuristic"
vim.o.emoji = false
vim.o.hidden = true
vim.o.history = 10000
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.infercase = true
vim.o.lazyredraw = true
vim.o.mouse = "a"
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
vim.o.splitkeep = "screen"
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

vim.g.no_man_maps = true
vim.g.vim_json_syntax_conceal = false
vim.g.vim_json_conceal = false

vim.keymap.set("n", "<Space>w", ":update<CR>")
vim.keymap.set("n", "<Space><Space>", "<C-6>")

vim.keymap.set({ "n", "o", "v" }, "H", "^")
vim.keymap.set({ "n", "o", "v" }, "L", "$")
vim.keymap.set({ "n", "v" }, "J", "5j")
vim.keymap.set({ "n", "v" }, "K", "5k")
vim.keymap.set({ "n", "v" }, "j", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'", { expr = true })
vim.keymap.set({ "n", "v" }, "k", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'", { expr = true })

vim.api.nvim_set_hl(0, "Normal", { fg = "#ABB2BF" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ABB2BF", bg = "#1a1a1a" })
