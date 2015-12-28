# linewidth.vim

Nobody likes reading code with ridiculously long lines. This plugin helps you
write more readable code by highlighting lines that are too long.

Lines that are still acceptable but in danger of getting too long (longer than
72 characters by default) are highlighted as warnings, while lines that are
definitely too long (more than 79 charachters) are highlighted as errors.

The line lengths and highlighting can be customised to match your preferred
coding standard and colour scheme.

##Installation

You can use your favourite installation method. With Tim Pope's
[pathogen](https://github.com/tpope/vim-pathogen) it is simply a question of
cloning the `linewidth.vim` repository into your vim bundle directory.

```bash
    cd ~/.vim/bundle
    git clone git://github.com/heindsight/linewidth.vim
```

##Usage

Use the `:LinewidthHighlight` command to toggle highlighting of lines that are
too long. Any text between virtual column `g:linewidth_warn_width` (default:
72) and virtual column `g:linewidth_error_width` (default: 79) is highlighted
using the `LineWidthWarning` highlight group. Any text after virtual column
`g:linewidth_error_width` is highlighted using the `LineWidthError` highlight
group.

You may want to define a mapping for this command in your `~/.vimrc`. Eg:

```vim
   nmap <silent><F8> :LinewidthHighlight<CR>
```

##Customising

Use the variables g:linewidth_warn_width and g:linewidth_error_width
to set the line lengths for highlighting. For example:

```vim
    let g:linewidth_warn_width = 68
    let g:linewidth_error_width = 72
```

By default, the highlight groups LineWidthWarning and LineWidthError are
linked to the standard Todo and Error groups respectively. The highlight
command can be used to customize highlighting. For example:

```vim
    highlight LineWidthWarning ctermfg=black ctermbg=Yellow
    highlight LineWidthError ctermfg=White ctermbg=Red
```

## License

Copyright (c) 2015, Heinrich Kruger. Distributed under the MIT license (see the
LICENSE file).
