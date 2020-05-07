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
