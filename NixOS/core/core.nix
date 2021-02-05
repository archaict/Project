{ config, pkgs, lib, ... }:

{
  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
      fontSize = 12;
    };
    plymouth = {
      enable = true;
      theme = "breeze";
    };
    kernelParams = [
      "panic=30" "boot.panic_on_fail"
      "workqueue.power_efficient=y"
    ];

  };

  swapDevices = [
    {
      device = "/var/swap";
      size = 4096;
    }
  ];

  sound.enable = true;
  nixpkgs.config.pulseaudio = true;

  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = true;
  # sane.enable = true;
  };


  networking = {
    hostName = "nixos";
    firewall.enable = true;
    networkmanager.enable = true;
    interfaces.wlp1s0.useDHCP = true;
    extraHosts = (import ./network.nix).hosts ;

    useDHCP = false;
  # resolvconf.enable = true;
  # networkmanager.dns = "none";
  # dhcpcd.extraConfig = "nohook resolv.conf";
  # nameservers = [ "127.0.0.1" "::1" ];
  };

  security.sudo.wheelNeedsPassword = true;

  programs = {
    adb.enable = true;
    zsh.enable = true;
    light.enable = true;
    qt5ct.enable = true;
    dconf.enable = true;
    ssh.askPassword = "";

    zsh.autosuggestions.enable = true;
    zsh.enableCompletion = true;
    zsh.syntaxHighlighting.enable= true;
  };

  services = {
    blueman.enable = true;
    lorri.enable = true;
    tor.enable = true;

  # USB Automounting
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;

  # printing.enable = true;
  };
 
  services.emacs = {
    enable = true;
  # package = import $HOME/.emacs.d { pkgs=pkgs; };
  };

  system.stateVersion = "20.09";
}
