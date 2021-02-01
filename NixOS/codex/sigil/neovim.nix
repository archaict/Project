{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      customRC = ''
        " ┌──────┐ "
        " │ SETS │ "
        " └──────┘ "

        syntax on
        colorscheme ${config.vimcolors.color_scheme}
        set background=${config.vimcolors.background}
        set cursorline
        set shiftwidth=2
        set conceallevel=2
        set colorcolumn=74
       "set colorcolumn=32,74
        let g:netrw_banner=0
        set foldmethod=marker
        set clipboard=unnamedplus
        set nospell noshowmode nobackup
        set expandtab softtabstop=2 tabstop=2
        set nu rnu smartcase ignorecase
        set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_
        set fillchars=fold:\ 

        " ┌──────┐ "
        " │ LETS │ "
        " └──────┘ "

        let mapleader = "\<tab>"
        let g:lion_map_right = 'gj'
        let g:vim_markdown_frontmatter = 1
        let g:pandoc#modules#disabled = ["spell"]

        let g:wiki = '~/Archaict/Arkiv/'
        let g:wiki_link_filetypes = 'md'
        let g:wiki_link_extension = '.md'
        let g:wiki_link_target_type = 'md'

        " ┌────────┐ "
        " │ REMAPS │ "
        " └────────┘ "

        nnoremap j gj
        nnoremap k gk
        nnoremap <S-J> <C-D>
        nnoremap <S-K> <C-U>

        vnoremap j gj
        vnoremap k gk

        noremap <leader>y "+y
        noremap <leader>p "+p
        noremap y "+y

        map Q <Nop>

        nnoremap <SPACE> za
        nnoremap <leader>oo :bo vert term<CR>
        nnoremap <leader>sv :vsplit<cr>
        nnoremap <leader>ss :split<cr>

        nnoremap <leader>rr :RangerEdit<cr>
        nnoremap <leader>rv :RangerVSplit<cr>

        nmap <leader>F :.!figlet -w 200 -f standard<CR>
        nmap <leader>f :.!figlet -w 200 -f small<CR>
        nmap <leader>b :.!toilet -w 200 -f term -F border<CR>
        nmap <leader>B :.!toilet -w 200 -f pagga -F border<CR>


        " ┌────────────┐ "
        " │ HIGHLIGHTS │ "
        " └────────────┘ "

       "hi Visual term=none ctermbg=240
        hi Normal term=none ctermbg=None
        hi Folded term=none ctermbg=None
        hi ColorColumn ctermbg=${config.vimcolors.cc}

        " ┌────────────┐ "
        " │ ABBREVIATE │ "
        " └────────────┘ "

        iab akd ''${}<left>
        iab akv 
        \ ---<CR>
        \TITLE: ARKIV<CR>
        \AUTHOR: Archaict<CR>
        \CATEGORIES:<CR>
        \KEYWORDS:<CR>
        \---

        " ┌──────────┐ "
        " │ ETCETERA │ "
        " └──────────┘ "

        let s:hidden_all = 1
        function! ToggleHiddenAll()
            if s:hidden_all  == 0
                let s:hidden_all = 1
                set noshowmode
                set noruler
                set laststatus=0
                set noshowcmd
            else
                let s:hidden_all = 0
                set showmode
                set ruler
                set laststatus=2
                set showcmd
            endif
        endfunction
        nnoremap <leader>h :call ToggleHiddenAll()<CR>

       "autocmd BufNewFile,BufRead *.wiki set filetype=markdown
        command! -nargs=0 Prettier :CocCommand prettier.formatFile

        augroup GoyoEnter
          autocmd!
          autocmd User GoyoEnter Limelight
          autocmd User GoyoEnter hi Normal term=none ctermbg=None
          autocmd User GoyoEnter hi Folded term=none ctermbg=None
        augroup END

        augroup GoyoLeave
          autocmd!
          autocmd User GoyoLeave Limelight!
          autocmd User GoyoLeave hi Normal term=none ctermbg=None
          autocmd User GoyoLeave hi Folded term=none ctermbg=None
        augroup END

        let g:limelight_conceal_ctermfg = 240

        set foldtext=MyFoldText()
        function! MyFoldText()
        let comment = substitute(getline(v:foldstart),'/\*\|\*/\|\#\|{{{\d\=', ' ', 'g')
            let txt = ' ' . ' ' . comment . ' '
            return txt "}}}
        endfunction

        let g:vimwiki_global_ext = 0
        let g:vimwiki_list = [{
        \'path':'~/Archaict/Arkiv/',
        \'syntax':'markdown',
        \'ext':'.md',
        \'links_space_char': '_'}]

        au FileType vimwiki set syntax=markdown
        let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

      '';
    };
  };
}
