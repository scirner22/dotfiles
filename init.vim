call plug#begin('~/.local/share/nvim/plugged')

" general
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ycm-core/YouCompleteMe'

" colors
Plug 'EdenEast/nightfox.nvim'
Plug 'ericbn/vim-solarized'

" language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" text
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" general
" TODO remove mappings and add fzf mappings
" Plug 'kien/ctrlp.vim'

" devops
Plug 'hashivim/vim-terraform'
Plug 'towolf/vim-helm'

" kotlin
" Plug 'udalov/kotlin-vim'

" javascript
" Plug 'posva/vim-vue'
" Plug 'isRuslan/vim-es6'

" rust
"Plug 'https://github.com/popravich/rust.vim.git', { 'branch': 'fix_syntastic_issue' }
"Plug 'racer-rust/vim-racer'
"Plug 'timonv/vim-cargo'
Plug 'cespare/vim-toml', { 'branch': 'main' }

" clojure
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'guns/vim-sexp',       {'for': 'clojure'}
Plug 'liquidz/vim-iced',    {'for': 'clojure'}
" Plug 'tpope/vim-salve'
" Plug 'guns/vim-clojure-static'
" Plug 'guns/vim-clojure-highlight'
" Plug 'luochen1990/rainbow'
" Plug 'vim-scripts/paredit.vim'
" Plug 'venantius/vim-eastwood'

" python
" Plug 'davidhalter/jedi-vim'
" Plug 'vim-scripts/indentpython.vim'

call plug#end()

"
" start fzf
"

map <C-f> :Files<CR>

"
" end fzf
"

"
" start nerd tree
"

map <C-d> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" end nerd tree
"

"
" start coc config
"

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"
" end coc config
"

"
" start you complete me
"

" let g:ycm_language_server =
" \ [
" \   {
" \     'name': 'rust',
" \     'cmdline': ['rust-analyzer'],
" \     'filetypes': ['rust'],
" \     'project_root_files': ['Cargo.toml']
" \   }
" \ ]

"
" end you complete me
"

"
" start ale
"

let g:ale_linters = {'rust': ['analyzer']}

"
" end ale
"

"
" start rust
"

autocmd BufReadPost *.rs setlocal filetype=rust
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()
"let g:syntastic_rust_checkers = ['cargo']
" let g:racer_cmd = "/Users/stephencirner/.cargo/bin/racer"
" let g:racer_experimental_completer = 1
" set completeopt-=preview

"
" end rust
"

"
" start python links
"

let g:python_host_prog = '/Users/stephencirner/.pyenv/versions/2.7.18/bin/python'
let g:python3_host_prog = '/Users/stephencirner/.pyenv/versions/3.9.1/bin/python'

"
" end python links
"

"
" start terraform
"

" format on save
let g:terraform_fmt_on_save=1
" override to hashicorp style of 2 spaces for indentation level
let g:terraform_align=1

"
" end terraform
"









set t_Co=256
syntax on
filetype plugin indent on

set termguicolors
set background=dark
colorscheme solarized

" let g:deoplete#enable_at_startup = 1

" generic
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:set relativenumber
:au FocusGained * :set relativenumber
autocmd InsertLeave * :set relativenumber
:au FocusLost * :set number
autocmd InsertEnter * :set number
set hlsearch

set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

set colorcolumn=101
highlight ColorColumn ctermbg=8

" clojure
let g:syntastic_clojure_checkers = ['eastwood']
let g:paredit_leader = ','
let g:clojure_foldwords = "def,defn,defmacro,defmethod,defschema,defprotocol,defrecord,ns"
let g:rainbow_active = 1

" docker
:set backupcopy=yes
