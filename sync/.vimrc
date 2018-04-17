let mapleader=" " 

" NERD tree plugin
map <C-n> :NERDTreeToggle<CR>

" FZF search
nnoremap <leader>f :Ag .<ENTER>
nnoremap <leader>t :FZF .<ENTER>

" Set tags file location
set tags=./tags,tags;$HOME

" Color scheme
set background=light
colorscheme solarized
syntax enable           

nnoremap <leader><space> :noh<CR>    " Clear search highlights

" Italic Font
" note: this has to come after the color scheme stuff is loaded
" see: https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
set t_ZH=[3m
set t_ZR=[23m
highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight Type    cterm=italic

" Copy and past to system clipboard
set clipboard=unnamed

" Backspace behavior
set backspace=indent,eol,start

" Tab default setings. modify per filetype in ~/.vim/indent/<filetype>.vim
set textwidth=120   " break lines when line length increases
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for auto indent
set expandtab       " tabs are spaces
set autoindent

" UI config
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
filetype plugin indent on      " load filetype-specific indent from plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>sz :source ~/.zshrc<CR>
