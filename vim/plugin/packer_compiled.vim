" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/lukas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lukas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lukas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lukas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lukas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  CmdlineComplete = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/CmdlineComplete"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/Navigator.nvim"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister"
  },
  ReplaceWithSameIndentRegister = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/ReplaceWithSameIndentRegister"
  },
  UnconditionalPaste = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/UnconditionalPaste"
  },
  ["ack.vim"] = {
    config = { "\27LJ\2\nX\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0004rg --vimgrep --no-heading --hidden --smart-case\vackprg\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/ack.vim"
  },
  camelcasemotion = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/camelcasemotion"
  },
  ["clever-f.vim"] = {
    config = { "\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\24clever_f_use_migemo\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/clever-f.vim"
  },
  ["compe-tmux"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/compe-tmux"
  },
  ["defx-git"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/defx-git"
  },
  ["defx-icons"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/defx-icons"
  },
  ["defx.nvim"] = {
    config = { "\27LJ\2\nÔ\4\0\0\5\0\21\0.6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\6\0=\1\a\0006\0\0\0009\0\1\0'\1\3\0=\1\b\0006\0\0\0009\0\t\0009\0\n\0'\2\v\0005\3\f\0B\0\3\0016\0\0\0009\0\t\0009\0\n\0'\2\r\0005\3\14\0B\0\3\0016\0\0\0009\0\t\0009\0\15\0'\2\16\0005\3\17\0B\0\3\0016\0\0\0009\0\t\0009\0\n\0'\2\18\0'\3\19\0005\4\20\0B\0\4\1K\0\1\0\1\0\b\fUnknown\6?\rModified\b‚óâ\fDeleted\b‚úñ\fRenamed\b‚ûú\fIgnored\b‚ñ®\14Untracked\b‚óà\rUnmerged\b‚ïê\vStaged\b‚úö\15indicators\bgit\1\0\1\fcolumns#indent:mark:icons:git:filename\6_\23defx#custom#option\1\0\1\vindent\t    \vindent\1\0\2\18readonly_icon\b‚óÜ\18selected_icon\b‚ñ†\tmark\23defx#custom#column\afn\27defx_icons_parent_icon\30defx_icons_directory_icon\b‚îÇ'defx_icons_nested_closed_tree_icon'defx_icons_nested_opened_tree_icon\b‚îú%defx_icons_root_opened_tree_icon\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/defx.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nÍ\1\0\0\3\0\t\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0005\2\4\0=\2\6\1=\1\3\0006\0\0\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0Blet $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi'\bcmd\vwindow\1\0\0\1\0\3\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\fyoffset\4ö≥ÊÃ\tô≥¶˛\3\vheight\4ö≥ÊÃ\tô≥Ê˛\3\15fzf_layout\21fzf_buffers_jump\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["incsearch.vim"] = {
    config = { "\27LJ\2\nÀ\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0K\0\1\0000incsearch#do_not_save_error_message_history%incsearch#consistent_n_direction\a\\v\20incsearch#magic\30incsearch#auto_nohlsearch\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/incsearch.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n§\4\0\0\2\0\15\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\1\0+\1\2\0=\1\v\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0005\1\14\0=\1\r\0K\0\1\0\1\15\0\0\nclass\rfunction\vmethod\b^if\nwhile\bfor\twith\17func_literal\nblock\btry\vexcept\18argument_list\vobject\15dictionary&indent_blankline_context_patterns*indent_blankline_show_current_context\27indent_blankline_debug!indent_blankline_strict_tabs\6 *indent_blankline_space_char_blankline\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\5\0\0\thelp\tdefx\fvimwiki\bman&indent_blankline_filetype_exclude\b‚îÇ\26indent_blankline_char\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lexima.vim"] = {
    config = { "\27LJ\2\nç\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0B\0\1\0016\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\5\27completion_confirm_key\29lexima#set_default_rules\afn\28lexima_no_default_rules\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nÎ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\t\nemoji\2\tcalc\2\rnvim_lsp\2\15treesitter\2\ttmux\2\tpath\2\14ultisnips\2\rnvim_lua\2\vbuffer\2\1\0\6\25allow_prefix_unmatch\1\14preselect\fdisable\15min_length\3\1\17autocomplete\1\fenabled\2\ndebug\1\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n≤\3\0\0\6\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\19\0005\4\16\0005\5\17\0=\5\18\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aic\17@class.inner\aaf\20@function.outer\aac\17@class.outer\aif\20@function.inner\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\fautotag\1\0\1\venable\2\rrefactor\26highlight_definitions\1\0\0\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\18language_tree\2\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["open-browser.vim"] = {
    config = { "\27LJ\2\nG\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\15duckduckgo\31openbrowser_default_search\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["poppy.vim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/poppy.vim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["splitjoin.vim"] = {
    config = { "\27LJ\2\n\\\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\15<con-nope>\19conjoin_map_gJ\agJ\18conjoin_map_J\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    config = { "\27LJ\2\nâ\1\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\2\0\0\14ultisnips UltiSnipsSnippetDirectories\29~/dotfiles/vim/ultisnips\25UltiSnipsSnippetsDir\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vcs-jump"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vcs-jump"
  },
  ["vim-SyntaxRange"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-SyntaxRange"
  },
  ["vim-caser"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-caser"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "\27LJ\2\n≈\2\0\0\2\0\n\0\0296\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\4\0=\1\5\0006\0\0\0009\0\1\0'\1\4\0=\1\6\0006\0\0\0009\0\1\0'\1\4\0=\1\a\0006\0\0\0009\0\1\0'\1\4\0=\1\b\0006\0\0\0009\0\1\0'\1\4\0=\1\t\0K\0\1\0$gitgutter_sign_modified_removed+gitgutter_sign_removed_above_and_below&gitgutter_sign_removed_first_line\27gitgutter_sign_removed\28gitgutter_sign_modified\b‚îÇ\25gitgutter_sign_added\23gitgutter_map_keys\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-graphql"
  },
  ["vim-hexokinase"] = {
    config = { "\27LJ\2\nU\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\31full_hex,rgb,rgba,hsl,hsla\29Hexokinase_optInPatterns\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-niceblock"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-niceblock"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-projectlocal"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-projectlocal"
  },
  ["vim-qf"] = {
    config = { "\27LJ\2\nI\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\20\0=\1\3\0K\0\1\0\18qf_max_height\14qf_nowrap\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-qf"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-signature"] = {
    config = { "\27LJ\2\n<\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\31SignatureForceRemoveGlobal\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-superman"] = {
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vim-superman"
  },
  vimwiki = {
    config = { "\27LJ\2\n⁄\3\0\0\3\0\f\0\0276\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0K\0\1\0\1\0\n\rall_maps\3\1\nlists\3\1\nmouse\3\1\thtml\3\0\nlinks\3\0\19table_mappings\3\1\17table_format\3\0\14text_objs\3\1\fheaders\3\0\vglobal\3\0\25vimwiki_key_mappings#b,i,s,u,sub,sup,kbd,br,hr,span\28vimwiki_valid_html_tags\23vimwiki_global_ext\25vimwiki_use_calendar\vcustom\20vimwiki_folding\1\0\5\21links_space_char\6-\23auto_generate_tags\3\1\24auto_generate_links\3\1\14auto_tags\3\1\tpath\15~/vimwiki/\17vimwiki_list\6g\bvim\0" },
    loaded = true,
    path = "/home/lukas/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

-- Config for: vim-gitgutter
try_loadstring("\27LJ\2\n≈\2\0\0\2\0\n\0\0296\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\4\0=\1\5\0006\0\0\0009\0\1\0'\1\4\0=\1\6\0006\0\0\0009\0\1\0'\1\4\0=\1\a\0006\0\0\0009\0\1\0'\1\4\0=\1\b\0006\0\0\0009\0\1\0'\1\4\0=\1\t\0K\0\1\0$gitgutter_sign_modified_removed+gitgutter_sign_removed_above_and_below&gitgutter_sign_removed_first_line\27gitgutter_sign_removed\28gitgutter_sign_modified\b‚îÇ\25gitgutter_sign_added\23gitgutter_map_keys\6g\bvim\0", "config", "vim-gitgutter")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n≤\3\0\0\6\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\19\0005\4\16\0005\5\17\0=\5\18\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\4\aic\17@class.inner\aaf\20@function.outer\aac\17@class.outer\aif\20@function.inner\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\fautotag\1\0\1\venable\2\rrefactor\26highlight_definitions\1\0\0\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\18language_tree\2\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
-- Config for: open-browser.vim
try_loadstring("\27LJ\2\nG\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\15duckduckgo\31openbrowser_default_search\6g\bvim\0", "config", "open-browser.vim")
-- Config for: defx.nvim
try_loadstring("\27LJ\2\nÔ\4\0\0\5\0\21\0.6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\6\0=\1\a\0006\0\0\0009\0\1\0'\1\3\0=\1\b\0006\0\0\0009\0\t\0009\0\n\0'\2\v\0005\3\f\0B\0\3\0016\0\0\0009\0\t\0009\0\n\0'\2\r\0005\3\14\0B\0\3\0016\0\0\0009\0\t\0009\0\15\0'\2\16\0005\3\17\0B\0\3\0016\0\0\0009\0\t\0009\0\n\0'\2\18\0'\3\19\0005\4\20\0B\0\4\1K\0\1\0\1\0\b\fUnknown\6?\rModified\b‚óâ\fDeleted\b‚úñ\fRenamed\b‚ûú\fIgnored\b‚ñ®\14Untracked\b‚óà\rUnmerged\b‚ïê\vStaged\b‚úö\15indicators\bgit\1\0\1\fcolumns#indent:mark:icons:git:filename\6_\23defx#custom#option\1\0\1\vindent\t    \vindent\1\0\2\18readonly_icon\b‚óÜ\18selected_icon\b‚ñ†\tmark\23defx#custom#column\afn\27defx_icons_parent_icon\30defx_icons_directory_icon\b‚îÇ'defx_icons_nested_closed_tree_icon'defx_icons_nested_opened_tree_icon\b‚îú%defx_icons_root_opened_tree_icon\6g\bvim\0", "config", "defx.nvim")
-- Config for: vim-signature
try_loadstring("\27LJ\2\n<\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\31SignatureForceRemoveGlobal\6g\bvim\0", "config", "vim-signature")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\nÎ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\t\nemoji\2\tcalc\2\rnvim_lsp\2\15treesitter\2\ttmux\2\tpath\2\14ultisnips\2\rnvim_lua\2\vbuffer\2\1\0\6\25allow_prefix_unmatch\1\14preselect\fdisable\15min_length\3\1\17autocomplete\1\fenabled\2\ndebug\1\nsetup\ncompe\frequire\0", "config", "nvim-compe")
-- Config for: ack.vim
try_loadstring("\27LJ\2\nX\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0004rg --vimgrep --no-heading --hidden --smart-case\vackprg\6g\bvim\0", "config", "ack.vim")
-- Config for: Navigator.nvim
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
-- Config for: fzf.vim
try_loadstring("\27LJ\2\nÍ\1\0\0\3\0\t\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0005\2\4\0=\2\6\1=\1\3\0006\0\0\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0Blet $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi'\bcmd\vwindow\1\0\0\1\0\3\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\fyoffset\4ö≥ÊÃ\tô≥¶˛\3\vheight\4ö≥ÊÃ\tô≥Ê˛\3\15fzf_layout\21fzf_buffers_jump\6g\bvim\0", "config", "fzf.vim")
-- Config for: lexima.vim
try_loadstring("\27LJ\2\nç\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0B\0\1\0016\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\5\27completion_confirm_key\29lexima#set_default_rules\afn\28lexima_no_default_rules\6g\bvim\0", "config", "lexima.vim")
-- Config for: splitjoin.vim
try_loadstring("\27LJ\2\n\\\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\15<con-nope>\19conjoin_map_gJ\agJ\18conjoin_map_J\6g\bvim\0", "config", "splitjoin.vim")
-- Config for: nvim-web-devicons
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
-- Config for: vimwiki
try_loadstring("\27LJ\2\n⁄\3\0\0\3\0\f\0\0276\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0K\0\1\0\1\0\n\rall_maps\3\1\nlists\3\1\nmouse\3\1\thtml\3\0\nlinks\3\0\19table_mappings\3\1\17table_format\3\0\14text_objs\3\1\fheaders\3\0\vglobal\3\0\25vimwiki_key_mappings#b,i,s,u,sub,sup,kbd,br,hr,span\28vimwiki_valid_html_tags\23vimwiki_global_ext\25vimwiki_use_calendar\vcustom\20vimwiki_folding\1\0\5\21links_space_char\6-\23auto_generate_tags\3\1\24auto_generate_links\3\1\14auto_tags\3\1\tpath\15~/vimwiki/\17vimwiki_list\6g\bvim\0", "config", "vimwiki")
-- Config for: clever-f.vim
try_loadstring("\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\24clever_f_use_migemo\6g\bvim\0", "config", "clever-f.vim")
-- Config for: onedark.nvim
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
-- Config for: vim-qf
try_loadstring("\27LJ\2\nI\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\20\0=\1\3\0K\0\1\0\18qf_max_height\14qf_nowrap\6g\bvim\0", "config", "vim-qf")
-- Config for: vim-hexokinase
try_loadstring("\27LJ\2\nU\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\31full_hex,rgb,rgba,hsl,hsla\29Hexokinase_optInPatterns\6g\bvim\0", "config", "vim-hexokinase")
-- Config for: incsearch.vim
try_loadstring("\27LJ\2\nÀ\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0K\0\1\0000incsearch#do_not_save_error_message_history%incsearch#consistent_n_direction\a\\v\20incsearch#magic\30incsearch#auto_nohlsearch\6g\bvim\0", "config", "incsearch.vim")
-- Config for: indent-blankline.nvim
try_loadstring("\27LJ\2\n§\4\0\0\2\0\15\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0+\1\2\0=\1\n\0006\0\0\0009\0\1\0+\1\2\0=\1\v\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0005\1\14\0=\1\r\0K\0\1\0\1\15\0\0\nclass\rfunction\vmethod\b^if\nwhile\bfor\twith\17func_literal\nblock\btry\vexcept\18argument_list\vobject\15dictionary&indent_blankline_context_patterns*indent_blankline_show_current_context\27indent_blankline_debug!indent_blankline_strict_tabs\6 *indent_blankline_space_char_blankline\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\5\0\0\thelp\tdefx\fvimwiki\bman&indent_blankline_filetype_exclude\b‚îÇ\26indent_blankline_char\6g\bvim\0", "config", "indent-blankline.nvim")
-- Config for: ultisnips
try_loadstring("\27LJ\2\nâ\1\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\2\0\0\14ultisnips UltiSnipsSnippetDirectories\29~/dotfiles/vim/ultisnips\25UltiSnipsSnippetsDir\6g\bvim\0", "config", "ultisnips")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
