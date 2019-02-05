# tsize
tmux-like resize for vim

## install
any package manager should do.
i use [vim-plug](https://github.com/junegunn/vim-plug).

```vim
call plug#begin()
Plug 'thekelvinliu/tsize'
call plug#end()
```

## usage info
this plugin uses `g:tsize_amount` as the resize increment.
it defaults to 3.
the plugin can be invoked either via ex command or plug mapping.
the standard vim directions -- `h`, `j`, `k`, `l` -- correspond to direction of resize.

```vim
" ex commands
:TSIZEH
:TSIZEJ
:TSIZEK
:TSIZEL

" plug mappings
nmap <silent> <left> <plug>(tsize_h)
nmap <silent> <down> <plug>(tsize_j)
nmap <silent> <up> <plug>(tsize_k)
nmap <silent> <right> <plug>(tsize_l)
```

## repeat
key bindings in tmux can be repeatedly invoked without having to re-press the prefix key.
it's possible to get a similar behavior in vim without plugins too:

```vim
" recursively invoke <c-space> after resize to allow repeat
nmap <silent> <c-space>h <plug>(tsize_h)<c-space>
nmap <silent> <c-space>j <plug>(tsize_j)<c-space>
nmap <silent> <c-space>k <plug>(tsize_k)<c-space>
nmap <silent> <c-space>l <plug>(tsize_l)<c-space>
```

# about
use this if you want to resize vim windows like you do tmux panes.
inspired by [vim-arrows](https://github.com/brtjkzl/vim-arrows),
which is based on [this](https://stackoverflow.com/a/36653470) stack overflow answer.
