{ config, pkgs, lib, ... }:

{
  services.picom = {
    enable =true;
    package = pkgs.picom.overrideAttrs(o: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "jonaburg";
        rev = "a8445684fe18946604848efb73ace9457b29bf80";
        sha256 = "154s67p3lxdv9is3lnc32j48p7v9n18ga1j8ln1dxcnb38c19rj7";
      };
     });
#     package = pkgs.picom.overrideAttrs(o: {
#       src = pkgs.fetchFromGitHub {
#         repo = "picom";
#         owner = "ibhagwan";
#         rev = "44b4970f70d6b23759a61a2b94d9bfb4351b41b1";
#         sha256 = "0iff4bwpc00xbjad0m000midslgx12aihs33mdvfckr75r114ylh";
#       };
#     });

    activeOpacity = "1.0";
    blur = true;
    blurExclude = [
      "class_g = 'slop'"
    ];
    extraOptions = ''
      corner-radius = 5;
      blur-method = "dual_kawase";
      blur-strength = "5";
      xinerama-shadow-crop = true;

      rounded-corners-exclude = [
        "class_g = 'Polybar'",
      ];
    '';
    experimentalBackends = true;

    shadow = true;
  # shadowOffsets = [ ( -17 ) ( -17 ) ];
    shadowOffsets = [ ( -15 ) ( -15 ) ];
    shadowOpacity = "0.1";
    noDNDShadow = true;
    noDockShadow = true;
    shadowExclude = [
      "bounding_shaped && !rounded_corners"
    ];

    fade = true;
    fadeDelta = 5;

    vSync = true;
    opacityRule = [
      "100:class_g   *?= 'Chromium-browser'"
      "90:class_g   *?= 'Kitty'"
      "100:class_g   *?= 'Firefox'"
      "100:class_g   *?= 'Zathura'"
    ];
  };
}
