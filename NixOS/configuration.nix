#┌─────────────────────────────────────────────────────────────────────┐#
#│                                                                     │#
#│                          ▘    ▗     ニクソス ▜                      │#
#│                   ▛▌▛▘▛▌ ▌█▌▛▘▜▘  ▀▌▛▌▛▌▛▛▌▀▌▐ ▌▌                   │#
#│                   ▙▌▌ ▙▌ ▌▙▖▙▖▐▖  █▌▌▌▙▌▌▌▌█▌▐▖▙▌                   │#
#│                   ▌     ▙▌                     ▄▌                   │#
#│                                                                     │#
#│             ホームマネージャー      あのまりプロジェクト           │#
#│          NixOS configuration for reproducible linux system          │#
#│           Project Anomaly from Archaict and foundation 64           │#
#│                                                                     │#
#└─────────────────────────────────────────────────────────────────────┘#
#                                                                  nxs  #

#┌── NIXOS ────────────────────────────────────────────────────────────┐#
#└─────────────────────────────────────────────────────────────────────┘#

#┌──── LET ──────────────────────────────────────────────── [ ltn ] ───┐#
#  {{{ Let it snow!                                                ltn  #

{ config, pkgs, ... }:

let
  unstableTarball = fetchTarball
  https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;

# home-manager = builtins.fetchGit {
#   url = "https://github.com/rycee/home-manager.git";
#   ref = "release-20.09";
# };

in

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── IMPORTS ──────────────────────────────────────────── [ ipr ] ───┐#
#  {{{ All the important stuff?                                    ipr  #

{
  imports = [
    ./hardware-configuration.nix
    ./hosts.nix
    ./core
#    <schema>
#    (import "${home-manager}/nixos")
  ];

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

# home-manager.users.archaict = {
#   programs.home-manager = {
#     enable = true;
#   };

#   home ={
#     username = "archaict";
#     homeDirectory = "/home/archaict";
#   };

#   imports = [ ./machina ./schema/schema.nix ];

#   home.stateVersion = "20.09";
# };

      
#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── OVERRIDES ────────────────────────────────────────── [ ovr ] ───┐#
#  {{{ Call em, over.                                              ovr  #

  nixpkgs.config.packageOverrides = pkgs: {

    nur = import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/NUR/archive/f10e442707421fab618ba15d3128a003f249bef0.tar.gz";
        sha256 = "1wlwbfx47dn91ijajhn67jk1fgpwai84vm2vz399jjjzhg69lgj6"; } )
        { inherit pkgs; };

      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };


#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── BOOTUPS ──────────────────────────────────────────── [ ovr ] ───┐#
#  {{{ Starting up!                                                btp  #

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
    fontSize = 12;
  };

  swapDevices = [ { device = "/var/swap"; size = 4096; } ];
