
function! s:multi_edit_files(files)
    if len(a:files) == 1
        let l:file = s:map_file('', a:files[0])
        " if isdirectory(l:file)
        "     call fzf#files#Run(l:file)
        " else
            execute 'silent e' l:file
            if s:path ==? 'git'
                sleep 100m
                execute 'normal gg'
                execute "normal \<plug>(signify-next-hunk)"
            end
        " endif
    else
        call setqflist(
        \   map(
        \       map(copy(a:files), function('s:map_file')),
        \       '{ "filename": v:val, "lnum": 1, "col": 1 }',
        \   )
        \)
        copen
        cc
    end
endfunction

function! fzf#files#Run(path)
    let s:path = a:path
    let s:files_status = {}

    function! s:files(path)

        if a:path ==? 'git'
            let l:files = systemlist('git diff --name-only ' . g:gitHead) + systemlist('git ls-files --exclude-standard --others')
            if v:shell_error ==? 129
                throw 'this is not a git repo'
            endif
        else
            let l:files = systemlist($FZF_DEFAULT_COMMAND . ' -- ' . a:path)
            " let l:files = l:files + systemlist('dirname '. join(l:files, ' ') . ' | sort -u')
        end

        if len(l:files) > 10000
            return l:files
        else
            let l:status_lines = systemlist('git diff --name-status ' . g:gitHead)
            if !v:shell_error
                for l:status_line in l:status_lines
                    let s:files_status[split(l:status_line, '	')[1]] = split(l:status_line, '	')[0]
                endfor
                let l:untracked_files = systemlist('git ls-files --exclude-standard --others')
                for l:untracked_file in l:untracked_files
                    let s:files_status[untracked_file] = '??'
                endfor
            endif

            return s:prepend_icon(l:files)
        endif
    endfunction

    function! s:prepend_icon(candidates)
        let l:result = []
        for l:candidate in a:candidates
            let l:filename = fnamemodify(l:candidate, ':p:t')
            let l:git_icon = get(s:files_status, l:candidate, ' ')
            let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
            let l:color_map = {
            \   '': '[0;36m[0m',
            \   '': '[0;36m[0m',
            \   '': '[0;97m[0m',
            \   '': '[0;98m[0m',
            \   '': '[0;36m[0m',
            \   '': '[0;34m[0m',
            \   '': '[0;33m[0m',
            \   '': '[0;33m[0m',
            \   '': '[0;32m[0m',
            \   '': '[0;32m[0m',
            \   '': '[0;34m[0m',
            \   '': '[0;36m[0m',
            \   '': '[0;33m[0m',
            \   'M': '[0;33m◉[0m',
            \   'D': '[0;31m✖[0m',
            \   '??': '[0;34m◈[0m',
            \}
            call add(
            \   l:result,
            \   printf(
            \       '%s %s %s',
            \       get(l:color_map, l:git_icon, '[0;32m' . l:git_icon . '[0m'),
            \       get(l:color_map, l:icon, '[0;31m' . l:icon . '[0m'),
            \       l:candidate
            \   )
            \)
        endfor

        return l:result
    endfunction

    function! s:map_file(_key, file)
        let l:pos = stridx(a:file, ' ')
        return a:file[pos+1:-1]
    endfunction


    if a:path ==? 'git'
        let l:fzf_files_options = '--preview "bat --italic-text=always --style=numbers,changes --color always {2..-1} | grep -A5 -B5 --color=never -P \"^..\d+.{0,30}[\+|\_|~]\""'
    else
        let l:fzf_files_options = ''
    end

    call fzf#run(fzf#wrap({
    \   'source': <sid>files(a:path),
    \   'sink*': function('s:multi_edit_files'),
    \   'options': '--multi ' . l:fzf_files_options . ' --prompt ' . a:path . '/\ ',
    \   'window': 'call fzf#floating_window#Create()',
    \}))

endfunction
