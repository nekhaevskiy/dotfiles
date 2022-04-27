" Plugins
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
  " color scheme
  " Plug 'cocopon/iceberg.vim'
  Plug 'joshdick/onedark.vim'

  " csv
  Plug 'chrisbra/csv.vim'

  " fuzzy finder
  Plug 'junegunn/fzf.vim'

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'airblade/vim-gitgutter'

  " manual pages
  Plug 'jez/vim-superman'

  " linter
  Plug 'neomake/neomake'

  " lsp
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " navigating in open buffers
  Plug 'phaazon/hop.nvim'

  " register history
  " Plug 'svermeulen/vim-yoink'
  Plug 'bfredl/nvim-miniyank'

  " snippets
  Plug 'honza/vim-snippets'

  " startup
  Plug 'mhinz/vim-startify'

  " status bar
  Plug 'itchyny/lightline.vim'

  " surrounding
  Plug 'tpope/vim-surround'

  " syntax highlighting
  Plug 'mboughaba/i3config.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'wgwoods/vim-systemd-syntax'

  " text objects
  Plug 'wellle/targets.vim'

  " tmux
  Plug 'wellle/tmux-complete.vim'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'christoomey/vim-tmux-navigator'

  " undo
  Plug 'simnalamburt/vim-mundo'

  " misc
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-repeat'
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

" use 2 spaces instead of tab ()
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Show substitution
set inccommand=nosplit

" Mapping leader key
nnoremap <space> <nop>
let mapleader = "\<space>"

" ############
" # coc.nvim #
" ############

" coc extensions
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-sh',
      \ 'coc-snippets'
      \]

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
if has('nvim-0.5.0') || has('patch-8.1.1564')
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
" if has('nvim')
  " inoremap <silent><expr> <c-space> coc#refresh()
" else
  " inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ###########
" # csv.vim #
" ###########

augroup filetype_csv
  autocmd! 
  autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
  autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" ###########
" # fzf.vim #
" ###########

nnoremap <leader>f :Files<cr>

" ############
" # hop.nvim #
" ############

lua << EOF
  require'hop'.setup()
EOF

nnoremap <leader>j :HopWord<cr>

" #################
" # lightline.vim #
" #################

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

" ###########
" # neomake #
" ###########

" Neomake signs in the gutter
let g:neomake_error_sign = {'text': '', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
      \   'text': '',
      \   'texthl': 'NeomakeWarningSign',
      \ }
let g:neomake_message_sign = {
      \   'text': '',
      \   'texthl': 'NeomakeWarningSign',
      \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

" update neomake when save file
call neomake#configure#automake('w')

command! -bang -nargs=* -complete=file Make NeomakeProject <args>

" Enable linters
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_vim_enabled_makers = ['vint']

" open neomake list automatically after saving a file
" let g:neomake_open_list = 2

" #################
" # nvim-miniyank #
" #################

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)

" ###############
" # onedark.vim #
" ###############

if (has('nvim'))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has('termguicolors'))
  set termguicolors
endif

syntax on
colorscheme onedark

" #################
" # vim-gitgutter #
" #################

set signcolumn=auto
