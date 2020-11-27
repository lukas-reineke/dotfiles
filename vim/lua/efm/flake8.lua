return {
    lintCommand = "flake8 --max-line-length 160 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f=%l:%c: %m"}
}
