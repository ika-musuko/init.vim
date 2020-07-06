call plug#begin('~/.vim/plugged')
" looks
Plug 'ika-musuko/vim-sublime-monokai'

" general'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-rooter'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if executable('dart')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-fugitive'
Plug 'danro/rename.vim'
Plug 'djoshea/vim-autoread'
Plug 'preservim/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'dart-lang/dart-vim-plugin'

call plug#end()

" looks
colorscheme sublimemonokai
set t_Co=256
set t_ut=
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
set background=dark
hi default link BufTabLineCurrent TabLineSel
hi default link BufTabLineActive  Pmenu
hi default link BufTabLineHidden  TabLine
hi default link BufTabLineFill    TabLineFill

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:NERDTreeWinPos = "right"


" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" fzf
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" dart
autocmd BufWrite *.dart Autoformat

" c++
"autocmd BufRead  *.c,*.h,*.cpp,*.hpp silent CocDisable
autocmd BufWrite *.c,*.h,*.cpp,*.hpp silent !ctags -R *

" keybindings plugin-specific
noremap <leader>u :UndotreeToggle<cr>
noremap <C-n> :NERDTreeToggle<cr>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <leader>ac  <Plug>(coc-codeaction)
nnoremap <leader>qf  <Plug>(coc-fix-current)
nnoremap <leader>rn  <Plug>(coc-rename)
nnoremap <leader>e[  <Plug>(coc-diagnostic-prev-error)
nnoremap <leader>e]  <Plug>(coc-diagnostic-next-error)
nnoremap <leader>w[  <Plug>(coc-diagnostic-prev)
nnoremap <leader>w]  <Plug>(coc-diagnostic-next)
nnoremap <leader>ld  <Plug>(coc-list-diagnostics)
noremap <leader>f :Files<cr>
noremap <C-F> :RG<cr>
noremap <C-P> :GFiles<cr>
noremap <leader>r :Lines<cr>
noremap <leader>p :Buffers<cr>

" main settings
filetype plugin indent on
syntax on
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
set tags=~/.mytags

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
