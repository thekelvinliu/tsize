" only load once
if exists('g:loaded_tsize')
  finish
endif
let g:loaded_tsize = 1

" ex command
command! TSIZEH call s:tsize('h')
command! TSIZEJ call s:tsize('j')
command! TSIZEK call s:tsize('k')
command! TSIZEL call s:tsize('l')

" plug mapping
noremap <silent> <plug>(tsize_h) :call <sid>tsize('h')<cr>
noremap <silent> <plug>(tsize_j) :call <sid>tsize('j')<cr>
noremap <silent> <plug>(tsize_k) :call <sid>tsize('k')<cr>
noremap <silent> <plug>(tsize_l) :call <sid>tsize('l')<cr>

" read g:tsize_amount
let s:tsize_amount = get(g:, 'tsize_amount', 3)

" direction maps
let s:actions = {
  \ 'h': 'vertical resize -',
  \ 'j': 'resize +',
  \ 'k': 'resize -',
  \ 'l': 'vertical resize +',
  \ }
let s:opposites = { 'h': 'l', 'j': 'k', 'k': 'j', 'l': 'h' }

" return whether the current window borders the edge in the given direction
function! s:is_window_edge(direction)
  " select window in given direction and check whether window changed
  let orig = winnr()
  execute 'wincmd ' . a:direction
  let is_edge = orig ==# winnr()

  " return to original window if it wasn't on the edge
  if !is_edge
    execute orig . 'wincmd w'
  endif

  return is_edge
endfunction

" resize current window in the given direction
function! s:tsize(direction)
  " do nothing if given bad direction
  if !has_key(s:actions, a:direction)
    return
  endif

  let action = get(s:actions, a:direction)
  let opposite = get(s:opposites, a:direction)
  let is_increase = a:direction ==? 'j' || a:direction ==? 'l'
  let savedwin = winnr()

  if s:is_window_edge(is_increase ? a:direction : opposite)
    execute 'wincmd ' . (is_increase ? opposite : a:direction)
    execute action . s:tsize_amount
    execute savedwin . 'wincmd w'
  else
    execute action . s:tsize_amount
  endif
endfunction
