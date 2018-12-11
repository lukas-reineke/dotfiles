
let g:language_map = {'bash': 'sh'}
for language in [ 'javascript', 'python', 'typescript', 'bash' ]
    call SyntaxRange#Include('```'.language, '```', get(g:language_map, language, language), 'NonText')
endfor
