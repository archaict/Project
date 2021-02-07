{ config, lib, usr, pkgs, flake, ... }:

{
  programs.emacs.init.usePackage = {

    which-key = {
      enable = true;
      after = [ "evil" ];
      config = ''
        (which-key-mode)
        (which-key-setup-side-window-bottom)
        (setq which-key-sort-order 'which-key-key-order-alpha
              which-key-idle-delay 0.01)   
      '';
    };

    general = {
      enable = true;
      demand = true;
      after = [ "evil" ];
      config = ''
        (general-evil-setup)
        (general-nmap
          ";" 'evil-ex
          ":" 'evil-repeat-find-char)

        (general-create-definer anomaly/leader-keys
          :keymaps '(normal insert visual emacs)
          ;;  If Error(insert this in your evil mode)
          ;;  (evil-set-initial-state 'messages-buffer-mode 'normal)
          ;;  (evil-set-initial-state 'dashboard-mode 'normal))
          :prefix "SPC" ;(define
          :global-prefix "C-SPC")

        (anomaly/leader-keys

          ":" '(execute-extended-command :which-key "Em-x")
          "<SPC>" '(execute-extended-command :which-key "Em-x")

          "b" '(:ignore t :which-key "Buffers")
          "br" '(find-alternate-file :which-key "Refresh Buffer")
          "bs" '(switch-to-buffer :which-key "Switch Buffer")

          "e" '(:ignore t :which-key "Emacs")
          "ee" '(org-ctrl-c-ctrl-c :which-key "Ex-c")
          "ev" '(eval-buffer :which-key "Evaluate Buffer")
          "ew" '(eval-last-sexp :which-key "Ex-sexp")

          "f" '(:ignore t :which-key "Files")
          "ff" '(find-file :which-key "Find File")

          "h" '(:ignore t :which-key "Help")
          "hv" '(counsel-describe-variable :which-key "Describe Variable")

          "m" '(:ignore t :which-key "Manage")
          "mt" '(org-todo :which-key "Org Todo")
          "mq" '(org-set-tags-command :which-key "Tags")

          "n" '(:ignore t :which-key "New")
          "njj" '(org-journal-new-entry :which-key "Org Todo")

          "o" '(:ignore t :which-key "Open")
          "oAa" '(org-agenda :which-key "Agenda")
          "oAt" '(org-todo-list :which-key "Todo List")

          "t" '(:ignore t :which-key "Toggles")
          "tt" '(load-theme :which-key "Toggle Theme")

          "w" '(:ignore t :which-key "Windows")
          "wl" '(evil-window-next :which-key "Win-Next")
          "wh" '(evil-window-prev :which-key "Win-Previous")
          "ws" '(evil-window-split :which-key "Horizontal Split")
          "wo" '(delete-other-windows :which-key "Win-Previous")
          "wv" '(split-window-right :which-key "Vertical Split")

          "sc" '(hydra-text-scale/body :which-key "Scale Text"))



      '';
    };
  };
}
