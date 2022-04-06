return {
    lintCommand = "luacheck --codes --formatter plain --std luajit --filename ${INPUT} -",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    lintSource = "luacheck",
}
