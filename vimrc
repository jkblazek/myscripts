" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things
" Author: Gerhard Gappmeier
"
   set nocompatible              " be iMproved, required
   filetype off                  " required

   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')

   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'

   " The following are examples of different formats supported.
   " Keep Plugin commands between vundle#begin/end.
   " plugin on GitHub repo
   Plugin 'tpope/vim-fugitive'
   " plugin from http://vim-scripts.org/vim/scripts.html
   " Plugin 'L9'
   " Git plugin not hosted on GitHub
   Plugin 'git://git.wincent.com/command-t.git'
   " git repos on your local machine (i.e. when working on your own plugin)
   Plugin 'file:///home/gmarik/path/to/plugin'
   " The sparkup vim script is in a subdirectory of this repo called vim.
   " Pass the path to set the runtimepath properly.
   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
   " Install L9 and avoid a Naming conflict if you've already installed a
   " different version somewhere else.
   " Plugin 'ascenator/L9', {'name': 'newL9'}

   " All of your Plugins must be added before the following line
   call vundle#end()            " required
   filetype plugin indent on    " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   "
   " Brief help
   " :PluginList       - lists configured plugins
   " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
   " :PluginSearch foo - searches for foo; append `!` to refresh local cache
set nocompatible
   " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
   "
   " see :h vundle for more details or wiki for FAQ
   " Put your non-Plugin stuff after this line

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
"set font and size
set guifont=Andale\ Mono\ 12
" disable vi compatibility (emulation of old bugs)
" use indentation of previous line
" set autoindent
" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

filetype plugin on
" makefiles must use tabs
" autocmd FileType * set expandtab
" autocmd BufRead,BufNewFile [Mm]akefile set noexpandtab
" autocmd BufRead,BufNewFile *.py set noexpandtab
autocmd FileType make set noexpandtab
" autocmd FileType python set expandtab

" set textwidth to wrap at 80 characters
set textwidth=80

" turn syntax highlighting on
syntax on

set t_Co=256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" set mouse mode on
set mouse=a
" no names for clipboards

set tags+=~/.vim/systags
set tags+=~/.vim/tags

" begin highlighting red after 80 characters
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"folding settings
" set foldmethod=indent   "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use

" turn highlighting for GLSL on
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

" disable visual bell and audio bell
" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R -c++-kinds=+p -fields=+iaS -extra=+q .<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
  " spell settings
"  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
"  set spellfile=~/.vim/spellfile.add
"  map <M-Down> ]s
"  map <M-Up> [s
"endif
map <C-p> :prev<CR>
map <C-n> :n<CR>
map <C-t> :NERDTree<CR>
if bufwinnr(1)
    map + :vertical resize +10<CR>
    map _ :vertical resize -10<CR>
endif

" turn off wrapping
" set nowrap

" turn off screen flashing (it's really really annoying)
set novisualbell

set hlsearch
set backspace=indent,eol,start

"set nocp
colo nightflight  "default
autocmd! BufEnter,BufNewFile *.tex,*.rst colo manxome
autocmd! BufLeave *.html,*.vim,*.c,*.cpp,*.py,*xml colo nightflight
autocmd! 
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"helptags $HOME/.vim/doc

"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_NamespaceSearch = 1

" ruby standard 2 spaces, always
au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
" python standard 4 spaces, always
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set softtabstop=4

set fileformats=unix
set noerrorbells " don't make noise

set backup " make backup files
set clipboard+=unnamed " share windows clipboard
set backupdir=~/.vim/backup " where to put backup files
set hidden " you can change buffers without saving

filetype off

set runtimepath+=~/.vim/bundle/vundle/
" execute pathogen#infect()
call vundle#rc()

" IMPORTANT: Run the command :BundleInstall inside vim after modifying this
" list!!!
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'embear/vim-localvimrc'
Bundle 'scrooloose/nerdtree'

"set nocp
" filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
" used for opengl tags

" Using mesa's opengl include path instead
"let g:ycm_collect_identifiers_from_tags_files = 1
"set tags+=~/.vim/tags/gl

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_enable_signs=1

" <leader> is the '\' key so this is '\d'
noremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

syntax on


highlight SyntasticErrorSign guifg=red guibg=black


