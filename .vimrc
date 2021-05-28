" Basic config
set nocompatible
set autoread
set statusline=%F%r\ [HEX=%B][%l,%v,%P]\ %{strftime(\"%H:%M\")}
filetype plugin indent on

" Visual
colorscheme slate
set number
set visualbell
syntax enable
set showmatch
set showmode

" Spaces & Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4
set ai
set cindent
set wrap

" Search
set hlsearch
set incsearch

" Other
autocmd InsertLeave * se nocul
set fillchars=vert:/
set fillchars=stl:/
set fillchars=stlnc:/
