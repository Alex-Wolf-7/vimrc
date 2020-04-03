"""""""""""""""""""""""""""
" Alex Wolf configuration "
"""""""""""""""""""""""""""
set encoding=utf8
set shell=/bin/bash

"""" START Vundle Configuration 

" Disable file type for vundle
set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'
  " Ctrl-N to open, HJKL to navigate, enter to open, t for new tab, w for new
  " window, s for new vert split, i for horizontal split
Plugin 'Xuyuanp/nerdtree-git-plugin'
  " makes those nice git icons on nerdtree
Plugin 'majutsushi/tagbar'
Plugin 'BufOnly.vim'
  " Clear all buffers with Ctrl-^. Switch buffers with g b 
Plugin 'wesQ3/vim-windowswap'
  " to create new split, :vsp <filename>
  " for horizontal, :sp instead
  " <leader>ww on each window to swap them
  " to switch windows, <ctrl-w> then h, j, k, or l
Plugin 'SirVer/ultisnips'
  " Snippit support!
Plugin 'honza/vim-snippets'
  " Default snippits
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
  " :FZF to search for things
  " :GFiles to search git repo for things
Plugin 'godlygeek/tabular'
  " :tab /<delim> where <delim> is the char you want to space evenly. :tab /@
  " @ lemon      @ french toast!!! @
  " @ mee        @ test            @
  " @ friendship @ test            @
Plugin 'jeetsukumaran/vim-buffergator'
  " gb or gB to switch buffers
  " <leader>B to open buffer splittin' window
  "   <Enter> to edit buffer in this window, <C-V> for vert split, <C-S> for
  "   hori split, <C-T> for new tab
Plugin 'universal-ctags/ctags'
  " finds tags necessary for tagbar to do its thing
Plugin 'tomtom/tcomment_vim'
  " gcc to comment out line, or gc+<move command>, or visual mode+gc

Plugin 'fatih/vim-go'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""
" Vim Options "
"""""""""""""""
" Colors!
syntax on
set t_Co=256

" No arrows on
let g:elite_mode=1

" Always display status line
set laststatus=1

" Text does not wrap
set nowrap

" OSX stupid backspace fix
set backspace=indent,eol,start

" Show linenumbers
set number

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab

" Highlight current line
set cursorline

""""""""""""""""""
" Plugin Options "
""""""""""""""""""
" FZF colors :)
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

""""""""""""""""
" Key Mappings "
""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" No arrow keys, lol
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

set noerrorbells

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
set wildignore+=build/**,vendor/**

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
