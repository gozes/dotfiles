vim.cmd([[
inoremap <F1> <Esc>
inoremap <C-c> <Esc>
nnoremap <C-c> :w<CR>

nnoremap <M-t> :tabnew <bar> term<cr>
nnoremap <M-c> :tabclose<cr>
nnoremap <M-p> :tabprevious<cr>
nnoremap <M-n> :tabnext<cr>
nnoremap <M-o> :tabnew<cr>
" Split window
nnoremap <silent> <leader>ws :split<Return><C-w>w
nnoremap <silent> <leader>wv :vsplit<Return><C-w>w
" Move window
nnoremap <leader>wh <C-w>h
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
nnoremap <leader>wl <C-w>l
nnoremap <leader>wc :bd<CR>
nnoremap <leader>wo <C-w>o
nnoremap <leader>w= <C-w>=
nnoremap <leader>w+ 30<C-w>+
nnoremap <leader>w- 10<C-w>-
nnoremap <leader>w< 10<C-w><
nnoremap <leader>w> 30<C-w>>
nnoremap <leader>wf :Vex<CR>
" Switch tab
nnoremap <silent> <leader><C-n> :bnext<CR>
nnoremap <silent> <leader><C-p> :bprevious<CR>
]])
