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
"LSP
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <leader>sf z=
nnoremap <leader>sn ]S
nnoremap <leader>sp [S
inoremap <C-s> <C-x>s

]])
