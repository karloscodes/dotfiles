""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby => r
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rubocop
nmap <Leader>ru :RuboCop<CR>
nmap <Leader>rua :RuboCop -a <CR>


" Rspec

" Overwrite the g:rspec_command variable to execute a custom command
let g:rspec_command = "!bundle exec rspec {spec}"

" vim-rspec mappings
" nnoremap <leader>rt :call RunCurrentSpecFile()<cr>
" nnoremap <leader>rs :call RunNearestSpec()<cr>
" nnoremap <leader>rl :call RunLastSpec()<cr>
" nnoremap <leader>ra :call RunAllSpecs()<cr>

" vim-test mappings
nnoremap <silent> <Leader>rt :TestFile<CR>
nnoremap <silent> <Leader>rs :TestNearest<CR>
nnoremap <silent> <Leader>rl :TestLast<CR>
nnoremap <silent> <Leader>ra :TestSuite<CR>
nnoremap <silent> <Leader>rgt :TestVisit<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers => b
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>bd :bd<CR>
map <leader>bD :bd!<CR>
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

nnoremap <leader>b :Buffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs => n
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Useful mappings for managing tabs
map <leader>nn :tabnew<cr>

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


" Let 'tl' toggle between this and the last accessed tab
nmap <leader>nl :exe "tabn ".g:lasttab<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits => s
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Splits to a new window
map <leader>sh :new<cr>
map <leader>sv :vsplit<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal => t
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Maps ctrl-t t" to open a new horizontal split with a terminal
nnoremap <C-t>t :new +terminal<CR>
tnoremap <C-t>t <C-\><C-n>:new +terminal<CR>

" Maps <leader> tt to toogle full screen terminal
nnoremap <silent> <leader>tt :ToggleTerminal<Enter>
tnoremap <silent> <leader>tt <C-\><C-n>:ToggleTerminal<Enter>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Fugitive => g
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whichkey
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Save file with leader w and C-s
map <leader>w :w!<CR>
map <C-s> :w!<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <leader>w :bw<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>c :Commands<CR>
nnoremap <leader>s :Snippets<CR>
nnoremap <C-f> :Rg
nnoremap <leader>* :Rg 

noremap <leader>/ :call NERDComment(0,"toggle")<CR>
nmap <leader>nt :NERDTreeToggle<CR>

nnoremap zj o<Esc> "?
nnoremap zk O<Esc> "?
