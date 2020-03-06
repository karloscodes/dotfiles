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
Plug 'tomasr/molokai'
" Plug 'ntk148v/vim-horizon'

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

" Ruby
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby' " ruby support
Plug 'ngmy/vim-rubocop' " rubocop
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-dispatch'
Plug 'janko/vim-test'

call plug#end()

syntax on

let mapleader = ","
let g:netrw_banner = 0
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:molokai_original=1
let g:syntastic_ruby_checkers = ['rubocop']

let g:vimrubocop_keymap = 0
nmap <Leader>ru :RuboCop<CR>
nmap <Leader>rua :RuboCop -a <CR>


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
set encoding=utf-8
set endofline
set expandtab
set foldmethod=marker
set hlsearch
set ignorecase
set incsearch
set laststatus=2 " always display status line
set listchars=tab:\|\ 
set list
set mouse=v
set nobackup
set nofoldenable " disable folding
set nohidden
" set nospell " spell checking off
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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


autocmd BufWritePre * %s/\s\+$//e " remove space on save
autocmd FileType css set omnifunc=csscomplete#CompleteCSS " autocomplete css
" autocmd BufWritePre * :silent !mkdir -p %:p:h " create directory before writing

" Save file with leader w and C-s
map <leader>w :w!<CR>
map <C-s> :w!<CR>

" Buffers
map <leader>bd :bd<CR>
map <leader>bD :bd!<CR>
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tt :tabnew<cr>

" Change tabs with , + 1...9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Change tabs with ALT + 1...9
nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab9

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>


" Splits to a new window
map <leader>n :new<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" Maps ctrl-t + " to open a new horizontal split with a terminal
nnoremap <C-t>c :new +terminal<CR>
tnoremap <C-t>c <C-\><C-n>:new +terminal<CR>

nnoremap <leader>w :bw<CR>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rspec
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Overwrite the g:rspec_command variable to execute a custom command
let g:rspec_command = "!bundle exec rspec {spec}"

" vim-rspec mappings
" nnoremap <leader>rt :call RunCurrentSpecFile()<cr>
" nnoremap <leader>rs :call RunNearestSpec()<cr>
" nnoremap <leader>rl :call RunLastSpec()<cr>
" nnoremap <leader>ra :call RunAllSpecs()<cr>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Vim-Fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gbrowse<CR>
nmap <leader>ga :!git add .<CR>
nmap <leader>gc :Gcommit<CR>i
nmap <leader>gl :Glog
nmap <leader>ge :Gedit<CR>
nmap <leader>gh :Git checkout
nmap <leader>gg :Git pull<CR>a
nmap <leader>gm :Git checkout master<CR>a
nmap <leader>gwd :Git diff HEAD .<CR>

" Recommend to run it first: git config --global push.default current
nmap <leader>gp :Git push<CR>a



" color molokai
" if you don't set this option, this color might not correct
set termguicolors

colorscheme molokai

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

" or this line
let g:lightline = {'colorscheme' : 'gruvbox_material'}

highlight Normal ctermbg=234
highlight NonText ctermbg=234 guibg=#272822 guifg=#272822
highlight ColorColumn ctermbg=234 guibg=#252620
highlight LineNr ctermbg=234 guibg=#252620

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
