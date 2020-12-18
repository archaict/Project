"#----------------------- VIMRC CONFIGS -----------------------#

"#-------------------------- VIMPLUG --------------------------#
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
"Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode'
"Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
"Plug 'zeekay/vim-beautify'
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimwiki/vimwiki'
"Plug 'honza/vim-snippets'
Plug 'blindFS/vim-reveal'
Plug 'junegunn/goyo.vim'
Plug 'wmvanvliet/jupyter-vim'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
"Plug 'blindFS/vim-reveal'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'sheerun/vim-polyglot'
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
Plug 'ap/vim-css-color'
Plug 'tommcdo/vim-lion'
call plug#end()

"#------------------------ SET CONFIGS ------------------------#
set bg=dark
set nu
set t_Co=256
colorscheme wal
"colorscheme gruvbox
highlight EndOfBuffer ctermfg=234
"set list listchars=tab:»·,trail:·

hi VimwikiLink ctermfg=214
hi VimwikiListTodo ctermfg=214
hi Comment ctermfg=246
hi Folded ctermfg=245 ctermbg=235
hi Normal guibg=#222222 ctermbg=NONE
hi Visual  guifg=#181818 guibg=#505050
syntax on
syntax enable
filetype plugin indent on

set tabstop=2
set expandtab
set shiftwidth=2
set foldmethod=manual

set so=7
set path+=**

set showcmd
set wildmenu
set lazyredraw
set showmatch
set noerrorbells
set novisualbell
set tm=500
set ignorecase
set smartcase
set incsearch
set nofoldenable
set hlsearch
set mouse=a
set conceallevel=3
set wildmode=longest,list
set clipboard=unnamedplus
set backspace=eol,start,indent

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar


"#------------------------ LET CONFIGS ------------------------#

let mapleader=";"
let g:netrw_banner = 0
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"#--------------------------- REMAP ---------------------------#

"#------------------------ NORMAL MODE ------------------------#

nnoremap <C-K> 10k
nnoremap <C-J> 10j
nnoremap <C--> <C-W><C-J>
nnoremap <C-=> <C-W><C-K>

nnoremap gh 0
nnoremap gj H
nnoremap gk L
nnoremap gl $

noremap <leader>y "+y
noremap <leader>p "+p
noremap y "+y

nnoremap <S-J> 10jzz
nnoremap <S-K> 10kzz
nnoremap <S-L> w
nnoremap <S-H> b

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

nnoremap <C-Z> <Nop>
nnoremap j gj
nnoremap k gk
noremap <leader>o :e 
noremap <leader>tt :tabnew<cr>
nnoremap <leader>ll <C-W><C-L>
nnoremap <leader>hh <C-W><C-H>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>noh :noh<cr>
nnoremap <leader>vrc :e ~/.vimrc<cr>
nnoremap <leader>go :Goyo<cr>
noremap <leader>j gt
noremap <leader>k gT
nnoremap <leader>oo :bo vert term<CR>
nnoremap <leader>ii :NERDTreeToggle<CR>
nnoremap <leader>so :so%<CR>
nnoremap <leader>term :term ++curwin<CR>
nnoremap <leader>mus :!lilypond %<CR>

noremap <leader>vs :vsplit<cr>
noremap <leader>hs :split<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"#------------------------ NORMAL MODE ------------------------#

"#------------------------ INPUTVISUAL ------------------------#

map <Enter> o<esc>
inoremap ii <esc>
inoremap <c-a> <c-space>
inoremap <c-g> <c-x><c-f>

inoremap <s-tab> <c-p>
inoremap <expr> <tab> InsertTabWrapper()

vnoremap <S-L> w
vnoremap <S-H> b
nnoremap q: <nop>
vnoremap <S-J> 10jzz
vnoremap <S-K> 10kzz


"#------------------------- FUNCTIONS -------------------------#

function! InsertTabWrapper()
       let col = col('.') -1
       if !col || getline('.')[col -1] !~ '\k'
       return "\<tab>"
else
       return "\<c-n>"
       endif
endfunction

function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
    let selection = substitute(selection, ' ', '\\ ', "g")
  catch /Vim:Interrupt/
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path, glob)
  call SelectaCommand("find " . a:path . "/* -type f -and -iname '" . a:glob . "' -and -not -iname '*.pyc'", "", ":e")
endfunction


"#-------------------------- PYTHONS --------------------------#

xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig
let g:slime_target = "vimterminal"
nnoremap <leader>run :IPythonCellExecuteCell<CR>


autocmd Filetype ipynb nmap <silent><Leader>w :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>q :VimpyterStartJupyter<CR>

let g:reveal_config = {
            \'filename': 'index',
            \'outputPathDirname': '',
            \'revealWebPath': '~/reveal.js/',
            \'dependencies': '~/reveal.js/plugin/menu/menu.js',
            \'path': ''}
let vim_markdown_preview_browser='firefox'
let vim_markdown_preview_toggle=1

let g:sclangTerm = "Termite -x $SHELL -ic"
let g:scFlash = 1

augroup CocGroup
  autocmd!
  autocmd BufNew,BufRead * execute "CocEnable"
  autocmd BufNew,BufEnter *.md execute "silent! CocDisable"
  autocmd BufNew,BufEnter *.zshrc execute "silent! CocDisable"
augroup end

let g:pandoc#modules#disabled = ["spell","folding"]
