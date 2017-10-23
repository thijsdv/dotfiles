" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Thijs Devalckeneer's .vimrc
" Info: thijsdevalckeneer@msn.com
" ---------------------------------------------------------------------------------------
" ***************************************************************************************

filetype plugin indent on
let mapleader = ","


" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Vundle package manager
" ---------------------------------------------------------------------------------------
" ***************************************************************************************

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Fancy statusbar
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Angry plugin - to use 'a' for argument (change in argument, delete all arguments)
Plugin 'b4winckler/vim-angry'

" delimitMate
Plugin 'raimondi/delimitMate'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Robotframework Highlighting - usage : setf robot
Plugin 'git://github.com/mfukar/robotframework-vim.git'

" Undo history
Plugin 'sjl/gundo.vim'

" Navigate through the filesystems easier
Plugin 'scrooloose/nerdtree'

" Tagbar use in combination with airline
Plugin 'majutsushi/tagbar'

" Plugin to display and strip whitespaces
Plugin 'ntpeters/vim-better-whitespace'

" Numbertab at the left side will display the same
" color as airline depending on the mode
Plugin 'ntpeters/vim-airline-colornum'

" Type :A to open the corresponding header/c/cpp file
Plugin 'vim-scripts/a.vim'

" Colorscheme
Plugin 'morhetz/gruvbox'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

" Comments
Plugin 'tpope/vim-commentary'

" Easy motions
Plugin 'easymotion/vim-easymotion'

" Indentation lines
Plugin 'Yggdroot/indentLine'

" Clang format
Plugin 'rhysd/vim-clang-format'
let g:clang_format#detect_style_file = 1

call vundle#end()            " required


" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" "Normal" Vim settings
" ---------------------------------------------------------------------------------------
" ***************************************************************************************

" Search settings -----------------------------------------------------------------------
set hlsearch        "Highlight all results that match your search
set incsearch       "Highlight all results that match your search while you're typing

" Number settings -----------------------------------------------------------------------
set number          "Display line numbers on the left side
set relativenumber  "Enable relative number counting - absolute line numbers still work

" Tab settings --------------------------------------------------------------------------
set autoindent      "Copy indent from the current line when starting a new line
set expandtab       "Use spaces to insert a <Tab> - A tab can be inserted by using <C-V><Tab>
set tabstop=4       "Number of spaces that a <Tab> in the file counts for
set shiftwidth=4   "Test first if we can do without it

" Interface settings --------------------------------------------------------------------
"colorscheme moloki  "Set colorscheme - moloki is based on molokai with some minor changes
colorscheme gruvbox
set background=dark
set cursorline      "Highlight the line where the cursor is
set langmenu=none   "langmenu options sets the language used in menu's - none = English
set laststatus=2    "Show airline statusbar all the time
syntax on           "Set syntaxhighlighting on

" Misc settings -------------------------------------------------------------------------
set backspace=indent,eol,start  "Allow backspace in insert mode
set complete+=i     "Also search in included files for completion
set nocompatible    " Make Vim not Vi-compatible (behave more useful)
set omnifunc=syntaxcomplete#Complete    "Enables smart completion with <C-X> - filetype plugin on is needed for this
"When putting the line on your cursor to the end(zb)/middle(zz)/top(zt) of the
"screen, scroloff determinates the lines between the end and the selected line
set scrolloff=4
set showcmd         "Show the current command-key-combination at the rights side in the status bar
set wildmenu        "Better command-line completion
set hidden          "Be able to switch between buffer without having to save every time
set lazyredraw      "Faster macro execution
set ttyfast         "Improves smoothness of redrawing
set wildignore+=*.a,*.o,*.bmp,*.gif,*.ico,*.jpg,*.png,*.tmp,*.swp
set history=1000    "Lots of command line history

" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Plugin settings
" ---------------------------------------------------------------------------------------
" ***************************************************************************************

" Airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1            "Enable tab/buffers at the top
let g:airline#extensions#tabline#show_buffers = 1       "Show the buffers in the tab
let g:airline#extensions#tabline#buffer_nr_show = 1     "Display buffernumbers
let g:airline#extensions#tabline#fnamemod = ':t'
function! AirlineInit()
    let g:airline_section_y = airline#section#create([])        "No fileencoding and format
    let g:airline_section_warning = airline#section#create([])  "No warnings
endfunction
autocmd VimEnter * call AirlineInit()

" Gundo
set undodir=~/.vim/tmp/undo//
set undofile
set history=1000
set undolevels=1000
nnoremap <F4> :GundoToggle<CR>

" NerdTree
nnoremap <F3> :NERDTreeToggle<CR>

" TagBar
nnoremap <F5> :TagbarToggle<CR>

" Robot Framework
au BufNewFile,BufRead *.robot setlocal filetype=robot

" Easy motion
let g:EasyMotion_do_mapping = 0
map <Leader>e <Plug>(easymotion-bd-w)
nmap <Leader>e <Plug>(easymotion-overwin-w)

" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Key bindings
" ---------------------------------------------------------------------------------------
" ***************************************************************************************

" Easier window navigation --------------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing -----------------------------------------------------------------------
nnoremap <A-Up> <C-W>+
nnoremap <A-Down> <C-W>-
nnoremap <A-Right> <C-W>>
nnoremap <A-Left> <C-W><

" Unmap page up and down in insert mode -------------------------------------------------
imap <PageUp> <Nop>
imap <PageDown> <Nop>

" Unmap arrow keys ----------------------------------------------------------------------
map <Up> <Nop>
imap <Up> <Nop>
map <Down> <Nop>
imap <Down> <Nop>
map <Left> <Nop>
imap <Left> <Nop>
map <Right> <Nop>
imap <Right> <Nop>

" map Escape key
imap jk <Esc>

" Leaders
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>a :A<cr>
nmap <leader>y "+$"<cr>

" Remap : to ; -> no need to use shift every time ---------------------------------------
nnoremap ; :
nnoremap : ;

nnoremap <C-s> :w<CR>

" Navigating through tabs ---------------------------------------------------------------
nnoremap <F1> :bp<CR>
nnoremap <F2> :bn<CR>

" Stamping
nnoremap dr "_diwP

" Keywords
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\|NOTE\|INFO\|IDEA\)')
  endif
endif

" Folding
set foldmethod=syntax
set foldnestmax=1
set foldlevel=99    "Open all folds when a new file is opened
nnoremap zO zR
nnoremap zC zM

nnoremap ZZ :w<CR>

" Jumping lands on middle of screen
nnoremap n nzz
nnoremap } }zz

" Wrapping not breaking words
set linebreak

" No backups and swap files
set nobackup
set noswapfile

" Unwanted keys
nnoremap Q <Nop>

" Map caps mistakes
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" Indentation
let g:indentLine_char='|'

