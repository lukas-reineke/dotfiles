return {
    lintCommand = "flake8 --max-line-length 160 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %t%m"},
    lintSource = "flake8"
}
