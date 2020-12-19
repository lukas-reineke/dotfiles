local HOME = os.getenv("HOME")
package.path = package.path .. ";" .. HOME .. "/.luarocks/share/lua/5.1/?.lua"
package.cpath = package.cpath .. ";" .. HOME .. "/.luarocks/lib/lua/5.1/?.so"

require "utils"
require "lsp"
require "treesitter"
require "statusline"
require "onedark".setup {}
require "markdown"
require "pr".setup {}
