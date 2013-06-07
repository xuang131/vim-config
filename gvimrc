
"set guifont
if has("gui_macvim")
  "for mac
  set guifont=Monaco:h16
else
  "for ubuntu
  set guifont=Monospace\ 12
endif

if has('gui_macvim')
  noremap <D-1> 1gt
  noremap <D-2> 2gt
  noremap <D-3> 3gt
  noremap <D-4> 4gt
  noremap <D-5> 5gt
  noremap <D-6> 6gt
  noremap <D-7> 7gt
  noremap <D-8> 8gt
  noremap <D-9> 9gt
  noremap <D-0> :tablast<cr>
else
  noremap <a-1> 1gt
  noremap <a-2> 2gt
  noremap <a-3> 3gt
  noremap <a-4> 4gt
  noremap <a-5> 5gt
  noremap <a-6> 6gt
  noremap <a-7> 7gt
  noremap <a-8> 8gt
  noremap <a-9> 9gt
  noremap <a-0> :tablast<cr>
end

