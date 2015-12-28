" File: linewidth.vim
" Copyright (c) 2015, Heinrich Kruger (heindsight@gmail.com)
" Distributed under the MIT license (see ../LICENSE)

if exists('g:loaded_linewidth')
    finish
endif
let g:loaded_linewidth=1

" Set defaults
if !exists('g:linewidth_warn_width')
    let g:linewidth_warn_width = 72
endif
if !exists('g:linewidth_error_width')
    let g:linewidth_error_width = 79
endif

" Check for active matches for the named group
function! s:HasMatchGroup(group_name)
    let l:matches = getmatches()
    for l:group in l:matches
        if a:group_name == l:group["group"]
            return 1
    endfor
    return 0
endfunction

" Define highlight groups
if !hlexists('LineWidthWarning')
    highlight link LineWidthWarning Todo
endif
if !hlexists('LineWidthError')
    highlight link LineWidthError Error
endif

" Toggle warnings
function! s:Toggle_line_width()
    let l:matches = getmatches()
    let l:deleted = 0
    let l:warn_pat = '\%>' . g:linewidth_warn_width . 'v.*\%<' . (g:linewidth_error_width + 1) . 'v.'
    let l:err_pat = '\%>' . g:linewidth_error_width . 'v.\+'

    for l:group in l:matches
        if l:group["group"] == "LineWidthError" || l:group["group"] == "LineWidthWarning"
            call matchdelete(l:group["id"])
            let l:deleted = 1
        endif
    endfor
    if !l:deleted
        call matchadd('LineWidthWarning', l:warn_pat, -1)
        call matchadd('LineWidthError', l:err_pat, -1)
    endif
endfunction

command! LinewidthHighlight call s:Toggle_line_width()
