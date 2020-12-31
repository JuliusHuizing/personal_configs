"Inspired by: {{{
" https://dougblack.io/words/a-good-vimrc.html
"}}}

set nocompatible              " required
filetype off                  " required
filetype indent on      " load filetype-specific indent files
" Allow for Pathogen plugins
execute pathogen#infect()
" Defines leader key
let mapleader=","       " leader is comma
"set line numbers
set number
"Yanking (copying) will move content to MacOS clipboard as well.
set clipboard=unnamed

" colors & layout {{{
" NB. Ensure that the terminal you are working in is also set to solarized
set background=dark
colorscheme solarized
syntax enable 
set cursorline
set showcmd
" Enables autocomplete functionality within Vim (e.g. autocomplete :! ls
set wildmenu 
" }}}

" Tabs {{{
set tabstop=4
set softtabstop=4
set expandtab       " tabs are space
" Enable backspace to delete auto-generated indents as well.
set backspace=indent,eol,start
"}}}

"searching {{{
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
"}}}

"language settings {{{
"Set default language to English.
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"}}}

"Buffer behavior {{{
" set behavior for splitting buffers.
set splitbelow
set splitright
"}}}

" Key Remappings {{{
" moving between buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap <d-E> <d-$>
nnoremap <d-B> <d-^>
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" save session (re-open current arrangment of windows by flaggin vim with -S
nnoremap <leader>s :mksession<CR>

""fold /unfold with spacebar
"fold /unfold with spacebar
nnoremap <space> za
"}}}

" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent
"}}}

"" Python-specific {{{
"python with virtualenv support
py3 3
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

set encoding=utf-8

au BufNewFile,BufRead *.py 
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"}}}

"" set the runtime path to include Vundle and initialize 
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
"" alternatively, pass a path where Vundle should install plugins
:"call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
"" add all your plugins here (note older versions of Vundle
"" used Bundle instead of Plugin)
"
"" Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-syntastic/syntastic'
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required

"Making section layout possible (needs to be bottom of file (modelines))
set modelines=2
set foldmethod=marker
set foldlevel=0
