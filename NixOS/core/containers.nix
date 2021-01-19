{ config, pkgs, lib, ... }:

{
  systemd.targets.machines.enable = true;

  systemd.nspawn."archlinux" = {
    enable = true;
    execConfig = {
      Boot = true;
    };
    networkConfig.VirtualEthernet = false;
  };
  systemd.services."systemd-nspawn@archlinux" = {
    enable = false;
    wantedBy = [ "machines.target" ];
  };

  virtualisation = {

    docker = {
      enable = true;
    };

    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };

  };
}
