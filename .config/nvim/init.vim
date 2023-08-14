" vimrc
" Author: Baptiste Wicht

" Configure encoding
set encoding=utf-8
set termencoding=utf-8

" Good compatibility with zsh
if executable('zsh')
  set shell=zsh\ -l
endif

" Don't bother drawing the screen while executing macros or other automated or
" scripted processes, just draw the screen as it is when the operation
" completes
set lazyredraw

" Auto write
set autowrite

" Reload files if changed from shell command
set autoread

" Beeps are outdated...
set visualbell

" Activate mode lines
filetype plugin on
set modeline
set modelines=5

" Display relative number
if exists('+relativenumber')
  set relativenumber
endif

" Enable persistent undo
if has('persistent_undo')
    set undolevels=5000
    set undoreload=10000
    set undofile
    set undodir=$HOME/.neovim/tmp/undo
endif

" More memory for commands
set history=1000

" Disable reading of .vimrc in current directory
set noexrc
set secure

" Rotate swap files more often
set updatecount=100

" Practical settings
set nobinary
set eol

" Set a timeout for keybindings
set timeout
set timeoutlen=750

" Use space as mapleader
let mapleader = "\<Space>"

" Configure Python
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 0

""""""""""
" Plugin "
""""""""""

call plug#begin()

" fzf for fuzzy search (like ctrlp but better)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Molokai color theme
Plug 'tomasr/molokai'

" Airline and the necessary icons
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" LSP
Plug 'neovim/nvim-lspconfig'

" Status from LSP
Plug 'nvim-lua/lsp-status.nvim'
Plug 'SmiteshP/nvim-navic'

" Autocompletions with LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" NerdCommenter
Plug 'preservim/nerdcommenter'

" Alignment
Plug 'junegunn/vim-easy-align'

" Linter
Plug 'dense-analysis/ale'

" Better syntax highlighting for C++
Plug 'bfrg/vim-cpp-modern'

" Better syntax highlighting for ansible
Plug 'pearofducks/ansible-vim'

call plug#end()

""""""""
" Misc "
""""""""

" Configure backups
set backupdir=$HOME/.neovim/tmp/backup

" Configure swap
set directory=$HOME/.neovim/tmp/swap
set backup
set noswapfile

" Configure the dictionary
set dictionary=/usr/share/dict/words

" Enable spelling on text files
au BufEnter *.tex set spell
au BufEnter *.rst set spell
au BufEnter *.md set spell
au BufEnter *.txt set spell

"""""""""""
" Display "
"""""""""""

syntax on

" Use the molokai theme
if filereadable(globpath(&rtp, 'colors/molokai.vim'))
   colorscheme molokai
endif

" Use more colors
set termguicolors

" Display the current command in the bottom line
set showcmd

" Always display the ruler
set ruler

" Enable the wild menu for better command completion
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

" Show parenths matchings
set showmatch
set matchtime=2

" Minimal number of columns for the line number
set numberwidth=3

" Minimal width of a window in case of several windows
set winwidth=83

" Option for completion
set completeopt=menu,menuone,noselect

" Disable folding in riv.vim
set nofoldenable

" Open and close quick fix window automatically
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Make sure to close the completion window
autocmd CompleteDone * pclose

"""""""""
" White "
"""""""""

set autoindent
set tabstop=4
set softtabstop=4
set textwidth=120
set shiftwidth=4
set expandtab
set wrap
set formatoptions=qrn1
if exists('+colorcolumn')
  set colorcolumn=+1
endif
set cpo+=J

set backspace=indent,eol,start
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set encoding=utf-8
set hidden
set laststatus=2
set list

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:␣
    au InsertLeave * :set listchars+=trail:␣
augroup END

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Remove trailing whitespaces when saving
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


""""""""""
" Search "
""""""""""

" Incremental search
set incsearch

" Search for selection
vnoremap // y/<C-R>"<CR>

" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch

" Don't jump when using * for search
"nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Fast map for Ag
nnoremap <leader>a :Ag <space>

command! -bang -nargs=* FAg
  \ call fzf#vim#ag(<q-args>,
  \                 '--ignore-dir "source/resolution/dpdk"',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

command! -bang -nargs=* WAg
  \ call fzf#vim#ag(<q-args>,
  \                 '-w --ignore-dir "source/resolution/dpdk"',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)




" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" Set 5 lines to the cursor - when moving vertically
set scrolloff=0

" Reload files
au FocusGained,BufEnter * :checktime

""""""""""""""
" Navigation "
""""""""""""""

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Improve navigation between windows
noremap <leader>rj <C-w>j
noremap <leader>rk <C-w>k
noremap <leader>rh <C-w>h
noremap <leader>rl <C-w>l
noremap <leader>rc <C-w>c
noremap <leader>rs <C-w>s
noremap <leader>ro <C-w>o
noremap <leader>r<SPACE> :split<CR>
noremap <leader>r<CR> :vsplit<CR>
noremap <leader>r <C-w>

