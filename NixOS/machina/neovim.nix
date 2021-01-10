{ config, pkgs, lib, ... }:

#┌──── NEOVIM ───────────────────────────────────────────── [ nvm ] ───┐#
#  {{{ Must contain my HUNGER!


#  {{{ Need some packages on Git?
let

  vim-rmarkdown    = pkgs.vimUtils.buildVimPlugin {
    name           = "vim-rmarkdown";
    src            = pkgs.fetchFromGitHub {
      owner        = "vim-pandoc";
      repo         = "vim-rmarkdown";
      rev          = "master";
      sha256       = "1rn7izmr0wbrrb5l8172fxyssfcs3pi3k1gw5mna3gj3rj7fq2wj";
    };
  };
  nvim-md-preview  = pkgs.vimUtils.buildVimPlugin {
    name           = "nvim-md-preview";
    src            = pkgs.fetchFromGitHub {
      owner        = "davidgranstrom";
      repo         = "nvim-markdown-preview";
      rev          = "master";
      sha256       = "1kc74y9wd6ipz82ry7c3vzi4r65b817wiwcgf7q0632qxxczqdxr";
    };
  };
  vim-one          = pkgs.vimUtils.buildVimPlugin {
    name           = "vim-one";
    src            = pkgs.fetchFromGitHub {
      owner        = "rakr";
      repo         = "vim-one";
      rev          = "6695e135415c53a8fbe96672e382200aa1ffb4b4";
      sha256       = "0951r9kw23zlwd7fda6ib2d9k0akpfd2hvh82pasgw3ks9v1n2vf";
    };
  };
  vim-polar        = pkgs.vimUtils.buildVimPlugin {
    name           = "vim-polar";
    src            = pkgs.fetchFromGitHub {
      owner        = "habamax";
      repo         = "vim-polar";
      rev          = "9ec2c68cd896e516315774fdc10855c66055fca7";
      sha256       = "1xj8l88f26dlb1vqc9q22lv6ls6611vw4bz43l68fyn36bvw9j3y";
    };
  };
  iceberg_vim      = pkgs.vimUtils.buildVimPlugin {
    name           = "iceberg_vim";
    src            = pkgs.fetchFromGitHub {
      owner        = "cocopon";
      repo         = "iceberg.vim";
      rev          = "389491397a705bb39d93f87ed7f355e984834fbe";
      sha256       = "1wnrsl56lya7cy22f8imhj85yl5ki3l47680b4n2pri79slbd96b";
    };
  };
  vim-waikiki      = pkgs.vimUtils.buildVimPlugin {
    name           = "vim-waikiki";
    src            = pkgs.fetchFromGitHub {
      owner        = "fcpg";
      repo         = "vim-waikiki";
      rev          = "7af1879a8ea0e4a0a7bd181ed17ad3d37478215e";
      sha256       = "0l9lcvbpxq9s9dbmgfs6j95ika68nbmcl5hfs7llmq4mc2p0lczk";
    };
  };
  wiki-vim         = pkgs.vimUtils.buildVimPlugin {
    name           = "wiki-vim";
    src            = pkgs.fetchFromGitHub {
      owner        = "lervag";
      repo         = "wiki-vim";
      rev          = "7979822e2261739204d550ab21aa425bd1eda337";
      sha256       = "18nwbz7z0n6x604q7r06svf0ry6p2qyiqnm2w8550x8kyccmp502";
    };
  };

  firenvim         = pkgs.vimUtils.buildVimPlugin {
    name           = "firenvim";
    src            = pkgs.fetchFromGitHub {
      owner        = "glacambre";
      repo         = "firenvim";
      rev          = "eb4555f850504116f954c525c88a7864c5a962c0";
      sha256       = "04h0kf64zx9l5s8p445gydy0bhhy8xfkqg6v41ny49s1cmdbfqyy";
    };
  };

in
#  }}}

  {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      configure = {
        customRC = ''
          "{{{ SETS

          syntax on
          colorscheme ${config.vimcolors.color_scheme}
          set background=${config.vimcolors.background}
          set shiftwidth=2
          set conceallevel=2
          let g:netrw_banner=0
          set foldmethod=marker
          set clipboard=unnamedplus
          set expandtab softtabstop=2
          set nospell noshowmode
          set nu rnu smartcase ignorecase
          set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_
          set fillchars=fold:\ 

          "}}}
          "{{{ LETS

          let mapleader = "\<tab>"
          let g:lion_map_right = 'gj'
          let g:vim_markdown_frontmatter = 1
          let g:pandoc#modules#disabled = ["spell"]

          let g:wiki = '~/Archaict/Arkiv/'
          let g:wiki_link_filetypes = 'md'
          let g:wiki_link_extension = '.md'
          let g:wiki_link_target_type = 'md'

          "}}}
          "{{{ REMAPS

          nnoremap j gj
          nnoremap k gk
          nnoremap <S-J> <C-D>
          nnoremap <S-K> <C-U>

          "nnoremap ; :
          "nnoremap : ;
          "vnoremap ; :
          "vnoremap : ;

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

          "}}}
          "{{{ HIGHLIGHTS

          "hi Visual term=none cterbg=None
          hi Normal term=none ctermbg=None
          hi Folded term=none ctermbg=None
          hi OverLength ctermbg=red ctermfg=white
          match OverLength /\%74v.\+/

          "}}}
          "{{{ ABBREVIATE
          iab akd ''${}<left>
          iab akv 
          \ ---<CR>
          \TITLE: ARKIV<CR>
          \AUTHOR: Archaict<CR>
          \CATEGORIES:<CR>
          \KEYWORDS:<CR>
          \---
          "}}}
          "{{{ EVERYTHING ELSE

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


          set foldtext=MyFoldText()
          function! MyFoldText()
          let comment = substitute(getline(v:foldstart),'/\*\|\*/\|\#\|{{{\d\=', ' ', 'g')
              let txt = ' ' . ' ' . comment . ' '
              return txt "}}}
          endfunction

          "let arkiv = {}
          "let arkiv.path = '~/Archaict/Arkiv/'
          "let arkiv.syntax = 'markdown'
          "let arkiv.ext = '.md'

          let g:vimwiki_global_ext = 0
          let g:vimwiki_list = [{
          \'path':'~/Archaict/Arkiv/',
          \'syntax':'markdown',
          \'ext':'.md',
          \'links_space_char': '_'}]


          au FileType vimwiki set syntax=markdown
          let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
          
          "}}}
          '';

          plug.plugins = with pkgs.vimPlugins; [ #vplg
            vim-lion      lightline-vim       sensible
            polyglot      ale                 fugitive
            vim-nix       nord-vim            coc-nvim
            supertab      vim-surround        auto-pairs
            vim-pandoc    vim-rmarkdown       vim-pandoc-syntax
            table-mode    vim-startify        nvim-md-preview
            vim-easymotion vim-polar          iceberg_vim
            coc-prettier  vimwiki             fzf-vim
            goyo          colorizer           firenvim
        ]; # 
      };
    };
  }

# }}}
#└─────────────────────────────────────────────────────────────────────┘#
