{ config, pkgs, lib, ... }:

{ 
  programs.zsh.plugins = [
    { 
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "v0.8.0-alpha1-pre-redrawhook";
        sha256 = "1gv7cl4kyqyjgyn3i6dx9jr5qsvr7dx1vckwv5xg97h81hg884rn";
     };
   } {
      name = "nix-zsh-completions";
      src = pkgs.fetchFromGitHub {
        owner = "spwhitt";
        repo = "nix-zsh-completions";
        rev = "0.4.4";
        sha256 = "1n9whlys95k4wc57cnz3n07p7zpkv796qkmn68a50ygkx6h3afqf";
      };
    } {
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.1.0";
        sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
      };
    } {
      name = "spaceship-prompt";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "denysdovhan";
        repo = "spaceship-prompt";
        rev = "f0ff567ed0823f3dec4a3a44c91453aac8fdb086";
        sha256 = "1l3s7p2smqrsgzcbwjhdc7fna5xjp3j7f8n4zw9hyzc7hcm145hh";
      };
    }
  ];

    programs.zsh.oh-my-zsh  = {
        enable   = true;
        theme    = "lambda";

        plugins  = [

        "git" "colored-man-pages" 
        "command-not-found" "extract"
        "history-substring-search"
        "direnv" "ufw" "nmap"
        "catimg"

      ];
    };
}

