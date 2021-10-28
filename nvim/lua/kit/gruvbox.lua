--vim.cmd([[
--if exists('+termguicolors')
    --let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    --let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--endif

--let g:gruvbox_invert_selection='0'
--colorscheme gruvbox

--set background=dark
--]])
vim.cmd([[
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
]])
