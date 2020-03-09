execute pathogen#infect()
syntax on
set number
filetype plugin indent on

" Use Ctrl + [h,j,k,l] to move window focus
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" The NERDTree 
map <C-n> :NERDTreeToggle<CR>

" test.vim
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ts :TestSuite<CR>
nnoremap <Leader>tl :TestLast<CR>
nnoremap <Leader>tg :TestVisit<CR>

" vim-mix-format
let g:mix_format_on_save = 1
