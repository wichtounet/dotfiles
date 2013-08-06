set backupdir=~/vimified/tmp/backup/

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

map <C-K> :pyf /home/wichtounet/dotfiles/vim/clang-format.py<CR>
imap <C-K> <ESC>:pyf /home/wichtounet/dotfiles/vim/clang-format.py<CR>i

set nofoldenable

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'

let g:indentLine_char = '│'
