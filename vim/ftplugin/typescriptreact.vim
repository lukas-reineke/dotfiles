setlocal iskeyword+=$
setlocal define=\\(const\\\|let\\\|private\\\|public\\\|class\\)
setlocal suffixesadd+=.js,.tsx,.jsx
setlocal path+=$PWD/node_modules
setlocal cinoptions+=j1,J1
