set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
" stdpath('config') . '/init.vim'

" show colors in css
Plug 'ap/vim-css-color' 
" show trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
"snippets engine 
Plug 'SirVer/ultisnips'
" search code
Plug 'mileszs/ack.vim'
" color scheme
" Plug 'tomasr/molokai'
" Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'

Plug 'scrooloose/nerdcommenter' " toggle comment code
Plug 'tpope/vim-endwise' " add end in ruby automatically
Plug 'tpope/vim-eunuch' " file utils in vim
Plug 'tpope/vim-unimpaired' " hotkeys for naviagtion [, ]
Plug 'vim-scripts/ZoomWin' " ctrl-w o zooms current window
Plug 'alvan/vim-closetag' " autoclose html tags, doesn't work
Plug 'editorconfig/editorconfig-vim' " use editorconfig in vim
Plug 'henrik/vim-indexed-search' " show search count
Plug 'junegunn/fzf' "fzf dependency
Plug 'junegunn/fzf.vim' " fzf file find
Plug 'vim-scripts/AutoComplPop' " automatically show autocomplete
Plug 'tpope/vim-fugitive' " git integration dependency for airline
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'vim-airline/vim-airline' " cool status line
Plug 'sheerun/vim-polyglot' " support for different file types
Plug 'terryma/vim-multiple-cursors' " multiple cursors
Plug 'ervandew/supertab' " autocomplete with tab
Plug 'ryanoasis/vim-devicons'
Plug 'xianzhon/vim-code-runner'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'caenrique/nvim-toggle-terminal'

" Ruby
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby' " ruby support
Plug 'ngmy/vim-rubocop' " rubocop
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-dispatch'
Plug 'janko/vim-test'

" Plug 'liuchengxu/vim-which-key'
Plug 'ryanoasis/vim-devicons'

call plug#end()

syntax on

let mapleader = " "
" let maplocalleader = " "

let g:netrw_banner = 0
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:molokai_original=1
let g:syntastic_ruby_checkers = ['rubocop']

let g:vimrubocop_keymap = 0


if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Show matching brackets when text indicator is over them
set showmatch

set autoindent
set backspace=2 " backspace working in insert mode
set completeopt=longest,menuone,preview
set encoding=UTF-8
set endofline
set expandtab
set foldmethod=marker
set hlsearch
set ignorecase
set incsearch
set smartcase
set laststatus=2 " always display status line
set listchars=tab:\|\ 
set list
set mouse=a
set nobackup
set nofoldenable " disable folding
set nohidden
" set nospell " spell checking off
set noswapfile
set nowrap " word wrapp off
set number
set numberwidth=1
set relativenumber
set shiftwidth=2
set showcmd " show command which is being typed
set smartcase
set smartindent
set smarttab
set t_Co=256
set tabstop=2
set wildmenu
set wildmode=list:longest,full
" set timeoutlen=1000
set clipboard=unnamed
set ruler
set termguicolors
set cursorline

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


autocmd BufWritePre * %s/\s\+$//e " remove space on save
autocmd FileType css set omnifunc=csscomplete#CompleteCSS " autocomplete css
" autocmd BufWritePre * :silent !mkdir -p %:p:h " create directory before writing

source $HOME/.config/nvim/keymaps.vim


let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()

" Theme related
	colorscheme horizon


" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "hard"


" lightline
" let g:lightline = {}
" let g:lightline.colorscheme = 'gruvbox_material'
let g:lightline = {}
let g:lightline.colorscheme = 'horizon'

highlight Normal ctermbg=234
highlight NonText ctermbg=234 guibg=#272822 guifg=#272822
highlight ColorColumn ctermbg=234 guibg=#252620
highlight LineNr ctermbg=234 guibg=#252620
highlight Pmenu ctermbg=234 guibg=234

" Airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
