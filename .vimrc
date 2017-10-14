" Plugins
call plug#begin('~/.vim/plugged')

    Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
    Plug 'vim-javascript'
    Plug 'ashfinal/vim-colors-paper'
    Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" Config
set laststatus=2

" Typing
:set tabstop=4
:set shiftwidth=4
:set expandtab

" Theme
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
set background=dark
colorscheme PaperColor
