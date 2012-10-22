" .vimrc -- Sebastian Krog
" See also .gvimrc for gvim specifik settings
set encoding=utf8

" Do not use vi compatibility
set nocompatible

" Set colors to match dark background
set background=dark

" Use syntax highlighting
syntax on

" Use filetype specific settings
filetype plugin on

" Use column, row ruler
set ruler

" Use a custom statusline
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Backspace correctly
set backspace=indent,eol,start

" Make movement keys act correctly
set whichwrap=b,s,<,>,[,],h,l

" Fix tabs
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set smartindent

" Wrap and linebreak on 500 chars
set wrap
set linebreak
set tw=500

" Treat long lines as break lines
map j gj
map k gk

" Keep unsaved buffers
set hidden

" Save backups to custom location
set backupdir=~/.vim/backup

" Show unfinished commandsequence
set showcmd

" Search settings
set incsearch
set ignorecase
set hlsearch
set magic
set scs
set showmatch
set wrapscan

" Remove autocomments
autocmd FileType * setlocal formatoptions-=ro

" Set linenumber color, no default numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGray ctermbg=None
set nonumber

" Use wombat colorscheme
colorscheme wombat

" Use CtrlP
let g:ctrlp_dotfiles = 1
map ff :CtrlPFile
