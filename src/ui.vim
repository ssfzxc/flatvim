"airline{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
" set statusline ^= "airline"
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
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
let g:which_key_map[' '] = [':CocList', 'coc-actions']
" }}}


"application{{{
let g:which_key_map['a'] = {
  \ 'name' : '+application',
  \ 'a'    : [':CocList'                           , 'coc-actions'],
  \ 'c'    : [':Colors'                           , 'color scheme'],
  \ 's'    : ['coc#refresh()'                     , 'coc-refresh'],
  \ 'p': {
    \ 'name' : '+plugins',
    \ 'i': [':DeinInstall', 'install'],
    \ 'u': [':DeinUpdate', 'update']
  \   },
  \ 't'    : {
    \ 'name': '+todo',
    \ 'l'   : [':CocList todolist', 'todolist'],
    \ 'n'   : [':CocCommand todolist.create', 'new todo'],
    \ 'e'   : [':CocCommand todolist.export', 'export todolist'],
    \ 'c'   : [':CocCommand todolist.clear', 'clear todolist']
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
  \ 'y': [':CocList yank'    , 'yanks'],
  \ 'Y': [':CocCommand yank.clear'    , 'clear-yanks'],
  \ }
nnoremap <silent> <Leader>sc :nohlsearch<CR>
  " \ 'c': [':nohlsearch', 'clear-search-highlight'],
"}}}

"Vista/Ctags{{{
let g:which_key_map['v'] = {
  \ 'name' : '+vista/tags',
  \ 'v'    : [':Vista!!'                           , 'vista'],
  \ 'b'    : [':CocCommand fzf-preview.BufferTags' , 'tags-in-current-buffer'],
  \ 'c'    : ['<Plug>(coc-rename)'                 , 'symbol-rename'],
  \ }
"}}}

"git{{{
let g:which_key_map['g'] = {
  \ 'name' : '+git/version-control',
  \ 'f'    : [':CocCommand fzf-preview.GitFiles' , 'gitfiles'],
  \ 'a'    : [':CocCommand fzf-preview.GitActions' , 'actions'],
  \ 'c'    : [':CocCommand fzf-preview.Changes'    , 'changlist'],
  \ 's'    : [':CocCommand fzf-preview.GitStatus' , 'status'],
  \ 'l'    : [':CocCommand fzf-preview.GitLogs'    , 'logs'],
  \ 'L'    : [':CocCommand fzf-preview.GitReflogs', 'reflogs'],
  \ 'b'    : [':CocCommand fzf-preview.GitBranches', 'branches'],
  \ }
"}}}


"major{{{
let g:which_key_map['m'] = {
  \ 'name' : '+marjor',
  \ '='    : [':Format' , 'format'],
  \ }

autocmd filetype javascript let g:which_key_map.m.p = [':Prettier', 'prettier']
autocmd filetype javascriptreact let g:which_key_map.m.p = [':Prettier', 'prettier']
autocmd filetype vue let g:which_key_map.m.p = [':Prettier', 'prettier']
autocmd filetype html let g:which_key_map.m.p = [':Prettier', 'prettier']
autocmd filetype css let g:which_key_map.m.p = [':Prettier', 'prettier']
autocmd filetype less let g:which_key_map.m.p = [':Prettier', 'prettier']
autocmd filetype sass let g:which_key_map.m.p = [':Prettier', 'prettier']
autocmd filetype scss let g:which_key_map.m.p = [':Prettier', 'prettier']
autocmd filetype stylus let g:which_key_map.m.p = [':Prettier', 'prettier']

autocmd filetype markdown let g:which_key_map.m.p = ['<Plug>MarkdownPreview', 'markdown preview']
"}}}

"marks/bookmark{{{
let g:which_key_map['M'] = {
  \ 'name' : '+marks/bookmark',
  \ 'L'    : [':CocCommand fzf-preview.Marks'    , 'marks'],
  \ 'd'    : [':delm!'                          , 'delete-marks'],
  \ 'l'    : [':CocList bookmark'    , 'marks'],
  \ 'm'    : [':CocCommand bookmark.toggle'      , 'bookmark-create/delete'],
  \ 'a'    : [':CocCommand bookmark.annotate'    , 'bookmark-annotate'],
  \ 'p'    : [':CocCommand bookmark.prev'        , 'bookmark-prev'],
  \ 'n'    : [':CocCommand bookmark.next'        , 'bookmark-next'],
  \ 'c'    : [':CocCommand bookmark.clearForCurrentFile', 'bookmark-clear'],
  \ 'C'    : [':CocCommand bookmark.clearForAllFiles', 'bookmark-clear-all'],
  \ }
"}}}

"jump{{{
map  <Leader>jc <Plug>(easymotion-bd-f)
nmap <Leader>jc <Plug>(easymotion-overwin-f)
map <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)
map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

let g:which_key_map['j'] = {
  \ 'name' : '+jump',
  \ 'c'    : 'jump char',
  \ 's'    : ['<Plug>(easymotion-overwin-f2)', 'jump 2char'],
  \ 'l'    : 'jump line',
  \ 'w'    : 'jump word',
  \ 'W'    : ['<Plug>(easymotion-w)'    , 'jump next word'],
  \ 'j'    : ['<Plug>(easymotion-j)'        , 'jump next'],
  \ 'k'    : ['<Plug>(easymotion-k)'        , 'jump prev'],
  \ 'r'    : ['<Plug>(easymotion-repeat)'        , 'jump repeat'],
  \ }
"}}}
"}}}

call which_key#register('<Space>', "g:which_key_map")

" }}}

