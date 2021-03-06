filetype plugin on
syntax on
" set leader key
let mapleader = "\<Space>"
let maplocalleader = ","
set guicursor=
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set clipboard=unnamedplus
" Undo function after reopening
set undofile
set undodir=/tmp
let g:netrw_home='~/.vim'
set relativenumber
set scrolloff=10
set noshowmode

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_altv = 1

inoremap <F1> <Esc>
inoremap <C-c> <Esc>
nnoremap <C-c> :w<CR>

nnoremap <silent> to :enew<CR>
nnoremap <silent> tc :bp <BAR> bd #<CR>

" Split window
nnoremap <silent> <leader>ws :split<Return><C-w>w
nnoremap <silent> <leader>wv :vsplit<Return><C-w>w
" Move window
nnoremap <leader>wh <C-w>h
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
nnoremap <leader>wl <C-w>l
nnoremap <leader>wc <C-w>c
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
tnoremap <C-\> <C-\><C-n>

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo  ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
    Plug 'gruvbox-community/gruvbox'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'airblade/vim-rooter'
    Plug 'preservim/nerdcommenter'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'dag/vim-fish'
    Plug 'alaviss/nim.nvim'
    Plug 'rust-lang/rust.vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'guns/vim-sexp'
    Plug 'tpope/vim-sexp-mappings-for-regular-people'
    Plug 'clojure-vim/vim-jack-in'
    Plug 'radenling/vim-dispatch-neovim'
    Plug 'Olical/conjure', {'tag': 'v4.19.0'}
    Plug 'cespare/vim-toml'
    Plug 'Yggdroot/indentLine'


call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection='0'
colorscheme gruvbox

set background=dark


autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


nnoremap <silent> <leader>gh :diffget //3<CR>
nnoremap <silent> <leader>gu :diffget //2<CR>
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <C-p> :GFiles -c  -o --exclude-standard<CR>
nnoremap <leader>; :Buffers<CR>
nnoremap <silent> /  :BLines<CR>
nnoremap <silent> <leader>cc :NERDCommenterToggle<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <C-g> :Rg<Cr>
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:rustfmt_autosave = 1 
let g:indent_guides_guide_size = 1
let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileType = ['yaml']


augroup filetype_rust
    autocmd!
    autocmd FileType rust nnoremap <buffer> <localleader>b :Cbuild<CR>
    autocmd FileType rust nnoremap <buffer> <localleader>r :Crun<CR>
    autocmd FileType rust nnoremap <buffer> <localleader>t :Ctest<CR>
    autocmd FileType rust nnoremap <buffer> <localleader>c :Cargo check<CR>
augroup END


" coc config
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-pyright', 
  \ 'coc-yaml', 
  \ 'coc-json', 
  \ 'coc-vimlsp',
  \ 'coc-yank',
  \ 'coc-rust-analyzer',
  \ 'coc-conjure',
  \ 'coc-go'
  \ ]

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



vnoremap <leader>F  <Plug>(coc-format-selected)
nnoremap <leader>F  <Plug>(coc-format-selected)

"COC Config
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
