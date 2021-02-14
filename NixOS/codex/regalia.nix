{ config, pkgs, lib, ... }:

let

  myemacs = import ./epkgs.nix {pkgs=pkgs;};

in

{

  xsession = {
    enable = true;
    windowManager.command = ''
                           ${myemacs}/bin/emacs --daemon -f exwm-enable
                           exec ${myemacs}/bin/emacsclient -c
    '';
  };
}
