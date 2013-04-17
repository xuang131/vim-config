
"set guifont
if has("gui_macvim")
  "for mac
  set guifont=Monaco:h16
else
  "for ubuntu
  set guifont=Monospace\ 12
  winpos 235 180
  set lines=38 columns=150
endif
