return {
    "vim-scripts/UnconditionalPaste",
    keys = {
        "glp",
        "glP",
    },
    config = function()
        vim.keymap.set("n", "<CLEAR-1>", "<Plug>UnconditionalPasteLineAfter")
        vim.keymap.set("n", "<CLEAR-2>", "<Plug>UnconditionalPasteLineBefore")
        vim.keymap.set("n", "<CLEAR-3>", "<Plug>UnconditionalPasteCommaAfter")
        vim.keymap.set("n", "<CLEAR-4>", "<Plug>UnconditionalPasteCommaBefore")
        vim.keymap.set("n", "<CLEAR-5>", "<Plug>UnconditionalPasteCommaSingleQuoteAfter")
        vim.keymap.set("n", "<CLEAR-6>", "<Plug>UnconditionalPasteCommaSingleQuoteBefore")
        vim.keymap.set("n", "<CLEAR-7>", "<Plug>VimwikiIncrementListItem")
        vim.keymap.set("n", "<CLEAR-8>", "<Plug>VimwikiDecrementListItem")
        vim.keymap.set("n", "<CLEAR-9>", "<Plug>UnconditionalPasteUnjoinBefore")
        vim.keymap.set("n", "<CLEAR-10>", "<Plug>UnconditionalPasteUnjoinAfter")
        vim.keymap.set("n", "glp", "<Plug>UnconditionalPasteIndentedAfter")
        vim.keymap.set("n", "glP", "<Plug>UnconditionalPasteIndentedBefore")
    end,
}
