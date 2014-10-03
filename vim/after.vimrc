set backupdir=~/vimified/tmp/backup/

" Configure syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" ESC insert mode with jj
inoremap jj <ESC>

" Activate mode lines
set nocompatible
filetype plugin on
set modeline
set modelines=5

" Disable folding
set nofoldenable
let g:riv_disable_folding = 1
let g:riv_fold_auto_update = 0

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

" Should improve quickfix, but does not seems to work as expected
set switchbuf=
nnoremap mc :cclose<CR>:q<CR>

" Ease the use fugitive
nnoremap ss :Gstatus<CR>

" Improve navigation between windows
noremap rj <C-w>j
noremap rk <C-w>k
noremap rh <C-w>h
noremap rl <C-w>l
noremap rc <C-w>c
noremap rs <C-w>s
noremap ro <C-w>o
noremap r<SPACE> :split<CR>
noremap r<CR> :vsplit<CR>
noremap r <C-w>

" Make fast
nnoremap mm :wa<bar>silent make<bar>redraw!<bar>cw<CR>
nnoremap mf :wa<bar>silent make<bar>redraw!
nnoremap mc :wa<bar>silent make clean<bar>redraw!<bar>cw<CR>

" Improve navigation in quick fix window
nnoremap cn :cnext<CR>
nnoremap cp :cprevious<CR>
nnoremap cc :cclose<CR>

nnoremap M :next<CR>
nnoremap P :previous<CR>

" Open and close quick fix window automatically
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Disable reading of .vimrc in current directory
set noexrc

" Set a timeout for keybindings
set timeout
set timeoutlen=750

" Arrow keys are evil :)
nnoremap <Left> :echoe "Use h, you moron..."<CR>
nnoremap <Right> :echoe "Use l, you moron..."<CR>
nnoremap <Up> :echoe "Use k, you moron..."<CR>
nnoremap <Down> :echoe "Use j, you moron..."<CR>

" Tabs
set expandtab

" ctrlp {

let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(cpp\.o|cpp\.d|aux|bbg|bbl)$'
    \}

let g:ctrlp_user_command = {
    \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
    \ }

"}
