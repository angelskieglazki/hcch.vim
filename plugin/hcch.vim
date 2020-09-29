echo "It's worked!666"

function! Hcch(value1, value2)
    echo a:value1.' '.a:value2
    execute "e " .  a:value1 . "." . a:value2
    execute ":w"
endfunction
function! Hui1()
    echo "Hui"
endfunction

function Test(...)
    echo 'number of args : ' . a:0
    echo 'first arg : ' . a:1
    echo 'second arg : ' . a:2

    echo ''

    for s in a:000
        echon ' ' . s
    endfor
endfunction

command! Scratchify setlocal nobuflisted buftype=nofile bufhidden=delete noswap
command! Scratch new +Scratchify

command! -nargs=* CreateSource call Hcch(<f-args>)
command! -nargs=+ Test call Test(<q-args>)