#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── FONTS ────────────────────────────────────────────── [ fnt ] ───┐#
#  {{{ Terminal illness without fonts.                             fnt  #

  fonts.fonts = with pkgs; [
    font-awesome
    siji
    iosevka
    noto-fonts
    noto-fonts-cjk
    unifont siji
    liberation_ttf
    ubuntu_font_family
    fira-code fira-code-symbols
    (nerdfonts.override { fonts = [
      "FiraCode"
      "DroidSansMono"
      "Iosevka"]; })
  ];

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── NETWORKS ─────────────────────────────────────────── [ ntw ] ───┐#
#  {{{ Related or not, it's a weeb.                            trb ntw  #

  networking = {
    hostName = "nixos";
    useDHCP = false;
    interfaces.wlp1s0.useDHCP = true;
    networkmanager.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # services.printing.enable = true;   # CUPS Printing
  # hardware.sane.enable = true;       # scanner

  services.tor = {
    enable = true;
  };

  security.sudo.wheelNeedsPassword = false;

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── X-SERVER ─────────────────────────────────────────── [ xsv ] ───┐#
#  {{{ X'es and powering stuff, Window Management.                 xsv  #

  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "caps:super";
    autoRepeatDelay = 200;
    autoRepeatInterval = 25;
    desktopManager.xterm.enable = false;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "none+xmonad";

    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          i3-gaps  # i3blocks-gaps
          i3lock   i3lock-fancy
          # i3status
        ];
      };
      qtile.enable = true;
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = hp: [
          hp.dbus
          hp.xmonad
          hp.xmobar
          hp.monad-logger
          hp.xmonad-contrib
          hp.xmonad-extras
        ];
      };
    };

    libinput.enable = true;
  };

  # services.xrdp.enable = true;
  # services.xrdp.defaultWindowManager = "${pkgs.xmonad}/bin/xmonad";
  # networking.firewall.allowedTCPPorts = [ 3389 ];

  powerManagement.enable = false;
  services.logind.lidSwitch = "ignore";
  services.logind.extraConfig = ''
    LidSwitchIgnoreInhibited = False
    IdleAction=ignore
  '';

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── SOUNDS ───────────────────────────────────────────── [ snd ] ───┐#
#  {{{ Do you hear that?                                           snd  #

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  nixpkgs.config.pulseaudio = true;

    services.mpd = {
      enable = true;
      user = "archaict";
      group = "users";
      dataDir = "/home/archaict/.config/mpd";
      musicDirectory = "/home/archaict/Music";
      extraConfig = ''
        audio_output {
          type "fifo"
          name "FIFO"
          path "/tmp/mpd.fifo"
          format "44100:16:1"
        }
        audio_output {
          type "pulse"
          name "pulseaudio"
          server "127.0.0.1"
        }
      '';
    };

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── PROFILE ──────────────────────────────────────────── [ prf ] ───┐#
#  {{{ Who am I?                                                   prf  #

  users.users.archaict = {
    isNormalUser = true;
    extraGroups = [
      "wheel" "audio" "sound" "tty" "docker"
      "video" "adbusers" "networkmanager"
      "input" "vboxusers" "libvirtd" ];
    };

  nix.allowedUsers = ["*"];

  users.defaultUserShell = pkgs.zsh;

  programs = {
    adb.enable = true;
    light.enable = true;
    qt5ct.enable = true;

#┌─────> ZSH ────────────────────────────────────────────── [ zsh ] ───┐#
#  {{{                                                             zss  #

   zsh = {
     
     enable = true;
     autosuggestions.enable = true;
     enableCompletion = true;

     syntaxHighlighting = {
       enable = true;
       styles ={"alias" = "fg=magenta,bold";};
     };
   };
  };

  environment.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
  };

#┌──── SERVICE ──────────────────────────────────────────── [ srv ] ───┐#
#  {{{                                                             srv  #

  services= {
    # picom.enable = true;
    tlp.enable = true;
    lorri.enable = true;
  };

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── ENVIRONMENT ──────────────────────────────────────── [ env ] ───┐#
#  {{{ System export, locating resource...                         env  #

  environment.interactiveShellInit = ''
    export XDG_CONFIG_HOME="$HOME/.config"
    export QT_QPA_CONFIG_HOME="qt5ct"
    export EDITOR=nvim
    export VISUAL=nvim
    export BROWSER=firefox
  '';

  systemd.user.services."dunst" = {
    enable = true;
    description = "";
    wantedBy = [ "default.target" ];
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.dunst}/bin/dunst";
  };
#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── CONTAINERS ───────────────────────────────────────── [ sdn ] ───┐#
#  {{{ Secured, Contained, Perfections.                            sdn  #

  systemd.targets.machines.enable = true;

#┌────── ARCHLINUX - CONTAINER ────────────────────────────────────────┐#
#  {{{ NEMESIS                                                     ltn  #

  systemd.nspawn."archlinux" = {
    enable = true;
    execConfig = {
      Boot = true;
    };
    networkConfig.VirtualEthernet = false;
  };
  systemd.services."systemd-nspawn@archlinux" = {
    enable = true;
    wantedBy = [ "machines.target" ];
  };

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#
#┌──── NIXOS VERSION ────────────────────────────────────── [ vrs ] ───┐#
#  {{{ Systems state version.                                       ver #

  system.stateVersion = "20.09";

}

#                                                                  }}}  #
#└─────────────────────────────────────────────────────────────────────┘#

#┌── EOL ──────────────────────────────────────────────────────────────┐#
#└─────────────────────────────────────────────────────────────────────┘#
