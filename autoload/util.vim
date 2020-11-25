
function! util#import(file) abort
  if filereadable(g:root_dir . '/src/' . a:file)
    execute 'source ' . g:root_dir  . '/src/' . a:file
  endif
endfunction

function! util#clear_buffers() abort
  if confirm('Kill all other buffers?', "&Yes\n&No\n&Cancel") == 1
    let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    for i in blisted
      if i != bufnr('%')
        try
          exe 'bw ' . i
        catch
        endtry
      endif
    endfor
  endif
endfunction

