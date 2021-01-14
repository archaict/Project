{ config, pkgs, lib, ... }:

{
  gtk ={
    enable = true;
    font.name = "${config.schema.font} Bold 10";
    iconTheme.name = "Numix";
    theme.name = "Matcha-dark-aliz";
    gtk2.extraConfig = ''
      LocationMode=path-bar;
      ShowHidden=false;
      ShowSizeColumn=true;
      GeometryX=294;
      GeometryY=81;
      GeometryWidth=780;
      GeometryHeight=585;
      SortColumn=name;
      SortOrder=ascending;
      StartupMode=recent;
    '';
    gtk3.extraConfig = {
      gtk-cursor-theme-size=0;
      gtk-button-images=0;
      gtk-menu-images=0;
      gtk-enable-event-sounds=1;
      gtk-enable-input-feedback-sounds=1;
      gtk-xft-antialias=1;
      gtk-xft-hinting=1;
    };
  };
}
