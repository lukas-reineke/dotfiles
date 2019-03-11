c = get_config()
# load_subconfig("base_config.py")
c.InteractiveShellApp.exec_lines = ["%autoreload 2", "%rehashx"]
c.InteractiveShellApp.extensions = ["autoreload"]
c.AliasManager.user_aliases = [("cl", "clear"), ("gs", "git status")]
c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.editing_mode = "vi"
c.TerminalInteractiveShell.editor = "nvim"
c.TerminalInteractiveShell.extra_open_editor_shortcuts = True
