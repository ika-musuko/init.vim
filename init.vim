call plug#begin('~/.vim/plugged')
" looks
Plug 'chriskempson/base16-vim'

" general
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
if executable('dart')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'danro/rename.vim'
Plug 'djoshea/vim-autoread'

" autoformat
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
hi default link BufTabLineCurrent TabLineSel
hi default link BufTabLineActive  Pmenu
hi default link BufTabLineHidden  TabLine
hi default link BufTabLineFill    TabLineFill


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
nmap <leader>ld  <Plug>(coc-list-diagnostics)

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" fzf
map <leader>f :Files<cr>
map <leader>r :Lines<cr>
map <leader>p :Buffers<cr>

" autoformat on save
autocmd BufWrite *.dart Autoformat
autocmd BufWrite *.c,*.h,*.cpp,*.hpp silent !rm tags; ctags -R *

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
set clipboard+=unnamedplus
set ts=4 sts=4 sw=4

" indenting
set expandtab
autocmd FileType c,cpp       setlocal ts=4 sts=4 sw=4
autocmd FileType lua         setlocal ts=4 sts=4 sw=4

autocmd FileType dart        setlocal ts=2 sts=2 sw=2
autocmd FileType html        setlocal ts=2 sts=2 sw=2
autocmd FileType css         setlocal ts=2 sts=2 sw=2
autocmd FileType javascript  setlocal ts=2 sts=2 sw=2

" permanent undo
set undodir=~/.vimdid
set undofile

" vanilla custom commands
command! -nargs=1 Tab set expandtab ts=<args> sw=<args> ai " set custom tab with (ex, :Tab 2)
command! W :w
command! Q :q
command! Reload :so ~/.config/nvim/init.vim
command! BufOnly execute '%bdelete|edit #|normal `"'
function RelativeToggle()
    if &relativenumber ==# "norelativenumber"
        set relativenumber
    else
        set norelativenumber
    endif
endfunction
noremap  <silent><F10> :call RelativeToggle()<cr>

" split settings
set splitbelow
set splitright
noremap  <C-H> <C-W><C-H>
noremap  <C-J> <C-W><C-J>
noremap  <C-K> <C-W><C-K>
noremap  <C-L> <C-W><C-L>
inoremap <C-H> <C-W><C-H>
inoremap <C-J> <C-W><C-J>
inoremap <C-K> <C-W><C-K>
inoremap <C-L> <C-W><C-L>

" buffer related
noremap <leader>[ :bp!<cr>
noremap <leader>] :bn!<cr>
noremap <C-Q> :bd<cr>
noremap <leader>l :ls<cr>
noremap <leader>bo :BufOnly<cr>
noremap <C-S> :wall<cr>

" netrw
noremap <leader>n :Lex<cr>
noremap <leader>e :Ex<cr>
noremap <leader>s :Sex<cr>

" folds
noremap <leader><space> za

" turn off highlight
nnoremap <silent><Return>       :noh<cr><Return>
nnoremap <silent><S-Return>     :noh<cr>
