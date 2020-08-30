call plug#begin("~/.vim/plugged")
"Plugin Section
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'honza/vim-snippets'

  "" Color
  Plug 'dracula/vim'
  "Plug 'crusoexia/vim-monokai'

  "*****************************************************************************
  "" Custom bundles
  "*****************************************************************************

  " javascript
  "" Javascript Bundle
"  Plug 'jelera/vim-javascript-syntax'

  " php
  "" PHP Bundle
  Plug 'arnaud-lb/vim-php-namespace'

  "*****************************************************************************
  "*****************************************************************************
call plug#end()

"Config Section
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
let g:airline_theme='dracula'
"colorscheme monokai

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

let g:airline_powerline_fonts = 1
"let g:airline_theme = 1
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set undodir=path/to/dir
set nu
set ruler
set expandtab
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set noswapfile

"" Enable hidden buffers
set hidden

"" Directories for swp files
set nobackup
set noswapfile


"Config COC
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

"Config nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"Integrated Terminal
" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" uses zsh instead of bash
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Config finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

