vim.cmd([[
nnoremap <silent> <leader>gh :diffget //3<CR>
nnoremap <silent> <leader>gu :diffget //2<CR>
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gc :G commit<CR>
nnoremap <silent> <leader>gp :G push<CR>
"nnoremap <silent> <C-p> :GFiles -c  -o --exclude-standard<CR>
nnoremap <silent> <C-p> <cmd>Telescope git_files<CR>
nnoremap <leader>; <cmd>Telescope buffers<CR>
nnoremap <silent> /  <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <C-g> <cmd>Telescope live_grep<Cr>
nnoremap <leader>f <cmd>lua require 'telescope'.extensions.file_browser.file_browser({files = false})<Cr>
nnoremap <leader>F <cmd>Telescope file_browser<Cr>
nnoremap <leader>h <cmd>Telescope help_tags<Cr>
nnoremap <leader>c <cmd>Telescope commands<Cr>
nnoremap <leader><C-t>q <cmd>Telescope quickfix<Cr>
nnoremap <leader><C-t>S <cmd>Telescope spell_suggest<Cr>
nnoremap gds <cmd>Telescope lsp_document_symbols<Cr>
nnoremap gca <cmd>Telescope lsp_code_actions<Cr>
nnoremap grca <cmd>Telescope lsp_range_code_actions<Cr>
nnoremap <leader>o <cmd>Telescope vim_options<Cr>
nnoremap <leader>q <cmd>Telescope lsp_workspace_symbols<Cr>
nnoremap <leader>g <cmd>Telescope git_bcommits<Cr>
nnoremap grr <cmd>Telescope lsp_references<Cr>
nnoremap <leader>e <cmd>Telescope lsp_document_diagnostics<Cr>
nnoremap <leader>E <cmd>Telescope lsp_workspace_diagnostics<Cr>

nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <M-h> :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <M-t> :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <M-n> :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <M-s> :lua require("harpoon.ui").nav_file(8)<CR>

nnoremap grn :lua vim.lsp.buf.rename()<CR>

" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'gruvbox_material'
" let g:rustfmt_autosave = 1 
" let g:indent_guides_guide_size = 1
" let g:indentLine_enabled = 0
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_fileType = ['yaml']
let g:indent_blankline_enabled = v:false

nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "dispatch"

if has('nvim')
  tnoremap <C-o> <C-\><C-n>
endif

augroup filetype_cucumber
    autocmd!
    autocmd BufReadPre,BufReadPost,BufRead,BufNewFile *.feature setfiletype cucumber
augroup END

augroup filetype_spell
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_us
    autocmd FileType markdown setlocal complete+=kspell
    autocmd FileType gitcommit setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal complete+=kspell
augroup END
]])

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>|", "<C-^>",{noremap = true})
vim.api.nvim_set_keymap("n", "&", "^",{noremap = true})
vim.api.nvim_set_keymap("n", "@", "g_",{noremap = true})
vim.api.nvim_set_keymap("n", "!", "g_",{noremap = true})
vim.api.nvim_set_keymap("n", "<leader>^", "<C-^>",{noremap = true})

vim.api.nvim_set_keymap("v", "<leader>|", "<C-^>",{noremap = true})
vim.api.nvim_set_keymap("v", "&", "^",{noremap = true})
vim.api.nvim_set_keymap("v", "@", "g_",{noremap = true})
vim.api.nvim_set_keymap("v", "!", "g_",{noremap = true})
vim.api.nvim_set_keymap("v", "<leader>^", "<C-^>",{noremap = true})
