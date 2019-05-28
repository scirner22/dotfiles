call plug#begin('~/.local/share/nvim/plugged')

" general
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" terraform
Plug 'hashivim/vim-terraform'

" javascript
Plug 'posva/vim-vue'
Plug 'isRuslan/vim-es6'

" rust
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" TODO move back to official rust.vim once this pull request is merged
" https://github.com/rust-lang/rust.vim/pull/204
"TODO add back to master branch
" rust
"Plug 'https://github.com/popravich/rust.vim.git', { 'branch': 'fix_syntastic_issue' }
"Plug 'racer-rust/vim-racer'
"Plug 'timonv/vim-cargo'

" clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/paredit.vim'
" Plug 'venantius/vim-eastwood'

" python
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim'

" development plugins
Plug 'file:///home/stevecirner/Documents/code/oxidize-clj'

call plug#end()

set t_Co=256
syntax on
filetype plugin indent on

" let g:deoplete#enable_at_startup = 1

let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/](target)$'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

map <C-d> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufReadPost *.rs setlocal filetype=rust
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()
"let g:syntastic_rust_checkers = ['cargo']
" let g:racer_cmd = "/Users/stephencirner/.cargo/bin/racer"
" let g:racer_experimental_completer = 1
" set completeopt-=preview

set updatetime=250

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

call neomake#configure#automake('nw', 750)

" clojure
let g:syntastic_clojure_checkers = ['eastwood']
let g:paredit_leader = ','
let g:clojure_foldwords = "def,defn,defmacro,defmethod,defschema,defprotocol,defrecord,ns"
let g:rainbow_active = 1

" python

" docker
:set backupcopy=yes
