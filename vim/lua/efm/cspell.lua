return {
    lintCommand = "cspell --quiet --config ~/dotfiles/cspell/cspell.config.yaml stdin",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "./:%l:%c - %m" },
    lintSource = "cspell",
    lintSeverity = 4,
}
