scriptencoding utf-8

if &compatible
	set nocompatible
endif

" Public Options {{{

let g:escape_key_binding = 'jk'

let g:edit_mode = 'emacs'

" }}}


" global options{{{

let g:cache_dir = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : "~/.cache") . '/vim')
lockvar g:cache_dir

let g:root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
lockvar g:root_dir

let g:bundle_dir = g:root_dir . '/bundle'
lockvar g:bundle_dir

let g:plugin_dir = g:root_dir . '/.plugins'
lockvar g:plugin_dir

" }}}

function! s:general_map() 
  execute 'inoremap ' . g:escape_key_binding . ' <ESC>'

  if g:edit_mode == 'emacs'
    inoremap <C-f> <Right>
    inoremap <C-b> <left>
    inoremap <C-a> <Home>
    inoremap <C-e> <End>
    cnoremap <C-f> <Right>
    cnoremap <C-b> <left>
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>
    cnoremap <C-d> <Delete>
  endif
endfunction


function! s:main()
  " let s:default_plugin_paths = split(globpath(g:bundle_dir, '*'), '\n')
  " for l:plugin_path in s:default_plugin_paths
  "   execute 'set runtimepath+=' . l:plugin_path 
  "   if finddir(l:plugin_path . '/doc') 
  "     execute 'helptags ' . l:plugin_path . '/doc'
  "   endif
  " endfor

  call s:general_map()

endfunction


call s:main()

"import configuration files{{{
call util#import('plugin.vim')
call util#import('general.vim')
call util#import('completion.vim')
call util#import('enhance.vim')
call util#import('filetype.vim')
call util#import('fuzzyfind.vim')
call util#import('languages.vim')
call util#import('ui.vim')
call util#import('version.vim')
"}}}

" vim: set ts=2 sw=2 tw=80 noet :
