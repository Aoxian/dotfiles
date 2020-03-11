set nocompatible
filetype off

execute pathogen#infect()
syntax on
filetype plugin indent on

" Use Ctrl + [h,j,k,l] to move window focus
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" The NERDTree 
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" test.vim
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ts :TestSuite<CR>
nnoremap <Leader>tl :TestLast<CR>
nnoremap <Leader>tg :TestVisit<CR>

" vim-mix-format
let g:mix_format_on_save = 1
let g:elm_format_on_save = 1

" UI
set number			" line numbers
set showcmd			" show command at bottom
set showmatch			" highlight matching [{()}]
set clipboard=unnamed		" share clipboard
set tabstop=2			" spaces per tab
set softtabstop=2		" tab while typing
set scrolloff=4			" scroll offset
set backspace=indent,eol,start	" can backspace in insert mode
set mouse=a			" can scroll with mouse

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin 'avakhov/vim-yaml'                          " Yaml syntax
Plugin 'bronson/vim-trailing-whitespace'           " Hightlight trailing whitespace
Plugin 'kien/rainbow_parentheses.vim'              " Parenthesis highlighting
Plugin 'MarcWeber/vim-addon-mw-utils'              " Interprets file by extension
Plugin 'tpope/vim-surround'                        " Better parenthesis support
Plugin 'itchyny/lightline.vim'                     " Better status line
Plugin 'elmcast/elm-vim'                           " Elm plugin
Plugin 'elixir-lang/vim-elixir'                    " Elixir plugin
Plugin 'slashmili/alchemist.vim'                   " Elixir plugin for ElixirSense
Plugin 'elzr/vim-json'                             " Json
Plugin 'w0rp/ale'                                  " Linting engine
Plugin 'pangloss/vim-javascript'                   " Javascript
Plugin 'othree/yajs.vim'                           " javascript syntax
Plugin 'mxw/vim-jsx'                               " JSX highlighting


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


filetype plugin indent on
au FileType json setl sw=2 sts=2 et                " Indentation for json

" ================================================ ale lint ==========================================
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1

