"airline{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
set statusline ^= "airline"
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
"}}}


" vim-floaterm{{{
" Set floaterm window's background to black
" hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
" hi FloatermBorder guibg=none guifg=cyan
" }}}


" vim-which-key{{{
set timeoutlen=500

let g:mapleader = "\<Space>"
let g:maplocalleader = '\\'
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\\'<CR>
let g:which_key_map =  {}

" root{{{
let g:which_key_map["'"] = [':CocCommand floaterm.new', 'open shell']
let g:which_key_map['?'] = [':Maps', 'Mappings']
" }}}


"application{{{
let g:which_key_map['a'] = {
  \ 'name' : '+application',
  \ 'a'    : [':CocList'                           , 'coc-actions'],
  \ 'c'    : [':Colors'                           , 'color scheme'],
  \ 'p': {
    \ 'name' : '+plugins',
    \ 'i': [':DeinInstall', 'install'],
    \ 'u': [':DeinUpdate', 'update']
  \   }
  \ }
"}}}


" windows{{{
let g:which_key_map['1..9'] = 'select windows 0..9'
for s:i in range(1, 9)
  let g:which_key_map[s:i] = 'which_key_ignore'
  execute 'nnoremap <Leader>' . s:i . ' <C-w>' . s:i . 'w'
endfor

let g:which_key_map['w'] = {
      \ 'name' : '+windows'                              ,
      \ 'W' : [':Windows'      , 'list-windows']          ,
      \ 'w' : ['<C-W>w'       , 'other-window']          ,
      \ 'd' : ['<C-W>c'       , 'delete-window']         ,
      \ 's' : ['<C-W>s'       , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'       , 'split-window-right']    ,
      \ 'h' : ['<C-W>h'       , 'window-left']           ,
      \ 'j' : ['<C-W>j'       , 'window-below']          ,
      \ 'l' : ['<C-W>l'       , 'window-right']          ,
      \ 'k' : ['<C-W>k'       , 'window-up']             ,
      \ 'H' : ['<C-W>5<'      , 'expand-window-left']    ,
      \ 'J' : [':resize +5'   , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'      , 'expand-window-right']   ,
      \ 'K' : [':resize -5'   , 'expand-window-up']      ,
      \ '=' : ['<C-W>='       , 'balance-window']        ,
      \ 'm' : ['<C-W>o'       , 'maximize-window']       ,
      \ }
" }}}

" buffers{{{
let g:which_key_map['<Tab>'] = [':bn', 'last-buffer']
let g:which_key_map['b'] = {
      \ 'name' : '+buffers' ,
      \ 'b'   : [':CocCommand fzf-preview.Buffers'    , 'list-buffers']    ,
      \ 'd'   : [':bd'                                , 'delete-buffer']   ,
      \ 'f'   : [':bfirst'                            , 'first-buffer']    ,
      \ 'l'   : [':blast'                             , 'last-buffer']     ,
      \ 'n'   : [':bnext'                             , 'next-buffer']     ,
      \ 'p'   : [':bprevious'                         , 'previous-buffer'] ,
      \ '1..9': 'select buffers 1..9'                                     ,
      \ }
      " \ 'h'   : ['Startify'                          , 'home-buffer']     ,

for s:i in range(1, 9)
  let g:which_key_map.b[s:i] = 'which_key_ignore'
  execute 'nmap <Leader>b' . s:i . ' <Plug>AirlineSelectTab' . s:i
endfor

"}}}

"files{{{
let g:which_key_map.0 = [':CocCommand explorer', 'File explorer']
let g:which_key_map['f'] = {
      \ 'name' : '+file' ,
      \ 'f'    : [':CocCommand fzf-preview.ProjectFiles'     , 'list-files']      ,
      \ 'r'    : [':CocCommand fzf-preview.ProjectMrwFiles'  , 'recent']          ,
      \ 'h'    : [':CocCommand fzf-preview.OldFiles'         , 'history']         ,
      \ 's'    : [':w'                                       , 'Save']            ,
      \ 'S'    : [':wa'                                      , 'Save all']        ,
      \ 't'    : [':CocCommand explorer'                     , 'File explorer']   ,
      \ 'v'    : {
        \ 'name' : '+vim' ,
        \ 'd'    : [':e $MYVIMRC', 'open dotfile'],
        \ }
      \ }
"}}}

"search/symbol{{{
let g:which_key_map['s'] = {
  \ 'name' : '+search/symbol',
  \ 'l': [':CocCommand fzf-preview.BufferLines', 'search-all-buffer'],
  \ 'L': [':CocCommand fzf-preview.Lines', 'search-current-buffer'],
  \ 'j': [':CocCommand fzf-preview.Jumps', 'search-selected'],
  \ 'a': [':Ag', 'ag'],
  \ 'r': [':Rg', 'rg'],
  \ 'c': 'clear-search-highlight',
  \ }
nnoremap <silent> <Leader>sc :nohlsearch<CR>
  " \ 'c': [':nohlsearch', 'clear-search-highlight'],
"}}}

"Vista/Ctags{{{
let g:which_key_map['v'] = {
  \ 'name' : '+vista/tags',
  \ 'v'    : [':Vista!!'                           , 'vista'],
  \ 'b'    : [':CocCommand fzf-preview.BufferTags' , 'tags-in-current-buffer'],
  \ }
"}}}

"git{{{
let g:which_key_map['g'] = {
  \ 'name' : '+git/version-control',
  \ 'a'    : [':CocCommand fzf-preview.GitActions' , 'actions'],
  \ 'c'    : [':CocCommand fzf-preview.Changes'    , 'changlist'],
  \ 's'    : [':CocCommand fzf-preview.GitStatus' , 'status'],
  \ }
"}}}


"marks/major{{{
let g:which_key_map['m'] = {
  \ 'name' : '+marks/marjor',
  \ '='    : [':Format' , 'format'],
  \ 'm'    : [':CocCommand fzf-preview.Marks'    , 'marks'],
  \ }

autocmd filetype markdown let g:which_key_map.m.p = ['<Plug>MarkdownPreview', 'markdown preview']
"}}}


call which_key#register('<Space>', "g:which_key_map")

" }}}

