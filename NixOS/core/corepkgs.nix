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
      nixFlakes

    ];

    clipkgs = [

      kitty zsh fzf
      htop ctags gotop
      neovim debootstrap
      streamlink emacs
      ranger figlet toilet
      lolcat jq tree manpages
      pandoc neofetch
      pfetch scrot w3m
      git curl wget zip unzip
      bat unstable.starship
      mpd mpc_cli ncmpcpp
      ffmpeg youtube-dl
      trash-cli

    ];

    guipkgs = [

      qt5ct
      matcha-gtk-theme
      gnome-breeze
      numix-icon-theme
      adapta-gtk-theme
      nordic vscodium obsidian
      zathura sxiv pavucontrol
      mpv pcmanfm gparted
      jmtpfs archiver
      firefox
    # qutebrowser chromium
      tor-browser-bundle-bin
      discord signal-desktop

    ];

    wmapkgs = [

      acpi light tlp
      nitrogen feh xclip
      dunst libnotify unclutter
      lxappearance autorandr
      dmenu rofi polybar tdrop

    ];

    secpkgs = [

      nmap
      wireshark

    ];

    devpkgs = [

      R              # R
      go             # Go

      gcc            # C
      ghc            # Haskell

      ruby           # Ruby

      gnumake
      android-studio # Android

      nodejs         # Java
      nodePackages_latest.live-server
      nodePackages_latest.prettier

      python38Full   # python
      python38Packages.pip
      python38Packages.pandas
      python38Packages.matplotlib

    ];

    texpkgs = [

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
