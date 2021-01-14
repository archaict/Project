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
    useDHCP = false;
    interfaces.wlp1s0.useDHCP = true;
    networkmanager.enable = true;
    firewall.enable = true;
  };

  security.sudo.wheelNeedsPassword = false;

  programs = {
    adb.enable = true;
    zsh.enable = true;
    light.enable = true;
    qt5ct.enable = true;
    dconf.enable = true;

    zsh.autosuggestions.enable = true;
    zsh.enableCompletion = true;
    zsh.syntaxHighlighting.enable= true;
  };

  services = {
    blueman.enable = true;
    lorri.enable = true;
  # printing.enable = true;
  };

  imports = [
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-20.09.tar.gz}/nixos")
  ];

  system.stateVersion = "20.09";
}
