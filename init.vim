set nocompatible
filetype off

" Specify a directory for Plugs
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'Plug'
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
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby' " ruby support
Plug 'ngmy/vim-rubocop' " rubocop
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-dispatch'
Plug 'janko/vim-test'


" Plug 'kien/ctrlp.vim' " file autocomplete
" Plug 'fontzoom.vim' " zoom font
" Plug 'honza/vim-snippets' " snippets
" Plug 'gregsexton/MatchTag' " shows matching html tag
" Plug 'Yggdroot/indentLine' " Plug to display nesting level, works only in gui
" Plug 'vim-syntastic/syntastic' " syntax checking
" Plug 'prettier/vim-prettier' " prettier
" Plug 'scrooloose/nerdtree'
" Plug 'Valloric/YouCompleteMe' " autocomplete engine
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
" Plug 'spf13/vim-autoclose' " autoclose brackets
" Plug 'dkprice/vim-easygrep' " search and replace
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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

autocmd BufWritePre * %s/\s\+$//e " remove space on save
autocmd FileType css set omnifunc=csscomplete#CompleteCSS " autocomplete css
" autocmd BufWritePre * :silent !mkdir -p %:p:h " create directory before writing

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Useful mappings for managing tabs
map <leader>to :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>

" Splits to a new window
map <leader>n :new<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

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
nnoremap <leader>rt :call RunCurrentSpecFile()<cr>
nnoremap <leader>rs :call RunNearestSpec()<cr>
nnoremap <leader>rl :call RunLastSpec()<cr>
nnoremap <leader>ra :call RunAllSpecs()<cr>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>



" color molokai
" if you don't set this option, this color might not correct
set termguicolors

colorscheme horizon

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

" or this line
let g:lightline = {'colorscheme' : 'gruvbox_material'}

highlight Normal ctermbg=234
highlight NonText ctermbg=234 guibg=#272822 guifg=#272822
highlight ColorColumn ctermbg=234 guibg=#252620
highlight LineNr ctermbg=234 guibg=#252620
