" Vim plugin for integration with dnote
" Last Change: 09-02-2011 11:36:01  IST
" Maintainer:  Dhruva Sagar <dhruva.sagar@gmail.com>
" Licence:     This file is placed in the public domain.

if exists("g:loaded_dnote") || &cp
  finish
endif
let g:loaded_dnote = 1
let s:keepcpo = &cpo
set cpo&vim

let s:dnote="dnote"
let s:dnote_buffer="dnote_buffer"

if !executable(s:dnote)
  finish
endif

command! -nargs=? Dnote :call s:Dnote()

function! s:Dnote()
  let l:prev_bufnr = bufnr('%')
  if bufnr("dnote_buffer") > 0
    execute 'silent bdelete dnote_buffer'
  end
  execute 'new dnote_buffer'
  let s:dnote_bufnr = bufnr('%')
  setlocal noro ma
  silent execute ':0r!'.s:dnote
  setlocal ro noma nomod nomodeline
endfunction
