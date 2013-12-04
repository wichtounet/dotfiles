set backupdir=~/vimified/tmp/backup/

" Configure syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" ESC insert mode with jj
inoremap jj <ESC>

" Disable folding
set nofoldenable

" Add support for airline
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'

let g:indentLine_char = '│'

" Map easily tab change
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>

" Make fast
nnoremap mm :wa<bar>silent make<bar>redraw!<bar>cw<CR>

" Open and close quick fix window automatically
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Disable reading of .vimrc in current directory
set noexrc

" Set a timeout for keybindings
set timeout
set timeoutlen=1000
