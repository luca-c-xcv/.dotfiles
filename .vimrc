" PLUGIN MANAGER -------------------------------------------- {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin(expand('$HOME/.vim/bundle'))
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" PLUGIN LIST ----------------------------------------- {{{
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" example
"Plugin 'tpope/vim-fugitive'
"Plugin 'L9' " plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'git://git.wincent.com/command-t.git' " Git plugin not hosted on GitHub
"Plugin 'file:///home/gmarik/path/to/plugin' " git repos on your local machine (i.e. when working on your own plugin)

"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " The sparkup vim script is in a subdirectory of this repo called vim. Pass the path to set the runtimepath properly.

Plugin 'ascenator/L9', {'name': 'newL9'} " conflict solver between plugins
Plugin 'preservim/nerdtree' " filesystem explorer
Plugin 'itchyny/lightline.vim' " powerline
Plugin 'dense-analysis/ale' " ALE plugin
Plugin 'editorconfig/editorconfig-vim' " editorconf plugin
Plugin 'neoclide/coc.nvim' " coc (conquer of completion) plugin 
Plugin 'doums/darcula' " Darcula theme
Plugin 'devsjc/vim-jb' " JetBrains palette variant
Plugin 'ryanoasis/vim-devicons' " JetBrains icon status
Plugin 'tpope/vim-fugitive'   " Git integration
Plugin 'rhysd/conflict-marker.vim' " Git conflict marker
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim' " interactive filter program for any kind of list;
Plugin 'terryma/vim-multiple-cursors' " multiple cursor
Plugin 'liuchengxu/vista.vim' " outline
Plugin 'iamcco/markdown-preview.nvim' " markdown preview

" }}}
" END PLUGIN LIST -----------------------------------------

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" }}}
" END PLUGIN MANAGER --------------------------------------------


" SETTINGS ---------------------------------------------------------------- {{{
set termguicolors " set true color
set laststatus=2 " set powerline
colorscheme darcula " set theme
syntax on " syntax highlighting
set guifont=Source\ Code\ Pro\ 9
set mouse=a " enable mouse support
set number " line number
set cursorline " cursor line highlighting 
" :highlight Cursorline ctermbg=black " customize the appearance of the current line where the cursor is located
set hlsearch " search pattern highlighting
set showmatch " show matching () [] {}
set wildmenu " enable autocompletation pressing tab
set showcmd " shows partial commands typed in the bottom status line
set clipboard=unnamedplus " use clipboard (Linux: + register)
set exrc " look for a local .vimrc
set secure " prevents execution of potentially unsafe commands in local .vimrc files



" customize the appearance of the current line where the cursor is located
:highlight CursorLine guibg=#3f3f3f 
" customize the appearance of the cursor
:highlight Cursor guibg=#696969


" set space to tab with size 2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" enable icon in the nerdtree tab
let g:nerdtree_show_icons = 1
let g:webdevicons_enable = 1

" type file detection
filetype on
filetype plugin on

" intent file
filetype indent on
filetype plugin indent on


" NERDTree configurations -----------------------------------------------------

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\\d\\+' && bufname('%') !~ 'NERD_tree_\\d+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \\<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\\<CR>:\\<BS>") | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\\<CR>:\\<BS>") | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" CoC Configurations ----------------------------------------------------------

set completeopt=menu,menuone,noselect " CoC: show popup without auto-selecting
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>" " CoC: confirm selected item with Enter

" ALE Configurations ----------------------------------------------------------
" ALE fixer
let g:ale_fixers = {
\ 'c':['clang-format'],
\ 'cpp':['clang-format'],
\}
" set linters 
let g:ale_linters={
      \ 'python': ['pylint'],
      \ 'shell': ['shellcheck'],
      \ 'java': ['javac', 'checkstyle'],
      \ 'c':['clang', 'clangtidy'],
      \ 'cpp':['clang', 'clangtidy'],
      \}


" Vista Configurations" -------------------------------------------------------
let g:vista_default_executive = 'ctags'

" Git Configurations ----------------------------------------------------------

function! ThreeWayMergeBottom()
  " Open conflicted file
  Gdiffsplit!
  " Move current window (merge buffer) to the bottom
  wincmd J
endfunction

" Command to run ThreeWayMergeBottom
command! GMergeBottom call ThreeWayMergeBottom()

" Project-local configs ----------------------------------------------------------

" Load media-desktop .vimrc when editing any file under that project
augroup media_desktop_project
  autocmd!
  autocmd BufRead,BufNewFile /home/luca/Develop/git/lo-tools/media-desktop/*
        \ if !exists('g:media_desktop_loaded') |
        \   source /home/luca/Develop/git/lo-tools/media-desktop/.vimrc |
        \   let g:media_desktop_loaded = 1 |
        \ endif
augroup END


let g:coc_global_extensions = ['coc-java']

if filereadable('/home/luca/Develop/git/.vimrc')
  source /home/luca/Develop/git/.vimrc
endif

" }}} 
" END SETTINGS ----------------------------------------------------------------


" MAPPING -------------------------------------------------- {{{
let mapleader = "\\"

map <C-e> :NERDTreeToggle<CR> " open explorer tab -> Ctrl+e
nnoremap <C-t> :tabnew<CR> " new tab -> Ctrl+t
nnoremap <Tab> :tabnext<CR> " move to right tab -> Tab
nnoremap <S-Tab> :tabprevious<CR> " move to left tab -> Shift+Tab
nnoremap <C-w> :tabclose<CR> " close the current tab -> Ctrl+w
nnoremap <C-a> ggVG " select all
vnoremap <Tab> >gv   " Indent selection and keep it selected
vnoremap <S-Tab> <gv   " Un-indent selection and keep it selected

nnoremap <leader>sh :split<CR>    " Horizontal split of current buffer
nnoremap <leader>sv :vsplit<CR>   " Vertical split of current buffer

nnoremap <leader>Sh :new<CR>      " Horizontal split with new empty buffer
nnoremap <leader>Sv :vnew<CR>     " Vertical split with new empty buffer

nnoremap <leader>sf :split <C-f><CR>    " Horizontal split with chosen file
nnoremap <leader>sF :vsplit <C-f><CR>   " Vertical split with chosen file

nnoremap <C-h> <C-w>h   " Move to the split on the left
nnoremap <C-j> <C-w>j   " Move to the split below
nnoremap <C-k> <C-w>k   " Move to the split above
nnoremap <C-l> <C-w>l   " Move to the split on the right

" --- Resize splits quickly ---
" nnoremap <C-Up>    <C-w>+   " Increase height of current split
" nnoremap <C-Down>  <C-w>-   " Decrease height of current split
" nnoremap <C-Left>  <C-w><   " Decrease width of current split
" nnoremap <C-Right> <C-w>>   " Increase width of current split
" nnoremap <leader>=  <C-w>=  " Make all splits equal size

nnoremap <leader>sw :close<CR>   " Close current split
nnoremap <leader>so <C-w>o      " Close all other splits

nnoremap <F8> :Vista!!<CR> " toggle outline sidebar
nnoremap <leader>o :Vista finder<CR>
nnoremap <leader>O :Vista<CR> " open sidebar

" }}}

