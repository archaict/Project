{ config, lib, usr, pkgs, flake, ... }:

{
  programs.emacs.init.usePackage = {
    dashboard = {
      enable = true;
      config = ''
        (dashboard-setup-startup-hook)
        (setq dashboard-banner-logo-title "ꗝ Anomaly  Archaict ꗝ")
        (setq dashboard-init-info "Anomaly")
        (setq dashboard-center-content t)
        (setq dashboard-set-file-icons t)
        (setq dashboard-startup-banner " ")
        (setq dashboard-items '((recents  . 10)
                                (bookmarks . 5)))
        (with-eval-after-load 'evil
          (evil-define-key 'normal dashboard-mode-map
            "g" 'dashboard-refresh-buffer))
      '';
    };
  };
}
