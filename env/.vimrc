"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" Highlight & Theme
NeoBundle 'pangloss/vim-javascript'
"NeoBundle 'python-syntax'

"NeoBundle 'kien/rainbow_parentheses.vim'
"	au VimEnter * RainbowParenthesesToggle

set term=xterm
set t_Co=256
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Lokaltog/vim-powerline'
	"let g:Powerline_symbols = 'fancy'
	set laststatus=2
	"set noshowmode
	"set guifont=Consolas\ for\ Powerline\ FixedD:h9

NeoBundle 'fcamel/gj'
NeoBundle 'taglist.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'easymotion/vim-easymotion'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"colorscheme yzlin256
colorscheme molokai
"colorscheme hybrid
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('/root/.snippets_custom.json')), "\n"))

"" ==================== Map keys ====================
" My leader setting
let mapleader=","
nnoremap <leader>e :tabe 
nnoremap <leader>c :tabclose<CR>
" nnoremap <leader>s :Gstatus<CR>
nnoremap <leader>b :Gblame<CR>
nnoremap <leader>a :Gblame<CR>
nnoremap <leader>l :Glog<CR>
nnoremap <leader>v :Gvdiff<CR><C-w><C-x>
nnoremap <leader>t :TlistToggle<CR>
nnoremap <leader>n :n<CR>
nnoremap <leader>N :N<CR>
"nnoremap <leader>ev :vsp $MYVIMRC<CR>
"nnoremap <leader>sv :source $MYVIMRC<CR>:echo $MYVIMRC "has been reloaded>^.^<"<CR>
"nnoremap <leader>f :Ag <cword><CR>

" I can type :help on my own, thanks.
nnoremap <F1> <Esc>
nnoremap <F2> :call HideNumber()<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
set pastetoggle=<F5>
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

"" ==================== General Settings ====================

set nocompatible    " not compatible with the old-fashion vi mode
set history=100		" keep 100 lines of command line history
set ruler			" show the cursor position all the time

syntax on			" syntax on/off/enable
filetype on			" Enable filetype detection
filetype plugin on	" Enable filetype-specific plugins

set hlsearch
set incsearch       " incremental search
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase,case-sensitive otherwise, only work when ignorecase is set

set nobackup		" no *~ backup files
"set ttymouse=xterm2	" support tmux mouse
set wildmenu
set showmode		" show mode. show filename size when open file
set bs=2			" allow backspacing over everything in insert mode
set ai				" autoindent: always set autoindenting on
set wrapscan			" return to top of file when search hit buttom
set fileformat=unix		" fileformat: EOL(end of line: unix=\n dos=\r\n) format when write
set fileformats=unix		" fileformats: input file format is unix file
set viminfo='100,<1000,s100,h		" read/write a .viminfo file,

set showcmd			" display incomplete commands
set mouse=a			" Use mouse function in normal mode
set listchars=tab:>\ 
set list
set modeline
set cursorline
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround      " align with shiftwidth
set softtabstop=4
set number
set backspace=indent,eol,start
set matchpairs+=<:>
set t_Co=256

set foldmethod=syntax
autocmd Syntax * normal zR

set encoding=utf-8
set fileencoding=utf-8          " big5/utf8/taiwan(before 6.0)
set termencoding=utf-8		" utf8/big5
"let $LANG="zh_TW.UTF-8"	" locales => zh_TW.UTF-8
if ($LANG == "zh_TW.big5")
	set fileencoding=big5
	set termencoding=big5
elseif ($LANG == "zh_TW.utf-8")
	set fileencoding=utf8
	set termencoding=utf8
endif
set fileencodings=utf-8,big5,gb2312
set tabpagemax=200

set completeopt=menu

" fix tmux backgroud issue
set t_ut=

" copy and paste between different Vim sessions
nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" cscope

" for vim tag
"====================================================
set cscopetag
" check cscope for definition of a symbol before checking ctags:
" set to 1 if you want the reverse search order.
set csto=1

" for cscope
" Add cscope.out if detect cscope.out nearest 5 parent folder
""====================================================
let $csPath="cscope.out"
for ind in range(0, 5)
	if filereadable($csPath)
		let g:CCTreeCscopeDb = $csPath
		cs add $csPath
		break
	endif
	let $csPath = "../" . $csPath
endfor

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" sex max fold = 2
set foldmethod=syntax
set foldnestmax=2

"" ==================== functions ====================

"" for f2
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc

" set highlight color in vimdiff
hi DiffAdd                     ctermbg=17
hi DiffChange      ctermfg=181 ctermbg=239
hi DiffDelete      ctermfg=162 ctermbg=53
hi DiffText                    ctermbg=235 cterm=bold

" remember last cursor location when open file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" EasyMotion
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
