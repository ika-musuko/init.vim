call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'mbbill/undotree'
call plug#end()

" looks
colorscheme base16-default-dark
set t_Co=256
set t_ut=
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
set background=dark

" plugin-specific
" undotree
map <leader>u :UndotreeToggle<cr>


" main settings
filetype plugin indent on
syntax enable
set showcmd         " see command as it's being typed
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch        " highlight searches
set encoding=utf8
set fileencodings=utf8
set autoindent
set tabstop=4
set shiftwidth=4

set expandtab
set ls=2            " always show status line
set number
set relativenumber
set ttimeoutlen=100 " less esc key lag


" permanent undo
set undodir=~/.vimdid
set undofile

" vanilla custom commands
command! -nargs=1 Tab set expandtab ts=<args> sw=<args> ai " set custom tab with (ex, :Tab 2)
" force :W and :Q to act like lowercase counterparts
command! W :w 
command! Q :q

" normal split creation
set splitbelow
set splitright
