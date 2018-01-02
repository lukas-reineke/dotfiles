if exists('b:did_ftplugin')
    finish
endif

let b:did_ftplugin = 1

setlocal iskeyword=@,48-57,_,-,?,!,192-255
setlocal omnifunc=csscomplete#CompleteCSS

