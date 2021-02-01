{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
# nixpkgs.config.allowBroken = true;
  environment.systemPackages = with pkgs;

  let

    corepkgs = [

      home-manager
      any-nix-shell
      nixops niv nox 
      nix-direnv direnv
      nix-prefetch
      nix-prefetch-github
      nixos-icons
      socat
    # nixFlakes

    ];

    clipkgs = [

      kitty

      bc
      zsh
      fzf
      ctags 
      tree 
      manpages

      ranger 
      highlight
      
      htop 
      gotop

      emacs
      neovim 
      pandoc 

      figlet 
      toilet
      lolcat 

      jq 
      neofetch
      scrot 

      w3m
      git 
      curl 
      wget 
      rtorrent

      zip unzip
      unrar
      bat
      exa
      ripgrep

      mpd mpc_cli 
      ncmpcpp
      ffmpeg 
      youtube-dl

      trash-cli
      docker-compose
      lilypond

    # debootstrap
    # unstable.starship

    ];

    guipkgs = [

      gnome-themes-extra
      matcha-gtk-theme
      gnome-breeze
      numix-icon-theme
      adapta-gtk-theme
      nordic

      mpv
      gparted
      vlc
      pavucontrol
    # kodi

      obsidian
      zathura
      sxiv

      pcmanfm 
      jmtpfs
      archiver

      xfce.thunar
      xfce.xfconf
      xfce.tumbler
      xfce.exo
      betterlockscreen

      firefox
      chromium
    # qutebrowser
      tor-browser-bundle-bin
    # discord
      signal-desktop
      qbittorrent

      vscodium

    ];

    wmapkgs = [

      acpi
      light
      tlp

      feh
      nitrogen
      autorandr

      xclip
      dunst
      libnotify

      unclutter
      lxappearance 
      
      dmenu rofi 
      polybar

      scrcpy

    ];

    secpkgs = [

      nmap
      wireshark

    ];

    optpkgs = [

      cataclysm-dda
      nethack

    ];

    tlspkgs = [

      usbutils
      hdparm
      ddrescue
      qt5ct
      gdown

    ];

    devpkgs = [

      R              # R
      go             # Go
      libgudev

      gcc            # C
      ghc            # Haskell

      ruby           # Ruby

      gnumake yarn
      android-studio # Android

      nodejs         # Java
      nodePackages_latest.live-server
      nodePackages_latest.prettier

      python38Full   # python
      python38Packages.pip
      python38Packages.pandas
      python38Packages.matplotlib
      python38Packages.citeproc-py

      php74

    ];

    texpkgs = [

      zotero

    # texlive.combined.schme-full
    ( texlive.combine {
        inherit (texlive)
        collection-basic
        collection-bibtexextra
        collection-binextra
        collection-fontsextra
        collection-fontsrecommended
        collection-fontutils
        collection-formatsextra
      # collection-genericextra
      # collection-genericrecommended
        collection-langenglish
        collection-langeuropean
        collection-langitalian
        collection-latex
        collection-latexextra
        collection-latexrecommended
        collection-luatex
      #  collection-mathextra
        collection-metapost
        collection-pictures
      #  collection-plainextra
        collection-pstricks
        collection-publishers
      #  collection-science
        collection-xetex;
      })
    ];
  in
    corepkgs
    ++ clipkgs
    ++ guipkgs
    ++ wmapkgs
    ++ secpkgs
    ++ optpkgs
    ++ tlspkgs
    ++ devpkgs
    ++ texpkgs;

   environment.pathsToLink = [
      "/share/nix-direnv"
    ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = true;
    };
    fonts =
    with pkgs; [

      liberation_ttf
      iosevka fira-code
      fira-code-symbols
      ubuntu_font_family
      unifont font-awesome siji
      noto-fonts noto-fonts-cjk

      ( nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
          "Iosevka"
        ];
      })
    ];
  };

  programs.dconf.enable = true;
}
