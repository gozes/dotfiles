vim.cmd([[
nnoremap <silent> <leader>gh :diffget //3<CR>
nnoremap <silent> <leader>gu :diffget //2<CR>
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gc :G commit<CR>
nnoremap <silent> <leader>gp :G push<CR>
"nnoremap <silent> <C-p> :GFiles -c  -o --exclude-standard<CR>
nnoremap <silent> <C-p> <cmd>Telescope git_files theme=ivy<CR>
nnoremap <leader>; <cmd>Telescope buffers theme=ivy<CR>
nnoremap <silent> /  <cmd>Telescope current_buffer_fuzzy_find theme=ivy<CR>
nnoremap <C-g> <cmd>Telescope live_grep theme=ivy<Cr>
nnoremap <leader>f <cmd>lua require 'telescope'.extensions.file_browser.file_browser({files = false})<Cr>
nnoremap <leader>F <cmd>Telescope file_browser<Cr>
nnoremap <leader>H <cmd>Telescope help_tags<Cr>
nnoremap <leader>c <cmd>Telescope commands<Cr>
nnoremap <leader><C-t>q <cmd>Telescope quickfix<Cr>
nnoremap <leader><C-t>S <cmd>Telescope spell_suggest<Cr>
nnoremap gds <cmd>Telescope lsp_document_symbols<Cr>
nnoremap gca <cmd>Telescope lsp_code_actions<Cr>
nnoremap grca <cmd>Telescope lsp_range_code_actions<Cr>
nnoremap <leader>o <cmd>Telescope vim_options<Cr>
nnoremap <leader>q <cmd>Telescope lsp_workspace_symbols<Cr>
nnoremap <leader>g <cmd>Telescope git_bcommits<Cr>
nnoremap grr <cmd>Telescope lsp_references theme=ivy<Cr>
nnoremap <leader>e <cmd>Telescope lsp_document_diagnostics theme=ivy<Cr>
nnoremap <leader>E <cmd>Telescope lsp_workspace_diagnostics theme=ivy<Cr>

nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <M-a> :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <M-o> :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <M-e> :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <M-u> :lua require("harpoon.ui").nav_file(8)<CR>

nnoremap grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gf :lua vim.lsp.buf.formatting_sync()<CR>

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

augroup fold_au_command
    autocmd!
    "autocmd BufReadPost,FileReadPost * normal zR
    autocmd BufWrite * normal zR
augroup END

let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1


augroup filetype_go
    autocmd!
    autocmd FileType go unmap <buffer> <C-t>
    autocmd FileType godoc set ft=go

    autocmd FileType go nnoremap <buffer> ;t  :GoTest<cr>
    autocmd FileType go nnoremap <buffer> ;T  :GoTestFunc<cr>
    autocmd FileType go nnoremap <buffer> ;k  :GoAlternate!<cr>
    autocmd FileType go nnoremap <buffer> ;f  :GoIfErr<cr>
    autocmd FileType go nnoremap <buffer> ;i  :GoImpl<cr>
    autocmd FileType go nnoremap <buffer> ;et :GoDebugTest<cr>
    autocmd FileType go nnoremap <buffer> ;eT :GoDebugTestFunc<cr>
    autocmd FileType go nnoremap <buffer> ;eb :GoDebugBreakpoint<cr>
    autocmd FileType go nnoremap <buffer> ;eN :GoDebugStep<cr>
    autocmd FileType go nnoremap <buffer> ;es :GoDebugStart<cr>
    autocmd FileType go nnoremap <buffer> ;ek :GoDebugStop<cr>
    autocmd FileType go nnoremap <buffer> ;en :GoDebugNext<cr>
    autocmd FileType go nnoremap <buffer> ;ep :GoDebugPrint
    autocmd FileType go nnoremap <buffer> ;eo :GoDebugStepOut<cr>
    autocmd FileType go nnoremap <buffer> ;er :GoDebugRestart<cr>
    autocmd FileType go nnoremap <buffer> ;rn :GoRename<cr>
    autocmd FileType go command! -nargs=* -range -complete=customlist,go#package#Complete GoDocv call go#doc#Open('vnew', 'vsplit', <f-args>)
    autocmd FileType go nnoremap <buffer> ;d :GoDocv<cr>
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

require('gitsigns').setup()
vim.cmd([[
nnoremap <leader>hn <cmd>Gitsigns next_hunk<Cr>
nnoremap <leader>hp <cmd>Gitsigns prev_hunk<Cr>
nnoremap <leader>hP <cmd>Gitsigns preview_hunk<Cr>
nnoremap <leader>hS <cmd>Gitsigns stage_hunk<Cr>
nnoremap <leader>hR <cmd>Gitsigns reset_hunk<Cr>
nnoremap <leader>hs <cmd>Gitsigns stage_buffer<Cr>
nnoremap <leader>hr <cmd>Gitsigns reset_buffer<Cr>
]])
