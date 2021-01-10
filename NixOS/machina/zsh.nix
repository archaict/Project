{ config, pkgs, lib, ... }:

{ 
    programs.zsh = {
#  {{{ need some packages on git?

    plugins = [
        { 
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "v0.8.0-alpha1-pre-redrawhook";
            sha256 = "1gv7cl4kyqyjgyn3i6dx9jr5qsvr7dx1vckwv5xg97h81hg884rn";
          };
        }

        {
          name = "nix-zsh-completions";
          src = pkgs.fetchFromGitHub {
            owner = "spwhitt";
            repo = "nix-zsh-completions";
            rev = "0.4.4";
            sha256 = "1n9whlys95k4wc57cnz3n07p7zpkv796qkmn68a50ygkx6h3afqf";
          };
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.1.0";
            sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
          };
        }
      ];

#  }}}
#  {{{ ZSH Configuration
      enable = true;
      autocd = true;

      enableCompletion      = true;
      enableAutosuggestions = true;
        
      dotDir = ".config/zsh";

      history = {
        size = 10000;
        save = 10000;
        path = ".config/zsh/.zhistory";

        share       = true;
        extended    = true;
        ignoreDups  = true;
        ignoreSpace = true;
    };
# }}}
#  {{{ Initialize System Command Line Interface (loading...)
      initExtra = ''
  
        source $HOME/.config/zsh/.aliases
        setopt promptsubst
        export VIRTUAL_ENV_DISABLE_PROMPT=1
  
        ZLE_RPROMPT_INDENT=0
        ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(
          main brackets pattern cursor
        )
  
        ZSH_HIGHLIGHT_STYLES[alias]="fg=magenta"
        ZSH_HIGHLIGHT_STYLES[path]="fg=yellow"
  
        bindkey '^H' backward-kill-word
        bindkey '^[[3;5~' kill-word
  
        source "$(fzf-share)/key-bindings.zsh"
        source "$(fzf-share)/completion.zsh"
      '';
  
      shellAliases = {
        zshh = "source ~/.config/zsh/.zshrc";
        aliases = "vim ~/.config/zsh/.aliases";
      };
  #  }}}
#  {{{ OH_MY_ZSH!
      oh-my-zsh = {
        enable = true;
        theme = "lambda";
        plugins = [

        "git" "colored-man-pages" 
        "command-not-found" "extract"
        "history-substring-search"
        "direnv" "ufw" "nmap"
        "catimg"

      ];
    };
  # }}}
  };
}

