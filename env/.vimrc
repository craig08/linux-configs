syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nu
set incsearch
set hlsearch
set ignorecase
set smartcase

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go'
Plug 'stamblerre/gocode'
Plug 'flazz/vim-colorschemes'
Plug 'rhysd/vim-clang-format'
Plug 'tell-k/vim-autopep8'

call plug#end()

let mapleader=","
nnoremap <leader>e :tabe 
nnoremap <leader>c :tabclose<CR>
nnoremap <leader>b :Gblame<CR>
nnoremap <leader>v :Gvdiff<CR><C-w><C-x>
nnoremap <leader>t :GoTestFunc<CR>
nnoremap <leader>l :TlistToggle<CR>
nnoremap <leader>g :GitGutterSignsToggle<CR>
nnoremap <leader>r :source $MYVIMRC<CR>:echo $MYVIMRC "has been reloaded>^.^<"<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

set list
set listchars=tab:>\ 
set scrolloff=3

" copy and paste between different Vim sessions
nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

" remember last cursor location when open file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd FileType go setlocal shiftwidth=4 tabstop=4 list noexpandtab
autocmd FileType cc setlocal shiftwidth=2 tabstop=2 softtabstop=2 list
autocmd FileType h setlocal shiftwidth=2 tabstop=2 softtabstop=2 list

" EasyMotion
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" cscope
set cscopetag
set csto=1
let $csPath="cscope.out"
for ind in range(0, 5)
    if filereadable($csPath)
        let g:CCTreeCscopeDb = $csPath
        cs add $csPath
        break
    endif
    let $csPath = "../" . $csPath
endfor

" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_fmt_autosave = 1
"let g:go_metalinter_autosave = 1
"let g:go_list_type = "quickfix"
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"let g:go_metalinter_enabled = ['golint']
"let g:go_metalinter_command = "golangci-lint run --disable-all"
set splitbelow

" clang format
" install clang-format package first
autocmd FileType c,cpp,cc ClangFormatAutoEnable
let g:clang_format#style_options = {
            \ "SortIncludes": "false",
            \ "IndentWidth" : 2}

colorscheme molokai
"colorscheme hybrid
"colorscheme peaksea
set background=dark
" set highlight color in vimdiff especially in molokai
hi DiffAdd                     ctermbg=17
hi DiffChange      ctermfg=181 ctermbg=239
hi DiffDelete      ctermfg=162 ctermbg=53
hi DiffText                    ctermbg=235 cterm=bold
