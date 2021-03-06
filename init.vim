
set nocompatible
set hidden
set encoding=utf8

" Setup dein  ---------------------------------------------------------------
  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')

" Core Plugins
   call dein#add('scrooloose/nerdtree')
   "call dein#add('w0rp/ale')
   call dein#add('sheerun/vim-polyglot')
   call dein#add('Xuyuanp/nerdtree-git-plugin')
   call dein#add('tpope/vim-surround')
   call dein#add('airblade/vim-gitgutter')
   call dein#add('tpope/vim-fugitive')
   call dein#add('christoomey/vim-tmux-navigator')
   call dein#add('w0ng/vim-hybrid')
   call dein#add('mattn/emmet-vim')
   call dein#add('raimondi/delimitmate')
   call dein#add('yggdroot/indentline')
   call dein#add('majutsushi/tagbar')
   call dein#add('vim-ctrlspace/vim-ctrlspace')
   call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
   call dein#add('ryanoasis/vim-devicons')
   call dein#add('tyrannicaltoucan/vim-quantum')
   call dein#add('KeitaNakamura/neodark.vim')
   call dein#add('Zabanaa/neuromancer.vim')
   call dein#add('mhartington/oceanic-next')
   call dein#add('itchyny/lightline.vim')
   call dein#add('Townk/vim-autoclose')
   call dein#add('cohama/lexima.vim')

" Programming
   call dein#add('pangloss/vim-javascript')
   call dein#add('jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}})
   call dein#add('othree/yajs')
   call dein#add('othree/javascript-libraries-syntax.vim')
   call dein#add('mxw/vim-jsx')
   call dein#add('moll/vim-node')

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on

" Initialize Plugins
" --------------------------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" System Settings  ----------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
if (has("termguicolors"))
  set termguicolors
endif

syntax on
let mapleader = ','
set tabstop=3 shiftwidth=3 expandtab
set number
set relativenumber
set numberwidth=1
set nobackup
set noswapfile
set nowrap
set incsearch
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start

" Themes, Commands, etc  ----------------------------------------------------
set cursorline
set background=dark
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1
colorscheme neodark
let g:neodark#background = '#282c34'
let g:neodark#use_256color = 1
let g:one_allow_italics = 1
let g:quantum_black=1
let g:gitgutter_map_keys = 0
let g:indentLine_color_gui = '#666c69'
let g:indentLine_char = '┆'


" Remappings ---------------------------------------------------------------
" inoremap jk <esc>
nnoremap <leader>, <esc>
inoremap <leader>, <esc>
vnoremap <leader>, <esc>
nnoremap ; :
noremap H ^
noremap L g_
noremap J 5j
noremap K 5k
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vmap < <gv
vmap > >gv
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
nmap <leader>w :w!<cr>
nmap <leader>x :source $MYVIMRC<cr>
nmap <leader>q :q<cr>
nnoremap <silent><C-p> :CtrlSpace O<CR>
nnoremap <leader>j :bnext<cr>
nnoremap <leader>k :bprevious<cr>
" map <D-x> :!pbcopy<CR>
" vmap <D-c> :w !pbcopy<CR><CR>
vnoremap <leader>c :w !pbcopy<CR><CR>
noremap <leader>z :bd<CR><CR>


" Nerdtree ------------------------------------------------------------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>m :NERDTreeToggle<CR>

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>

autocmd VimEnter * NERDTree

" Plugin Settings ------------------------------------------------------------
"let g:user_emmet_mode='n'
"let g:user_emmet_leader_key='<Tab>'
"let g:user_emmet_expandabbr_key = '<Tab>'
au FileType html,css,scss imap <expr>kj  emmet#expandAbbrIntelligent("\<tab>")
let g:use_emmet_complete_tag = 1
nmap <leader>n :TagbarToggle<CR>
let g:airline#extensions#tabline#enabled = 1

" Vim-Devicons -------------------------------------------------------------0{{{
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_conceal_nerdtree_brackets = 1
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC<CR>

"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0
"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
