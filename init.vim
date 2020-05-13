call plug#begin('~/.vim/plugged')
" looks
Plug 'chriskempson/base16-vim'

" general
Plug 'mbbill/undotree'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-buftabline'
Plug 'Chiel92/vim-autoformat'

" flutter
Plug 'dart-lang/dart-vim-plugin'

call plug#end()

" looks
colorscheme base16-default-dark
set t_Co=256
set t_ut=
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
set background=dark

" plugin-specific
map <leader>u :UndotreeToggle<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn  <Plug>(coc-rename)
nmap <leader>e[  <Plug>(coc-diagnostic-prev-error)
nmap <leader>e]  <Plug>(coc-diagnostic-next-error)
nmap <leader>w[  <Plug>(coc-diagnostic-prev)
nmap <leader>w]  <Plug>(coc-diagnostic-next)

" fzf
map <leader>f :Files<cr>
map <leader>r :Lines<cr>
map <leader>p :Buffers<cr>

" autoformat on save
au BufWrite *.dart :Autoformat

" main settings
filetype plugin indent on
syntax enable
set showcmd         " see command as it's being typed
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set hlsearch        " highlight searches
set encoding=utf8
set fileencodings=utf8
set autoindent
set ls=2            " always show status line
set number
set relativenumber
set ttimeoutlen=100 " less esc key lag
set mouse=a

" indenting
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" permanent undo
set undodir=~/.vimdid
set undofile

" vanilla custom commands
command! -nargs=1 Tab set expandtab ts=<args> sw=<args> ai " set custom tab with (ex, :Tab 2)
command! W :w
command! Q :q
command! Reload :so ~/.config/nvim/init.vim
command! BufOnly execute '%bdelete|edit #|normal `"'

" normal split creation
set splitbelow
set splitright

" buffer related
map <leader>[ :bp!<cr>
map <leader>] :bn!<cr>
map <leader>q :bd<cr>
map <leader>l :ls<cr>
map <leader>bo :BufOnly<cr>
map <C-S> :wall<cr>

" netrw
map <leader>n :Lex<cr>
map <leader>e :Ex<cr>
map <leader>s :Sex<cr>

" folds
map <leader><space> za


