{pkgs}:

(pkgs.emacsPackagesNgGen pkgs.emacsGcc).emacsWithPackages
  (epkgs: with epkgs; [
    vterm
  ])
