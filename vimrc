execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

map <C-d> :NERDTreeToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:set relativenumber
:au FocusGained * :set relativenumber
autocmd InsertLeave * :set relativenumber
:au FocusLost * :set number
autocmd InsertEnter * :set number

set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

let g:paredit_leader = ','

let g:ctrlp_custom_ignore = '\v[\/](target)$'

" eclim integration
set nocompatible

" general config
set hlsearch

" aliases
cnoreabbrev ssi SortScalaImports

" show wrap line
set colorcolumn=100
highlight ColorColumn ctermbg=8

" ensime config
