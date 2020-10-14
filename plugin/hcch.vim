echo "It's worked!666"

let s:END_LINE = "\n"
let s:STAR = " * "
let s:FILE_S = '\file '
let s:AUTHOR_S = '\author '
let s:DATE_S = 'Create on '

function! GetDate(format)
  let format = empty(a:format) ? '+%a %Y-%m-%d %H:%M UTC' : a:format
  let cmd = 'LC_ALL=en_US.UTF-8 /bin/date -u ' . shellescape(format)
  let result = substitute(system(cmd), '[\]\|[[:cntrl:]]', '', 'g')

  return result
endfunction

function! ForSource(sourceName, postfix)
    call append(0, "/**")
    call append(1, ' * '.s:FILE_S.a:sourceName.'.'.a:postfix)
    call append(2, ' * '.s:AUTHOR_S.$USER)
    call append(3, ' * '.s:DATE_S.GetDate(''))
    call append(4, ' * ')
    call append(5, ' */')
    call append(6, '')
    call append(7, '#include "'.a:sourceName.'.h"')

    return
endfunction

function! ForHeader(sourceName)
    call append(0, "/**")
    call append(1, ' * '.s:FILE_S.a:sourceName.'.h')
    call append(2, ' * '.s:AUTHOR_S.$USER)
    call append(3, ' * '.s:DATE_S.GetDate(''))
    call append(4, ' * ')
    call append(5, ' */')
    call append(6, '')
    call append(7, '#ifndef '.toupper(a:sourceName.'_h'))
    call append(8, '#define '.toupper(a:sourceName.'_h'))
    call append(9, '')
    call append(10, '#endif')

    return
endfunction

function! Hcch(value1, value2)
    execute "tabnew"

    execute "e " .  a:value1 . ".h"
    call ForHeader(a:value1)
    execute ":w"
    execute "vsplit"

    execute "e " .  a:value1 . "." . a:value2
    call ForSource(a:value1, a:value2)
    execute ":w"

endfunction

command! -nargs=* CreateSource call Hcch(<f-args>)

