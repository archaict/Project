{ config, pkgs, lib, ... }:

{
  services = {

    mysql = {
      enable = true;
      package = pkgs.mysql80;
      dataDir = "/var/db/mysql";
    };

  # emacs = {
  #   enable = true;
  #   defaultEditor = true;
  # };

    longview.mysqlPassword = "nixnixnix";

  };
}
