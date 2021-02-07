{ config, pkgs, lib, ... }:

{

  programs.emacs.init.usePackage = {
    # START OF PACKAGES

    counsel = {
      enable = true;
    };

    # END OF PACKAGES
  };
}


