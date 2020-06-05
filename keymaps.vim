" Rubocop
nmap <Leader>ru :RuboCop<CR>
nmap <Leader>rua :RuboCop -a <CR>

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

