echo "It's worked!666"

function! GetDate(format)
  let format = empty(a:format) ? '+%a %Y-%m-%d %H:%M UTC' : a:format

  let cmd = 'LC_ALL=en_US.UTF-8 /bin/date -u ' . shellescape(format)
  let result = substitute(system(cmd), '[\]\|[[:cntrl:]]', '', 'g')



        return result
endfunction

function! Hcch(value1, value2)
    echo a:value1.' '.a:value2
    execute "e " .  a:value1 . "." . a:value2
    let TodayDate=GetDate('')
    "system("date")
    execute ":put =TodayDate"
"    execute ":w"
endfunction

function! Test(...)
    echo 'number of args : ' . a:0
    echo 'first arg : ' . a:1
    echo 'second arg : ' . a:2

endfunction

command! Scratchify setlocal nobuflisted buftype=nofile bufhidden=delete noswap
command! Scratch new +Scratchify

command! -nargs=* CreateSource call Hcch(<f-args>)
command! -nargs=* Test call Test(<f-args>)
