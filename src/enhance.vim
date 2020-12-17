" rainbow{{{
let g:rainbow_active = 1
" }}}

" accelerated_jk{{{
nmap <silent>j <Plug>(accelerated_jk_gj)
nmap <silent>k <Plug>(accelerated_jk_gk)
" }}}

"asynctasks/asyncrun{{{
let g:asyncrun_open = 6
"}}}


"easymotion{{{
let g:EasyMotion_smartcase = 1
let g:EasyMotion_leader_key = '<LocalLeader>'
"}}}

" vim-commentary {{{
" autocmd! BufRead,BufNewFile *.vue setlocal commentstring=//\ %s
augroup comment_ft
  autocmd!
  autocmd FileType vue set commentstring=//\ %s
augroup END
" }}}
