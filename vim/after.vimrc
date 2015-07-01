set backupdir=~/vimified/tmp/backup/

" Configure syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++1y -stdlib=libc++'
let g:syntastic_use_quickfix_lists = 1

" Search for selection
vnoremap // y/<C-R>"<CR>

" ESC insert mode with jj
inoremap jj <ESC>

" Activate breakindent
" TODO Find a way to reactivate this
" set breakindent

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

nnoremap <Space> :w <CR>

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
nnoremap mm :wa<bar>Make<CR>
nnoremap mf :wa<bar>Make -j7<CR>
nnoremap mc :wa<bar>Make clean<CR>

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

nnoremap <Space> :w<CR>

" Tabs
set expandtab

set nobinary
set eol

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
