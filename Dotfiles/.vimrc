"###############################
" VIM RC FILES
" NODE // ARHICEL // NULLØ
" ID - 0011 // LCT - 10,11,20 //
"################################
"VIMRC

"VIMPLUG
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'zeekay/vim-beautify'
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimwiki/vimwiki'
Plug 'honza/vim-snippets'
Plug 'blindFS/vim-reveal'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wmvanvliet/jupyter-vim'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'blindFS/vim-reveal'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'supercollider/scvim' 
call plug#end()

syntax on
syntax enable
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
 
"THEME

set t_Co=256
colorscheme gruvbox
set bg=dark
hi Normal guibg=#222222 ctermbg=NONE
hi Folded ctermfg=245 ctermbg=235
hi Comment ctermfg=246
highlight EndOfBuffer ctermfg=234
let g:ctrlp_show_hidden = 1
highlight VimwikiLink ctermfg=214
highlight VimwikiListTodo ctermfg=214

"SET

"set omnifunc=htmlcomplete#CompleteTags
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set so=7
set path+=**
set cursorline
set showcmd
set wildmode=longest,list
set wildmenu
set lazyredraw
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set ignorecase
set smartcase
set incsearch
set hlsearch
set mouse=a
set conceallevel=3
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set clipboard=unnamedplus


"LET

let mapleader=" "
let g:netrw_banner = 0
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

"REMAP
"NORMAL MODE REMAP
"

nnoremap <C-K> 10k
nnoremap <C-J> 10j
nnoremap <C--> <C-W><C-J>
nnoremap <C-=> <C-W><C-K>
nnoremap <leader>mus <F5>
nnoremap <leader>sin <F6>
nnoremap <leader>stop <F12>

nnoremap <S-J> 10jzz
nnoremap <S-K> 10kzz
nnoremap <S-L> w
nnoremap <S-H> b
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

noremap <leader>vs :vsplit<cr>
noremap <leader>hs :split<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>Q :q<cr>
nnoremap <leader>W :w<cr>

"INPUT MODE REMAP
"inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
"inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
inoremap ii <esc>
inoremap <c-a> <c-space>
inoremap <c-g> <c-x><c-f>

"COMMAND & VISUAL  MODE REMAP
vnoremap <S-L> w
vnoremap <S-H> b
map <Enter> o<esc>
"map <S-Enter> O<esc>
nnoremap q: <nop>
vnoremap <S-J> 10jzz
vnoremap <S-K> 10kzz
noremap <leader>y "+y
noremap <leader>p "+p
noremap y "+y


"AUTO COMMAND ON VIM START


"APPLICATION

"MODE

let g:currentmode={
    \ 'n'      : 'Normal',
    \ 'no'     : 'Normal·Operator Pending',
    \ 'v'      : 'Visual',
    \ 'V'      : 'V·Line',
    \ "\<C-V>" : 'V·block',
    \ 's'      : 'Select',
    \ 'S'      : 'S·Line',
    \ '^S'     : 'S·Block',
    \ 'i'      : 'Insert',
    \ 'R'      : 'Replace',
    \ 'Rv'     : 'V·Replace',
    \ 'c'      : 'Command',
    \ 'cv'     : 'Vim Ex',
    \ 'ce'     : 'Ex',
    \ 'r'      : 'Prompt',
    \ 'rm'     : 'More',
    \ 'r?'     : 'Confirm',
    \ '!'      : 'Shell',
    \ 't'      : 'Terminal'
    \}

"//STATUSLINE!

set laststatus=2
set noshowmode
set statusline=
set statusline+=%4*\ %n\                                 " Buffer number
set statusline+=%4*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%3*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%3*│                                     " Separator
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%3*│                                     " Separator
"set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%1*\ %Y\                                 " FileType

hi User1 ctermfg=239 ctermbg=214 guifg=#494949 guibg=#ffaf00
hi User2 ctermfg=007 ctermbg=NONE guifg=#c0c0c0 guibg=#adadad
hi User3 ctermfg=240 ctermbg=NONE guifg=#585858 guibg=#1c1c1c
hi User4 ctermfg=244 ctermbg=235 guifg=#808080 guibg=NONE

"TAB COMPLETION

function! InsertTabWrapper()
       let col = col('.') -1
       if !col || getline('.')[col -1] !~ '\k'
       return "\<tab>"
else
       return "\<c-n>"
       endif
endfunction

inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-p>

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


"PYTHON


" Run current file

let g:slime_target = "vimterminal"
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig
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
let vim_markdown_preview_hotkey='<c-m>'
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:vim_markdown_folding_disabled = 1

let g:sclangTerm = "Termite -x $SHELL -ic"
let g:scFlash = 1
