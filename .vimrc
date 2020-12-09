let mapleader = " "
nnoremap <leader>s :w<cr>
set encoding=UTF-8
"Good shit... just put it in
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" set smartindent
set autoindent

set nocompatible
set clipboard=unnamedplus
"enable unsaved buffers(hidden buffers)
set hidden
"disable annoying sound notifications
set noerrorbells visualbell t_vb=

set hlsearch
set ignorecase
set mouse=nva
set incsearch
set autochdir

"disable scratch preview when coding python
set completeopt-=preview

"Shows operators as u type.
set showcmd

"automatically load vim after saving vim
augroup automaticallySourceVimrc
    au!
    au bufwritepost .vimrc source ~/.vimrc
augroup END

"Toggle highlighting in search
nnoremap <leader>l :silent! nohls<cr>

"Reverse display lines and acutal vim line
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"New lines without leaving normal mode
nnoremap zj moo<esc>k`o
nnoremap zk moO<esc>`o

"Easier escape
inoremap jk <esc>
inoremap kj <esc>

"Faster buffer
noremap <leader>j :bnext<cr>
noremap <leader>k :bprevious<cr>
nnoremap <leader>b :Buffers<CR>

"Focus on different split screens
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"f as file
onoremap af :<C-u>normal! ggVG<CR>
"Better default splits
set splitbelow
set splitright

"Numbers in the side
set rnu
set number
set number relativenumber
" noremap <leader>n :set rnu! nu!<cr>

"f3 to toggle between paste mode and no... when in paste mode auto indent will
"be off
" :set pastetoggle=<leader>pm

"ale:
let g:ale_set_balloons = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['yapf'],
            \   'cpp': ['clang-format'],
            \   'javascript': ['prettier', 'eslint'],
            \   'html': ['prettier'],
            \   'css': ['prettier'],
            \   'scss': ['prettier'],
            \   'vue': ['prettier'],
            \}
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint']}

"ycm for vue
source /home/amaimon43/.vim/lsp-examples-master/vimrc.generated
let g:ycm_confirm_extra_conf = 0

"ycm for css, scss
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^', 're!^\s+', ':',': '],
    \   'scss': [ 're!^', 're!^\s+', ':',': '],
    \ }


"polyglot:
let g:python_highlight_space_errors = 0
" let g:json_highlight_space_errors = 0

"emmet:
let g:user_emmet_install_global = 0
autocmd FileType html,css,sass,vue EmmetInstall
let g:user_emmet_leader_key=','

"vim-vue
let g:vue_pre_processors = 'detect_on_enter'

function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction

function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction



"nerdtree stuff
noremap <F2> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode=2
map <leader>n :NERDTree ~/<CR>
map <leader>f :NERDTreeFind<cr>

" ycm stuff:
let g:ycm_auto_hover = ''
nnoremap gd :YcmCompleter GoTo<CR>


"For fzf
noremap <leader>t :Files<cr>
" nnoremap <silent> <leader>t :GFiles --cached --others --exclude-standard<cr>
let $FZF_DEFAULT_COMMAND ='rg --files -g "!{**/node_modules/*}" -g "!*.o"'
noremap <leader>h :History<cr>

"ultisnips:
"ue for UltiSnipsEdit
nnoremap <leader>ue :UltiSnipsEdit<cr>
"vr for editing vimrc
nnoremap <silent> <Leader>vr :e ~/.vimrc<CR>
"c for code.cpp
nnoremap <silent> <Leader>c :e ~/cpp_code/code.cpp<CR>
"d for del.py
nnoremap <silent> <Leader>d :e ~/python_code/del.py<CR>


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"it shows the end } but removes dot repetability.
let g:pear_tree_smart_backspace = 1
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_openers = 1

"viminspector:
let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector
"configs for vimspector:
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch


"Vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tmsvg/pear-tree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'puremourning/vimspector'
Plug 'posva/vim-vue'
"""""
"""""
"""""
" Plug 'pip install pylint'
" Plug 'universal-ctags/ctags'
" Plug 'ryanoasis/vim-devicons'
" Plug 'ThePrimeagen/vim-be-good'
call plug#end()
