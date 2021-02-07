{ config, lib, usr, pkgs, flake, ... }:

{
  programs.emacs.init.usePackage = {
    hydra = {
      enable = true;
      config = ''
        (defhydra hydra-text-scale (:timeout 4)
          ("k" text-scale-increase "increase text")
          ("j" text-scale-decrease "decrease text")
          ("f" nil "finished" :exit t))
      '';
    };

    ivy = {
      enable = true;
      config = ''
        (ivy-mode 1)
      '';
    };

    rainbow-delimiters = {
      enable = true;
      config = ''
      '';
    };

    autopair = {
      enable = true;
      config = ''
        (autopair-global-mode)
      '';
    };
    
    restart-emacs = {
      enable = true;
    };
    
    exwm = {
      enable = true;
      demand = true;
    };

  };
}
