
syntax region OrgColorTagRed matchgroup=OrgColorTag start='r`' end='`' contains=@Spell concealends
syntax region OrgColorTagGreen matchgroup=OrgColorTag start='g`' end='`' contains=@Spell concealends
syntax region OrgColorTagBlue matchgroup=OrgColorTag start='b`' end='`' contains=@Spell concealends
syntax region OrgColorTagCyan matchgroup=OrgColorTag start='c`' end='`' contains=@Spell concealends
syntax region OrgColorTagPurple matchgroup=OrgColorTag start='p`' end='`' contains=@Spell concealends
syntax region OrgColorTagYellow matchgroup=OrgColorTag start='y`' end='`' contains=@Spell concealends
syntax region OrgColorTagOrange matchgroup=OrgColorTag start='o`' end='`' contains=@Spell concealends


syntax region OrgQuote start='^\s*>' end='$' contains=@Spell concealends


" syntax match OrgBar /|/ conceal cchar=│
" " syntax match OrgBar /|\(-\)\@=/ conceal cchar=├
" " syntax match OrgBar /\(-\)\@=|/ conceal cchar=┤
" " syntax match OrgBar /-\zs-/ conceal cchar=─
" " syntax match OrgBar /-\(-\)\@=/ conceal cchar=─
" syntax match OrgBar /-\&-/ conceal cchar=─
" syntax match OrgTablePlus /-\@<=+/ conceal cchar=┼
