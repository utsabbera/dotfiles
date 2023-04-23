" ESC alternative
inoremap jk <esc>

" Syntax and numbering
syntax on 		" Sets syntax highlighting on
set number		" Sets line numbering

" Highliting
set incsearch 		" Incremental search. Highlights while typing
set hlsearch		" Highlights search results once typed

" Status
set showcmd
set ruler

" Wrap
set wrap

" Backup
set nobackup

" Delay
set updatetime=100

" Indentation
filetype indent on	" Turns on autoindent based on filetype
set autoindent 		" Auto indentation
set expandtab  		" Converts tabs to spaces
set tabstop=2		" Width of spce for a \t char read from file
set softtabstop=2	" Width of tab when tab key of backspace is pressed
set shiftwidth=2	" Width of tab on indentation

" Leader
let mapleader=","

" Custom mappings
nnoremap <leader><space> :set relativenumber!<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Switching buffer
nnoremap <leader>nb :bnext<cr>
nnoremap <leader>np :bprev<cr>

" Writing a file
nnoremap <leader>w :w<cr>

" Selection
nnoremap <leader>a vggoG$

" Copy text to system clipboard
vnoremap <C-y> "*y

" Quit
nnoremap <leader>fq :q!<cr>

" Colorscheme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column = 'bg0'
colo gruvbox

" Auto Indentation
autocmd BufWritePre *.js :normal gg=G``

" Sh templet
autocmd BufNewFile *.sh :normal i#! /bin/bash

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅ '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '  '
let g:airline_symbols.maxlinenr = ' ☰ '
let g:airline_symbols.dirty='⚡'

" Airline Themes
let g:airline_theme='gruvbox'

" DevIcons
let g:webdevicons_conceal_nerdtree_brackets = 1
