" #######
" # ale #
" #######

let g:ale_disable_lsp = 1

" Plugins
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
  " color scheme
  " Plug 'cocopon/iceberg.vim'
  Plug 'joshdick/onedark.vim'

  " copilot
  Plug 'github/copilot.vim'

  " csv
  Plug 'chrisbra/csv.vim'

  " fuzzy finder
  Plug 'junegunn/fzf.vim'

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'airblade/vim-gitgutter'

  " linter
  Plug 'dense-analysis/ale'
  " Plug 'neomake/neomake'

  " lsp
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " manual pages
  Plug 'jez/vim-superman'

  " markdown
  " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  
  " navigating in open buffers
  Plug 'phaazon/hop.nvim'
  
  " register history
  Plug 'bfredl/nvim-miniyank'

  " snippets
  Plug 'honza/vim-snippets'

  " status bar
  Plug 'itchyny/lightline.vim'
  Plug 'maximbaz/lightline-ale'

  " surrounding
  Plug 'tpope/vim-surround'

  " syntax highlighting
  Plug 'mboughaba/i3config.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'wgwoods/vim-systemd-syntax'

  " text objects
  Plug 'wellle/targets.vim'

  " tree explorer
  Plug 'preservim/nerdtree'

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
  " Plug 'simeji/winresizer'
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

" Mapping
nnoremap <space> <nop>
let mapleader = "\<space>"
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>sfi :set foldmethod=indent<cr>

" #######
" # ale #
" #######
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_fixers = {
      \  'typescript': ['prettier'],
      \}
let g:ale_fix_on_save = 1

nnoremap <silent> [a <Plug>(ale_previous_wrap)
nnoremap <silent> ]a <Plug>(ale_next_wrap)

" ###########
" # copilot #
" ###########

let g:copilot_node_command = '$HOME/.nvm/versions/node/v14.19.3/bin/node'

" ############
" # coc.nvim #
" ############

" coc extensions
let g:coc_global_extensions = [
      \ 'coc-angular', 
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-tsserver',
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
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

let g:lightline = {}
let g:lightline.colorscheme = 'onedark'

let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \   'linter_checking': 'right',
      \   'linter_infos': 'right',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'right',
      \ }

let g:lightline.active = { 
      \   'right': [
      \     [ 'lineinfo' ],
	    \     [ 'percent' ],
	    \     [ 'fileformat', 'fileencoding', 'filetype'],
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \   ] 
      \ }

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

" ###########
" # neomake #
" ###########

" Neomake signs in the gutter
" let g:neomake_error_sign = {'text': '', 'texthl': 'NeomakeErrorSign'}
" let g:neomake_warning_sign = {
      " \   'text': '',
      " \   'texthl': 'NeomakeWarningSign',
      " \ }
" let g:neomake_message_sign = {
      " \   'text': '',
      " \   'texthl': 'NeomakeWarningSign',
      " \ }
" let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

" update neomake when save file
" call neomake#configure#automake('w')

" command! -bang -nargs=* -complete=file Make NeomakeProject <args>

" Enable linters
" let g:neomake_sh_enabled_makers = ['shellcheck']
" let g:neomake_vim_enabled_makers = ['vint']

" open neomake list automatically after saving a file
" let g:neomake_open_list = 2

" ############
" # nerdtree #
" ############
nnoremap <leader>tf :NERDTreeFind<cr>
nnoremap <leader>tt :NERDTreeToggle<cr>

" #########
" # netrw #
" #########

" when browsing, <cr> will open the file in the previous window
let g:netrw_browse_split = 4
" tree style listing
let g:netrw_liststyle = 3
" preview window shown in a vertically split window
let g:netrw_preview = 1

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

" #############
" # vim-mundo #
" #############

nnoremap <leader>m :MundoToggle<cr>

" ################
" # vim-polyglot #
" ################

set nocompatible
