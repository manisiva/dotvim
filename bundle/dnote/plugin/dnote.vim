" Vim plugin for integration with dnote
" Last Change: 09-02-2011 11:36:01  IST
" Maintainer:  Dhruva Sagar <dhruva.sagar@gmail.com>
" Licence:     This file is placed in the public domain.

if exists("g:loaded_dnote") || &cp
  finish
endif
let g:loaded_dnote = 1

if !executable('dnote')
  finish
endif

if !exists("g:dnote")
  let g:dnote="dnote"
endif

function! s:OpenIfNew(name)
  let buf_no = bufnr(expand(a:name))
  if buf_no > 0
    execute 'bw! '.a:name
  endif
  execute ':sp '.a:name
endfunction

 
function! s:Dnote()
  let l:dnote_filename = 'dnote'
  if bufnr(l:dnote_filename) > 0
    execute 'bd! '.l:dnote_filename
  endif
  execute 'new '.l:dnote_filename

  let old_report=&report
  let &report=9999
  set modifiable
  execute "silent execute ':0r!".g:dnote." '"
  set nomodifiable
  set buftype="quickfix"
  let &report=old_report
  execute 'normal 1G'
endfunction

command! -nargs=? Dnote :call s:Dnote()
