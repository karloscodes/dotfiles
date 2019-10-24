set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ap/vim-css-color' " show colors in css
Plugin 'bronson/vim-trailing-whitespace' " show trailing whitespace
Plugin 'SirVer/ultisnips' "snippets engine
Plugin 'mileszs/ack.vim' " search code
Plugin 'tomasr/molokai' " color scheme
Plugin 'scrooloose/nerdcommenter' " toggle comment code
Plugin 'tpope/vim-endwise' " add end in ruby automatically
Plugin 'tpope/vim-eunuch' " file utils in vim
Plugin 'tpope/vim-unimpaired' " hotkeys for naviagtion [, ]
Plugin 'vim-scripts/ZoomWin' " ctrl-w o zooms current window
Plugin 'alvan/vim-closetag' " autoclose html tags, doesn't work
Plugin 'editorconfig/editorconfig-vim' " use editorconfig in vim
Plugin 'henrik/vim-indexed-search' " show search count
Plugin 'junegunn/fzf' "fzf dependency
Plugin 'junegunn/fzf.vim' " fzf file find
Plugin 'vim-scripts/AutoComplPop' " automatically show autocomplete
Plugin 'tpope/vim-fugitive' " git integration dependency for airline
Plugin 'vim-airline/vim-airline' " cool status line
Plugin 'sheerun/vim-polyglot' " support for different file types
Plugin 'terryma/vim-multiple-cursors' " multiple cursors
Plugin 'ervandew/supertab' " autocomplete with tab
" Plugin 'kien/ctrlp.vim' " file autocomplete
" Plugin 'fontzoom.vim' " zoom font
" Plugin 'honza/vim-snippets' " snippets
" Plugin 'gregsexton/MatchTag' " shows matching html tag
" Plugin 'Yggdroot/indentLine' " plugin to display nesting level, works only in gui
" Plugin 'vim-syntastic/syntastic' " syntax checking
" Plugin 'prettier/vim-prettier' " prettier
" Plugin 'ngmy/vim-rubocop' " rubocop
" Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe' " autocomplete engine
" Plugin 'ctrlpvim/ctrlp.vim' " fuzzy find files
" Plugin 'spf13/vim-autoclose' " autoclose brackets
" Plugin 'dkprice/vim-easygrep' " search and replace
" Plugin 'vim-ruby/vim-ruby' " ruby support
call vundle#end()

filetype plugin indent on
syntax on

let mapleader = ","
let g:netrw_banner = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:molokai_original=1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set autoindent
set backspace=2 " backspace working in insert mode
set completeopt=longest,menuone,preview
set encoding=utf-8
set endofline
set expandtab
set foldmethod=marker
set hlsearch
set ignorecase
set incsearch
set laststatus=2 " always display status line
set listchars=tab:»\ ,trail:.
set mouse=v
set nobackup
set nofoldenable " disable folding
set nohidden
set nospell " spell checking off
set noswapfile
set nowrap " word wrapp off
set number
set shiftwidth=2
set showcmd " show command which is being typed
set smartcase
set smartindent
set smarttab
set t_Co=256
set tabstop=2
set wildmenu
set wildmode=list:longest,full

autocmd BufWritePre * %s/\s\+$//e " remove space on save
autocmd FileType css set omnifunc=csscomplete#CompleteCSS " autocomplete css
" autocmd BufWritePre * :silent !mkdir -p %:p:h " create directory before writing

nnoremap <leader>w :bw<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>c :Commands<CR>
nnoremap <leader>s :Snippets<CR>
nnoremap <leader>g :Ag<CR>
noremap <leader>/ :call NERDComment(0,"toggle")<CR>
nnoremap zj o<Esc>
nnoremap zk O<Esc>
nnoremap <leader>k yiw:Ag <C-r>"<CR>
vnoremap <leader>k y:Ag <C-r>"<CR>

color molokai
highlight Normal ctermbg=234
highlight NonText ctermbg=234 guibg=#272822 guifg=#272822
highlight ColorColumn ctermbg=234 guibg=#252620
highlight LineNr ctermbg=234 guibg=#252620
