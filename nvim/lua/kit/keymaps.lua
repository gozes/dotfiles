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
nnoremap <silent> <leader>cc :NERDCommenterToggle<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <C-g> <cmd>Telescope live_grep<Cr>
nnoremap <leader><C-t>f <cmd>Telescope file_browser<Cr>
nnoremap <leader><C-t>h <cmd>Telescope help_tags<Cr>
nnoremap <leader><C-t>q <cmd>Telescope quickfix<Cr>
nnoremap <leader><C-t>s <cmd>Telescope spell_suggest<Cr>
nnoremap <leader><C-t>o <cmd>Telescope vim_options<Cr>
nnoremap <leader><C-t>g <cmd>Telescope git_bcommits<Cr>
nnoremap <leader><C-t>r <cmd>Telescope coc references<Cr>
nnoremap <leader><C-t>c <cmd>Telescope coc commands<Cr>
nnoremap <leader><C-t>e <cmd>Telescope coc diagnostics<Cr>

nnoremap <leader>sf z=
nnoremap <leader>sn ]S
nnoremap <leader>sp [S
inoremap <C-s> <C-x>s

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox_material'
" let g:rustfmt_autosave = 1 
let g:indent_guides_guide_size = 1
let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileType = ['yaml']

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
