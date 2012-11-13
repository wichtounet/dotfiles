set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set nohlsearch
set fileencodings=utf-8

set wrap
set linebreak

" Navigate through wrapped lines
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" Navigate through visible windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Automatic saving of my files on lost focus
au FocusLost * :wa

" Display file number in the left
set number

" Alway activate spell checker
set spell spelllang=en_us

" Set the location of LanguageTool
let g:languagetool_jar=$HOME . '/.vim/languagetool/LanguageTool.jar'

" Fix the <Alt-I> command
set <m-i>=I

" Use a nicer color scheme
colorscheme wombat

" Supertab configuration
let g:SuperTabClosePreviewOnPopupClose = 1

" Activate latex plugin
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Tagbar configuration
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_usearrows = 1

" Use F8 to open tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree configuration
let NERDTreeChDirMode=2

" Leader keymappings
let mapleader = ","
nnoremap <leader>b :TagbarToggle<CR> 
nnoremap <leader>o :NERDTreeToggle<CR>

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/eddic_tags

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -f /home/wichtounet/.vim/tags/eddic_tags .

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
