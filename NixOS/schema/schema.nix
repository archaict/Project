{ lib, ... }:

with lib;

{
  options.colors =
    let
      mkColorOption = name: {
        inherit name;
        value = mkOption {
          type = types.strMatching "#[a-fA-F0-9]{6}";
          description = "Color ${name}.";
        };
      };
    in
      listToAttrs (map mkColorOption [

        "black" "black_dark"
        "grey"  "grey_dark"
        "white" "white_dark"

        "red"
        "green"
        "yellow"
        "blue"
        "magenta"
        "cyan"
        "orange"

        "red_dark"
        "green_dark"
        "yellow_dark"
        "blue_dark"
        "magenta_dark"
        "cyan_dark"


        "background_dark"
        "foreground_dark"
        "cursorColor_dark"
      ]);


  options.vimcolors =
    let
      mkVimColorOption = name: {
        inherit name;
        value = mkOption {
          type = types.str;
          description = "VimColor ${name}.";
        };
      };
    in
      listToAttrs (map mkVimColorOption [
        "color_scheme" "background"
      ]);


  options.schema =
    let
      mkFontsOption = name: {
        inherit name;
        value = mkOption {
          type = types.str;
          description = "Fonts ${name}.";
        };
      };
    in
      listToAttrs (map mkFontsOption [
        "font"
      ]);
}
