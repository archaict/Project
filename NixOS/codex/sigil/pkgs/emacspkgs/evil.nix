{ config, pkgs, lib, ... }:

{
  programs.emacs.init.usePackage ={

    evil ={
      enable = true;
      demand = true;
      diminish = [ "undo-tree-mode" ];
      config = ''
        (setq evil-default-cursor (quote (t "#D75F5F"))
            evil-visual-state-cursor '("#D75F5F" box)
            evil-insert-state-cursor '("#B8BB26" box)
            evil-normal-state-cursor '("#98B8CC" box))
     ;; (evil-set-initial-state 'weechat-mode 'emacs)
     ;; (evil-set-initial-state 'exwm-mode 'emacs)
     ;; (evil-set-initial-state 'eshell-mode 'emacs)
     ;; (evil-set-initial-state 'term-mode 'emacs)
     ;; (evil-set-initial-state 'vterm-mode 'emacs)
     ;; (evil-set-initial-state 'dashboard-mode 'emacs)
     ;; (evil-set-initial-state 'magit-mode 'insert)
     ;; (evil-set-initial-state 'magit-log-edit-mode 'insert)
     ;; (add-hook 'git-commit-mode-hook 'evil-insert-state)
        (evil-mode 1)

        ;; Override :q to kill buffer only
        (evil-define-command evil-quit (&optional force)
          "Close the current buffer (Overridden)."
          :repeat nil
          (interactive "<!>")
          (kill-buffer))
        (setq evil-undo-system 'undo-tree)

        ;; EVIL VISUAL
        (evil-global-set-key 'motion "j" 'evil-next-visual-line)
        (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

     ;; (evil-global-set-key 'motion "p" 'paste-from-clipboard)
     ;; (evil-global-set-key 'motion "y" 'copy-to-clipboard)
      '';
    };

    undo-tree ={
      enable = true;
      demand = true;
      after = [ "evil" ];
      config = ''
        (global-undo-tree-mode)
        (evil-set-undo-system 'undo-tree)
     ;; (setq undo-tree-enable-undo-in-region nil)
      '';
    };

    evil-surround ={
      enable = true;
      demand = true;
      after = [ "evil" ];
      config = ''
        (global-evil-surround-mode 1)
        (dolist (hook '(prog-mode-hook
                        text-mode-hook))
          (add-hook hook (lambda ()
                           (push '(?* . ("*" . "*")) evil-surround-pairs-alist)
                           (push '(?/ . ("/" . "/")) evil-surround-pairs-alist))))
      '';
    };

  };
}
