{ config, pkgs, lib, ... }:

let
dracula          = pkgs.vimUtils.buildVimPlugin {
  name           = "vim";
  src            = pkgs.fetchFromGitHub {
    owner        = "dracula";
    repo         = "vim";
    rev          = "e7154372adc95d637ccd911c2f8601d9ff2eac1f";
    sha256       = "1li5q3151kjh8c6a7cdnmbydxhkjgqsa5nlv49dy6dnqc3b50m7s";
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
mdpreview        = pkgs.vimUtils.buildVimPlugin {
  name           = "mdpreview";
  src            = pkgs.fetchFromGitHub {
    owner        = "iamcco";
    repo         = "markdown-preview.nvim";
    rev          = "v0.0.9";
    sha256       = "1y30ph5l240rccks8hv2q74r0ckx3yldmlcz5cg4sryvhp3gs10x";
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

{ 

  programs.neovim.configure = {
    plug.plugins = with pkgs.vimPlugins; [

      vim-lion      lightline-vim       sensible
      polyglot      ale                 fugitive
      vim-nix       nord-vim            coc-nvim
      supertab      vim-surround        auto-pairs
      vim-pandoc    vim-rmarkdown       vim-pandoc-syntax
      table-mode    vim-startify        # nvim-md-preview
      vim-easymotion dracula            iceberg_vim
      coc-prettier  vimwiki             fzf-vim
      goyo          colorizer           firenvim
      ranger-vim    gruvbox             NeoSolarized
      limelight-vim mdpreview

    ]; # vplg
  };

}

