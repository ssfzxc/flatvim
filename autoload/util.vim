
function! util#import(file) abort
  if filereadable(g:root_dir . '/src/' . a:file)
    execute 'source ' . g:root_dir  . '/src/' . a:file
  endif
endfunction
