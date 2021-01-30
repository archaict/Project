{ config, pkgs, lib, ... }:

{
  programs.mpv = {
    enable = true;
    bindings = {

      w = "add volume 2";
      s = "add volume -2";

      a = "seek -5";
      d = "seek 5";

      h = "seek -5";
      j = "seek -10";
      k = "seek 10";
      l = "seek 5";

      e = "cycle pause";
    };
  };
}

