{config,pkgs,lib,...}:
{

  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # users.extraGroups.vboxusers.members = [ "archaict" ];

  environment.systemPackages = with pkgs; [

#┌─────> COMMAND LINE INTERFACE ─────────────────────────── [ cli ] ───┐#

    kitty zsh fzf htop ctags # gotop
    neovim debootstrap streamlink emacs
    nox any-nix-shell nix-prefetch nix-prefetch-github
    ranger figlet toilet lolcat jq
    neofetch pfetch scrot w3m
    git curl wget zip unzip bat starship
    mpd mpc_cli ncmpcpp ffmpeg

#└─────────────────────────────────────────────────────────────────────┘#
#┌─────> GRAPHICAL INTERFACE ────────────────────────────── [ gui ] ───┐#

    matcha-gtk-theme gnome-breeze
    numix-icon-theme adapta-gtk-theme
    nixos-icons nordic vscodium
    zathura sxiv pavucontrol mpv
    obsidian
    pcmanfm jmtpfs archiver
    firefox chromium
    tor-browser-bundle-bin

#└─────────────────────────────────────────────────────────────────────┘#
#┌─────> WINDOWS MANAGER ────────────────────────────────── [ wmn ] ───┐#

    dunst libnotify unclutter
    acpi light tlp
    nitrogen pscircle feh
    lxappearance xclip autorandr
    dmenu rofi polybar tdrop

#└─────────────────────────────────────────────────────────────────────┘#
#┌─────> CYBER SECURITY / NETWORKING ────────────────────── [ cys ] ───┐#

    nmap
    wireshark

#└─────────────────────────────────────────────────────────────────────┘#
#┌─────> DEVELOPMENT ────────────────────────────────────── [ dvl ] ───┐#

    R                                                    # ┌    RS    ┐ #
    youtube-dl                                           # │          │ #
    nodejs
    nodePackages_latest.live-server                      # │   Java   │ #
    nodePackages_latest.prettier
    android-studio                                       # │ AndroidS │ #
    ghc                                                  # │  Hskell  │ #
    qt5ct                                                # └          ┘ #
    pandoc #texlive.combined.scheme-small
    go
    direnv nix-direnv home-manager

#┌──────── PY-DEV ─────────────────────────────────────────────────────┐#
#  {{{ [pydev]: Python Development

    python38Full
    python38Packages.pip
    python38Packages.pandas
    python38Packages.matplotlib
  ];

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#

  nix = {
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      '';
    };
  
  environment.pathsToLink = [
    "/share/nix-direnv"
  ];

}
