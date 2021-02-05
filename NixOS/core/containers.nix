{ config, pkgs, lib, ... }:

{
  systemd.targets.machines.enable = true;

  systemd.nspawn."archlinux" = {
    enable = false;
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


# BROWSER TOR #


# containers.browser = {
#   autoStart = false;
#   privateNetwork = true;
#   hostAddress = "192.168.7.10";
#   localAddress = "192.168.7.11";
#   config = {config, pkgs, ... }: {
#     services.openssh = {
#       enable = true;
#       forwardX11 = true;
#     };

#     users.extraUsers.browser = {
#       isNormalUser = true;
#       home = "/home/browser";
#       openssh.authorizedKeys.keys = [
#         (import /home/archaict/.ssh/browser.nix).browser
#       ];
#       extraGroups = ["audio" "video"];
#     };
#   };
# };

# networking.firewall.allowedTCPPorts = [
#   4713
#   6000
# ];
# hardware.pulseaudio = {
#   enable = true;
#   systemWide = true;
#   support32Bit = true;
#   tcp = {
#     enable = true;
#     anonymousClients = {
#       allowedIpRanges = [
#         "127.0.0.1" "192.168.7.0/24"
#       ]; }; };
# };

# networking = {
#   nat.enable = true;
#   nat.internalInterfaces = ["ve-browser"];
#   nat.externalInterface = "wlp1s0";

# };



}
