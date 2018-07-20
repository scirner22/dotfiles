call plug#begin('~/.local/share/nvim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'flazz/vim-colorschemes'

" TODO move back to official rust.vim once this pull request is merged
" https://github.com/rust-lang/rust.vim/pull/204
Plug 'https://github.com/popravich/rust.vim.git', { 'branch': 'fix_syntastic_issue' }
Plug 'racer-rust/vim-racer'
Plug 'timonv/vim-cargo'

Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'

Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'derekwyatt/vim-scala'

call plug#end()

set t_Co=256
syntax on
colorscheme molokai
filetype plugin indent on

let g:python_host_prog='/usr/local/bin/python3'
let g:python3_host_prog='/usr/local/bin/python3'
let g:loaded_python_provider=1

let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
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

let g:syntastic_rust_checkers = ['cargo']

set hidden
let g:racer_cmd = "/Users/stephencirner/.cargo/bin/racer"
let g:racer_experimental_completer = 1
set completeopt-=preview

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

let g:paredit_leader = ','

set colorcolumn=101
highlight ColorColumn ctermbg=8

autocmd BufWritePost *.scala silent :EnTypeCheck
au FileType scala nnoremap <localleader>t :EnType<CR>
au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
