lua <<EOF
    require('settings')
EOF

lua <<EOF
    require('keymaps')
EOF

lua <<EOF
    require('kit.packer')
EOF

lua <<EOF
    require('kit.gruvbox')
EOF

lua <<EOF
    require('kit.keymaps')
EOF
lua <<EOF
    require('kit.treesitter')
EOF
" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
"   silent !curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall
"   autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif

" call plug#begin('~/.vim/plugged')
"     "Plug 'vim-airline/vim-airline'
"     Plug 'tpope/vim-fugitive'
"     Plug 'gruvbox-community/gruvbox'
"     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"     Plug 'junegunn/fzf.vim'
"     Plug 'neoclide/coc.nvim', {'branch': 'release'}
"     Plug 'airblade/vim-rooter'
"     Plug 'ThePrimeagen/vim-be-good'
"     Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"     Plug 'dag/vim-fish'
"     Plug 'alaviss/nim.nvim'
"     Plug 'rust-lang/rust.vim'
"     Plug 'nathanaelkane/vim-indent-guides'
"     Plug 'guns/vim-sexp'
"     Plug 'tpope/vim-sexp-mappings-for-regular-people'
"     Plug 'clojure-vim/vim-jack-in'
"     Plug 'radenling/vim-dispatch-neovim'
"     Plug 'Olical/conjure', {'tag': 'v4.22.1'}
"     Plug 'cespare/vim-toml'
"     Plug 'Yggdroot/indentLine'
"     Plug 'tpope/vim-dispatch'
"     Plug 'clojure-vim/vim-jack-in'
"     " Only in Neovim:
"     Plug 'radenling/vim-dispatch-neovim'
"     Plug 'vim-test/vim-test'
"     Plug 'tpope/vim-cucumber'
"     Plug 'avanzzzi/behave.vim'
"     Plug 'nvim-lua/plenary.nvim'
"     Plug 'nvim-telescope/telescope.nvim'
"     Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"     Plug 'fannheyward/telescope-coc.nvim'
"     Plug jnumToStr/Comment.nvim'
" call plug#end()


" let g:gruvbox_contrast_dark = 'hard'
" if exists('+termguicolors')
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
"
" let g:gruvbox_invert_selection='0'
" colorscheme gruvbox
"
" set background=dark


" autocmd VimEnter *
"   \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"   \|   PlugInstall --sync | q
"   \| endif


" nnoremap <silent> <leader>gh :diffget //3<CR>
" nnoremap <silent> <leader>gu :diffget //2<CR>
" nnoremap <silent> <leader>gs :G<CR>
" nnoremap <silent> <leader>gc :G commit<CR>
" nnoremap <silent> <leader>gp :G push<CR>
" "nnoremap <silent> <C-p> :GFiles -c  -o --exclude-standard<CR>
" nnoremap <silent> <C-p> <cmd>Telescope git_files<CR>
" nnoremap <leader>; <cmd>Telescope buffers<CR>
" nnoremap <silent> /  <cmd>Telescope current_buffer_fuzzy_find<CR>
" nnoremap <silent> <leader>cc :NERDCommenterToggle<CR>
" nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" nnoremap <C-g> <cmd>Telescope live_grep<Cr>
" nnoremap <leader><C-t>f <cmd>Telescope file_browser<Cr>
" nnoremap <leader><C-t>h <cmd>Telescope help_tags<Cr>
" nnoremap <leader><C-t>q <cmd>Telescope quickfix<Cr>
" nnoremap <leader><C-t>s <cmd>Telescope spell_suggest<Cr>
" nnoremap <leader><C-t>o <cmd>Telescope vim_options<Cr>
" nnoremap <leader><C-t>g <cmd>Telescope git_bcommits<Cr>
" nnoremap <leader><C-t>r <cmd>Telescope coc references<Cr>
" nnoremap <leader><C-t>c <cmd>Telescope coc commands<Cr>
" nnoremap <leader><C-t>e <cmd>Telescope coc diagnostics<Cr>
"
" nnoremap <leader>sf z=
" nnoremap <leader>sn ]S
" nnoremap <leader>sp [S
" inoremap <C-s> <C-x>s
"
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#enabled = 1
" " let g:rustfmt_autosave = 1 
" let g:indent_guides_guide_size = 1
" let g:indentLine_enabled = 0
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_fileType = ['yaml']
"
" nnoremap <silent> t<C-n> :TestNearest<CR>
" nnoremap <silent> t<C-f> :TestFile<CR>
" nnoremap <silent> t<C-s> :TestSuite<CR>
" nnoremap <silent> t<C-l> :TestLast<CR>
" nnoremap <silent> t<C-g> :TestVisit<CR>
" let test#strategy = "dispatch"
"
" if has('nvim')
"   tnoremap <C-o> <C-\><C-n>
" endif
"
" augroup filetype_cucumber
"     autocmd!
"     autocmd BufReadPre,BufReadPost,BufRead,BufNewFile *.feature setfiletype cucumber
" augroup END
"
" augroup filetype_spell
"     autocmd!
"     autocmd FileType markdown setlocal spell spelllang=en_us
"     autocmd FileType markdown setlocal complete+=kspell
"     autocmd FileType gitcommit setlocal spell spelllang=en_us
"     autocmd FileType gitcommit setlocal complete+=kspell
" augroup END

" augroup filetype_rust
"     autocmd!
"     autocmd FileType rust nnoremap <buffer> <localleader>b :Cbuild<CR>
"     autocmd FileType rust nnoremap <buffer> <localleader>r :Crun<CR>
"     autocmd FileType rust nnoremap <buffer> <localleader>t :Ctest<CR>
"     autocmd FileType rust nnoremap <buffer> <localleader>c :Cargo check<CR>
" augroup END
"

" coc config
" let g:coc_global_extensions = [
"   \ 'coc-pairs',
"   \ 'coc-pyright', 
"   \ 'coc-yaml', 
"   \ 'coc-json', 
"   \ 'coc-vimlsp',
"   \ 'coc-yank',
"   \ 'coc-rust-analyzer',
"   \ 'coc-conjure',
"   \ 'coc-go'
"   \ ]
"
" " Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
"
"
"
" vnoremap <leader>F  <Plug>(coc-format-selected)
" nnoremap <leader>F  <Plug>(coc-format-selected)


" lua <<EOF
"     require('telescope').load_extension('coc')
" EOF


" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   highlight = {
"   enable = true,              -- false will disable the whole extension
"     disable = { "c", "rust" },  -- list of language that will be disabled
"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
" }
" EOF

" "COC Config
" autocmd FileType markdown let b:coc_pairs_disabled = ['`']
"
" " TextEdit might fail if hidden is not set.
" set hidden
"
" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup
"
" " Give more space for displaying messages.
" set cmdheight=2
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
"
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" set signcolumn=yes
"
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"             \ pumvisible() ? "\<C-n>" :
"             \ <SID>check_back_space() ? "\<TAB>" :
"             \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
"
" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
"
" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current line.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
"
" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
"
" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
"
" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" " Mappings using CoCList:
" " Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
