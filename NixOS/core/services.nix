{ config, pkgs, lib, ... }:

{
  services = {

    mysql = {
      enable = true;
      package = pkgs.mysql80;
      dataDir = "/var/db/mysql";
    };

    longview.mysqlPassword = "nixnixnix";

  };
}
