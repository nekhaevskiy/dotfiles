" Plugins
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'simeji/winresizer'
call plug#end()

" always use the system clipboard for all operations
set clipboard+=unnamedplus

" no swap file
set noswapfile

" save undo trees in files
set undofile
set undodir=$XDG_CONFIG_HOME/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

" set line number
set number
set relativenumber

" use 4 spaces instead of tab ()
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Show substitution
set inccommand=nosplit

" Mapping leader key
nnoremap <space> <nop>
let mapleader = "<space>"

" Config for chrisbra/csv.vim
augroup filetype_csv
    autocmd! 

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