" Improve navigation in quick fix window
nnoremap cn :cnext<CR>
nnoremap cp :cprevious<CR>
nnoremap cc :cclose<CR>

" Map easily tab change
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>

" Arrow keys are evil :)
nnoremap <Left> :echoe "Use h, you moron..."<CR>
nnoremap <Right> :echoe "Use l, you moron..."<CR>
nnoremap <Up> :echoe "Use k, you moron..."<CR>
nnoremap <Down> :echoe "Use j, you moron..."<CR>

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Hightlight the current line
set cursorline

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

" Should improve quickfix, but does not seems to work as expected
set switchbuf=useopen
nnoremap mc :cclose<CR>:q<CR>

"""""""
" ALE "
"""""""

let g:ale_cpp_clangd_executable = "clangd-16"
let g:ale_cpp_cc_executable = "clang++-16"
let g:ale_cpp_clangcheck_executable = "clang-check-16"
let g:ale_cpp_clangtidy_executable = "clang-tidy-16"

"""""""
" LSP "
"""""""

lua << END
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lspconfig = require('lspconfig')
local navic = require("nvim-navic")

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

-- Some arbitrary servers
navic.setup()
lspconfig.clangd.setup {
    cmd = { "clangd-16" },
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)

        --- Define some shortcuts for c++
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', '<Leader>n', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, bufopts)

        -- TODO Tweak these shortcuts

        -- Display hover information about the symbol under the cursor
        vim.keymap.set('n', '<Leader>K', vim.lsp.buf.hover, bufopts)

        -- Jump to the definition
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufpts)

        -- Jump to declaration
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufpts)

        -- Lists all the implementations for the symbol under the cursor
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufpts)

        -- Jumps to the definition of the type symbol
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufpts)

        -- Lists all the references 
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufpts)

        -- Displays a function's signature information
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufpts)

        -- Renames all references to the symbol under the cursor
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufpts)

        -- Selects a code action available at the current cursor position
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, bufpts)
        vim.keymap.set('x', '<F4>', vim.lsp.buf.range_code_action, bufpts)

        -- Show diagnostics in a floating window
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufpts)

        -- Move to the previous diagnostic
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufpts)

        -- Move to the next diagnostic
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufpts)
    end
}

--- Start lualine
local lualine = require('lualine')
lualine.setup({
    options = {theme = 'molokai'},
    sections = { 
        lualine_c = { 
            {
            function() 
                return navic.get_location()
            end,
            cond = function() 
                return navic.is_available()
            end
            },
        }
    }
})

--- Setup the snippets
require('luasnip.loaders.from_vscode').lazy_load()

--- Setup autocompletion
local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    --- Tell cmp how to expand snippets
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    --- Tell cmp where to find sources for autocompletion
    sources = {
      {name = 'path'},
      {name = 'nvim_lsp', keyword_length = 1},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
    },
    --- Set the style of the documentation window
    window = {
      documentation = cmp.config.window.bordered()
    },
    -- How are items displayed
    formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
        local menu_icon = {
          nvim_lsp = 'λ',
          luasnip = '⋗',
          buffer = 'Ω',
          path = '🖫',
        }

        item.menu = menu_icon[entry.source.name]
        return item
      end,
    },
    --- Mappings for this function
    mapping = {
        --- TODO tune the mappings
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        ['<C-f>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, {'i', 's'}),

        ['<C-b>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {'i', 's'}),

        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item(select_opts)
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
        end, {'i', 's'}),
    }
})

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

END

""""""""""""
" Mappings "
""""""""""""

" ESC insert mode with jj
inoremap jj <ESC>

" ESC visual mode with J
" vnoremap J <ESC>

" Ideally, we wan't both, but they have no distinguishable keystroke
"nnoremap <C-O> O<Esc>j
nnoremap <C-o> o<Esc>k

" let g:fzf_history_dir = '~/.local/share/fzf-history'

" Make fzf behave like ctrlp
nnoremap <C-p> :Files<CR>

" Better user of Leader
nnoremap <Leader>w :w <CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>j :set nofoldenable<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Space> :

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <Leader>v <C-w>v<C-w>l
nnoremap <Leader>h <C-w>s<C-w>j

" Yank from current cursor position to end of line
map Y y$

"  Use clang-format to format the file or the selection
nnoremap <Leader>r :py3f /usr/lib/clang-format.py<CR>
vnoremap <Leader>r :py3f /usr/lib/clang-format.py<CR>

" Ease the use fugitive
nnoremap ss :Gstatus<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Navigate between ALE errors
nmap <silent> <C-e> <Plug>(ale_next_wrap)
