{ config, pkgs, lib, ... }:

{
  hardware.pulseaudio = {
    package = pkgs.pulseaudioFull;
    extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  };

  services.mpd = {
    enable = true;
    user = "archaict";
    group = "users";
    dataDir = "/home/archaict/.config/mpd";
    musicDirectory = "/home/archaict/Music";
    extraConfig = ''
      audio_output {
        type "fifo"
        name "FIFO"
        path "/tmp/mpd.fifo"
        format "44100:16:1"
      }
      audio_output {
        type "pulse"
        name "pulseaudio"
        server "127.0.0.1"
      }
    '';
  };
}
