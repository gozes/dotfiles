
" go
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
    autocmd FileType go nnoremap <buffer> <localleader>R  <Plug>(go-rename)
    autocmd FileType go nnoremap <buffer> <localleader>t  <Plug>(go-test)
    autocmd FileType go nnoremap <buffer> <localleader>T  <Plug>(go-test-func)
    autocmd FileType go nnoremap <buffer> <localleader>b  <Plug>(go-build)
    autocmd FileType go nnoremap <buffer> <localleader>i <Plug>(go-info)
    autocmd FileType go nnoremap <buffer> <localleader>d <Plug>(go-doc-vertical)
    autocmd FileType go nnoremap <buffer> <localleader>D <Plug>(go-doc-browser)
augroup END
