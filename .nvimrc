syntax on
colorscheme Tomorrow-Night

let mapleader="\<SPACE>"

set tabstop=4
set shiftwidth=4
set expandtab
set number
set ruler
set autochdir

nnoremap <silent> <Leader>t :split<CR> :terminal<CR>


" plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
call plug#end()


" lightline
set laststatus=2 " allows lightline on singlewindow panes
set noshowmode " lightline shows us the mode, we dont need it from vim
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [['mode', 'paste'], ['readonly', 'modified'], ['fugitive', 'filename']],
    \   'right': [['lineinfo'], ['percent'], ['fileformat'], ['fileencoding'], ['filetype']],
    \ },
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&& &modified)',
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ' '._ : ''
    endif
    return ''
endfunction


" netrw
let g:netrw_liststyle = 3
let g:netrw_banner=0
let g:netrw_preview=1
let g:netrw_list_hide= '.*\.swp,__pycache__,.*\.pycm.*\.pyo'


" fzf
nmap <C-P> :FZF<CR>
