{ config, pkgs, lib, ... }:

{
  programs.zsh.initExtra = ''
    source $HOME/.config/zsh/.aliases
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"

    setopt promptsubst
    export VIRTUAL_ENV_DISABLE_PROMPT=1
  
    ZLE_RPROMPT_INDENT=0
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(
      main brackets pattern cursor
    )
  
    ZSH_HIGHLIGHT_STYLES[alias]="fg=magenta"
    ZSH_HIGHLIGHT_STYLES[path]="fg=yellow"
  
    bindkey '^H' backward-kill-word
    bindkey '^[[3;5~' kill-word

    # MECHA

    mecha() {
    if [ $1 = 'arch' ]; then
        machinectl login archlinux
    elif [ $1 = 'deb' ]; then
        machinectl login debian
    fi
    }

    # FUNCTIONS

    knit() {
        R -e "library(rmarkdown);rmarkdown::render('$1')"
    }

    fgit() {
        nix-universal-prefetch fetchFromGitHub \ 
        --owner $1 --repo $2 --rev $3
    }

    eisvogel() {
        pandoc $1.md -o $1.pdf \
        --from markdown+yaml_metadata_block+raw_html \
        --template eisvogel --listings \
        --table-of-contents --toc-depth 2 \
        --number-sections
    }

    Arcadium() {
        cp -R $NIXCFG $ARC/Arcadium
    }

    nix-search() {
        p=~/.nix-profile/share/doc/home-manager/options.json \
        o="$(jq -r ". | keys | .[]" < $p | fzf)" \
        jq -r ".\"''${o}\"" < $p
    }

    precmd() {
      PROMPT='%c %{$fg[blue]%} %{$reset_color%} '
      STATUS='impure'
    
      if [ -n "$VIRTUAL_ENV" ];then
         RPROMPT='%{$fg[green]%}[python-shell]%{$reset_color%}'
      elif [ "$IN_NIX_SHELL" = "$STATUS" ];then
         RPROMPT='%{$fg[blue]%}[nix-shell]%{$reset_color%}'
      elif [ -n "$(git_prompt_info)" ];then
         RPROMPT='%{$fg[green]%}[git-shell]%{$reset_color%}'
      else
         RPROMPT='%{$fg[blue]%}[nix-machina]%{$reset_color%}'
      fi
      }
    '';
}

