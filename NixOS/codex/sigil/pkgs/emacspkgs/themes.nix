{ config, lib, usr, pkgs, flake, ... }:

{
  programs.emacs.init.usePackage = {
    doom-themes = {
      enable = true;
      config = ''
        (load-theme 'doom-nord t) 
        (doom-themes-org-config)
      '';
    };

    doom-modeline = {
      enable = true;
      demand = true;
      after = [ "doom-themes" ];
      config = ''
        (doom-modeline-mode 1)
      '';
    };

    all-the-icons = {
      enable = true;
    };

  };
}
