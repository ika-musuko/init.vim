call plug#begin('~/.vim/plugged')
" looks
Plug 'chriskempson/base16-vim'

" general
Plug 'mbbill/undotree'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'natebosch/vim-lsc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-buftabline'

" flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc-dart'

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
let g:lsc_auto_map = v:true
"       'GoToDefinition': <C-]>,
"       'GoToDefinitionSplit': [<C-W>], <C-W><C-]>],
"       'FindReferences': gr,
"       'NextReference': <C-n>,
"       'PreviousReference': <C-p>,
"       'FindImplementations': gI,
"       'FindCodeActions': ga,
"       'Rename': gR,
"       'DocumentSymbol': go,
"       'WorkspaceSymbol': gS,
"       'SignatureHelp': gm,
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>r :Rg<cr>

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
command! W :w 
command! Q :q
command! Reload :so ~/.config/nvim/init.vim

" normal split creation
set splitbelow
set splitright

" buffer related
map <leader>[ :bp<CR>
map <leader>] :bn<CR>
map <leader>q :bd<CR>
map <leader>l :ls<CR>
nnoremap <C-S> :wall<CR>
noremap <C-N> :Lex<CR>
noremap! <C-N> :Lex<CR>
noremap <leader>e :Ex<CR>
noremap! <leader>e :Ex<CR>
noremap <leader>s :Sex<CR>
noremap! <leader>s :Sex<CR>
noremap <leader><space> za
nnoremap <leader>g :e <cfile><cr>
nnoremap <leader>% :e %<cr>


