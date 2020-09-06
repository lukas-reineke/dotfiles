syntax match VimwikiColorTagRed /r`[^`]\{-}`/ contains=VimwikiColorTagStart,VimwikiColorTagEnd,@Spell
syntax match VimwikiColorTagGreen /g`[^`]\{-}`/ contains=VimwikiColorTagStart,VimwikiColorTagEnd,@Spell
syntax match VimwikiColorTagCyan /c`[^`]\{-}`/ contains=VimwikiColorTagStart,VimwikiColorTagEnd,@Spell
syntax match VimwikiColorTagBlue /b`[^`]\{-}`/ contains=VimwikiColorTagStart,VimwikiColorTagEnd,@Spell
syntax match VimwikiColorTagPurple /p`[^`]\{-}`/ contains=VimwikiColorTagStart,VimwikiColorTagEnd,@Spell
syntax match VimwikiColorTagStart contained /[r|g|c|b|p]`/ conceal
syntax match VimwikiColorTagEnd contained /`/ conceal

syntax match VimwikiColorTagRed /<span class\="red">[^<]\+<\/span>/ contains=VimwikiColorTagStart,VimwikiColorTagEnd,@Spell
syntax match VimwikiColorTagStart contained /<span class\="red">/ conceal
syntax match VimwikiColorTagStart contained /<\/span>/ conceal


syntax region VimwikiColorTagRed matchgroup=VimwikiColorTag start='<span class="red">' end='<\/span>' contains=@Spell concealends
syntax region VimwikiColorTagGreen matchgroup=VimwikiColorTag start='<span class="green">' end='<\/span>' contains=@Spell concealends
syntax region VimwikiColorTagBlue matchgroup=VimwikiColorTag start='<span class="blue">' end='<\/span>' contains=@Spell concealends
syntax region VimwikiColorTagCyan matchgroup=VimwikiColorTag start='<span class="cyan">' end='<\/span>' contains=@Spell concealends
syntax region VimwikiColorTagPurple matchgroup=VimwikiColorTag start='<span class="purple">' end='<\/span>' contains=@Spell concealends

syntax match MarkdownDash /^---\+$/ conceal

syntax match VimwikiSuperScriptT /(\?[12]\d\{3}-\(0[1-9]\|1[0-2]\)-\(0[1-9]\|[12]\d\|3[01]\)\( \d\{2}:\d\{2}:\d\{2}\)\?)\?/

" execute 'syntax match VimwikiListTodo /'.vimwiki#vars#get_wikilocal('rxListItem').'/ contains=todoCheckbox'
" syntax match TaskWikiTaskCompleted containedin=TaskWikiTask contained /\s*\*\s\[X\]\s[^#]*/ contains=todoCheckbox
" syntax match TaskWikiTaskDeleted containedin=TaskWikiTask contained /\s*\*\s*\[D\]\s[^#]*/ contains=todoCheckbox

" syntax match todoCheckbox "\[\ \]" conceal cchar=
" syntax match todoCheckbox "\[X\]" conceal cchar=
" syntax match todoCheckbox "\[D\]" conceal cchar=☒

let g:indentLine_color_gui = 'None'

let g:language_map = {'SQL': 'pgsql', 'bash': 'sh'}
for language in [ 'typescript', 'javascript', 'json', 'python', 'go', 'bash', 'SQL', 'vim' ]
    call SyntaxRange#Include('{{{' . language, '}}}', get(g:language_map, language, language), 'markdownCodeDelimiter')
endfor
