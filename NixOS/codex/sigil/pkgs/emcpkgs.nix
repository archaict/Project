{ config, pkgs, lib, ... }:

{

  programs.emacs.init.usePackage = {
    # START OF PACKAGES

    doom-themes = {
      enable = true;
      config = ''
        (load-theme 'doom-nord-light t) 
        (doom-themes-org-config)
      '';
    };

    evil = {
      enable = true;
      init = ''
        (setq evil-search-module 'evil-search)
        (setq evil-ex-complete-emacs-commands nil)
        (setq evil-vsplit-window-right t)
        (setq evil-split-window-below t)
        (setq evil-shift-round nil)
        (setq evil-want-C-u-scroll t)
        (setq evil-want-Y-yank-to-eol t)
        (setq evil-want-integration nil)
        (setq evil-want-keybinding' nil)
        '';
      config = ''
        (define-key evil-normal-state-map [backspace] 
          'evil-switch-to-windows-last-buffer)
        (evil-set-initial-state 'term-mode 'emacs)
        (evil-mode)
        (global-undo-tree-mode)
        (evil-set-undo-system 'undo-tree)
        '';
      };

      undo-tree = {
        enable = true;
      };


    which-key = {
      enable = true;
      config = ''
        (which-key-mode)
        (which-key-setup-side-window-bottom)
        (setq which-key-sort-order 'which-key-key-order-alpha
              which-key-idle-delay 0.01)   
      '';
    };

    general = {
      enable = true;
      after = [ "evil" "which-key" ];
      config = ''
        (general-evil-setup)
        (general-nmap
          ";" 'evil-ex
          ":" 'evil-repeat-find-char)
        (general-nmap
          "J" 'evil-window-down
          "K" 'evil-window-up
       ;; "u" 'undo-tree undo
       ;; "C-r" 'undo-tree redo
          "C-]" 'dumb-jump-go
          "C-'" 'dumb-jump-go
          "C-t" 'dumb-jump-back
          "j" 'evil-next-visual-line
          "k" 'evil-previous-visual-line
          "C-/" 'evil-avy-goto-char-timer)
        (general-create-definer space-leader-def
          :prefix "SPC")
        (general-create-definer space-leader-mode-def
          :prefix "SPC m")
        (space-leader-def
          :states '(normal visual)
          :keymaps 'override
          "SPC" '(helm-M-x :which-key "M-x")
          "g" '(:ignore t :which-key "git")
          "g s" '(magit-status :which-key "magit")
          "g r" '(browse-at-remote :which-key "browse on forge")
          "g b" '(magit-blame :which-key "blame")
          "g f" '(magit-log-buffer-file "log for file")
        
          "b" '(:ignore t :which-key "buffer")
          "b b" '(helm-mini :which-key "list buffers")
          "b s" '(switch-to-scratch-buffer :which-key "scratch")
          "b k" '(kill-buffer :which-key "kill buffer")
          
          "f" '(:ignore t :which-key "files")
          "f f" '(helm-find-files :which-key "find")
          "f j" '(dired-jump :which-key "dired")
          "h" '(:ignore t :which-key "help")
          "h k" '(describe-key :which-key "describe key")
          "h f" '(describe-function :which-key "describe function")
          "h v" '(describe-variable :which-key "describe variable")
          "h i" '(info :which-key "info")
          "h b" '(describe-bindings :which-key "describe bindings")
          "h m" '(describe-mode :which-key "describe mode")
          "h w" '(which-key-show-top-level :which-key "which key top level")
          "p" '(:ignore t :which-key "project")
          "p f" '(helm-projectile-find-file :which-key "find file")
          "p p" '(helm-projectile-switch-project :which-key "switch to project")
          "p i" '(projectile-invalidate-cache :which-key "invalidate project cache")
          "l" '(:ignore t :which-key "lisp")
          "l s" '(eval-last-sexp :which-key "eval last sexp")
          "l e" '(eval-expression :which-key "eval expression")
          "l d" '(eval-defun :which-key "eval defun")
          "s" '(:ignore t :which-key "search")
          "s f" '(helm-do-ag :which-key "search in files")
          "s p" '(helm-do-ag-project-root :which-key "search in project")
          "s b" '(helm-do-ag-buffers :which-key "search in buffers")
          "s s" '(helm-swoop :which-key "swoop")
          "s m" '(helm-multi-swoop-projectile :which-key "multi swoop")
          "t" '(:ignore t :which-key "toggles/themes")
          "t t" '(helm-themes :which-key "select theme")
          "t n" '(global-linum-mode :which-key "toggle line numbers")
          "t r" '(treemacs :which-key "treemacs")
          "i" '(:ignore t :which-key "inflection")
          "i k" '(string-inflection-kebab-case :which-key "kebab-case")
          "i j" '(string-inflection-camelcase :which-key "CamelCase")
          "i c" '(string-inflection-lower-camelcase :which-key "lowerCamelCase")
          "i p" '(string-inflection-lower-camelcase :which-key "under_score")
          
          "c" '(:ignore t :which-key "comment")
          "c l" '(comment-region :which-key "comment region")
          "c u" '(uncomment-region :which-key "uncomment region"))
          "m" '(:ignore t :which-key "major-mode")
        (general-imap "j"
          (general-key-dispatch 'self-insert-command
            "k" 'evil-normal-state)
          "C-w" 'backward-kill-word)
      '';
    };

    org = {
      enable = true;
      config = ''
        (setq org-log-done 'time)
        (setq org-agenda-files '("~/archaict"))
        (setq org-tags-column -80)
        
        ;; (use-package org
        ;;   :config
        ;;   (setq org-ellipsis "  "))
        ;; (use-package org-bullets
        ;;   :after org
        ;;   :hook (org-mode . org-bullets-mode)
        ;;   :custom
        ;;   (org-bullets-bullet-list '("ꗝ" "⁖" "⁖" "⁖" "⁖" "⁖" )))
        
        ;; Priorities
        
        ;; (use-package org-fancy-priorities
        ;;   :ensure t
        ;;   :hook
        ;;   (org-mode . org-fancy-priorities-mode)
        ;;   :config
        ;;   (setq org-fancy-priorities-list '("HIGH" "MID" "LOW")))
        
        ;; Org-Mode
        
        (setq org-todo-keywords
              '((sequence
        	 "TODO(t)"
        	 "INPROGRESS(i)"
        	 "WAITING(w)"
        	 "|"
        	 "DONE(d)"
        	 "CANCELED(c)"
        	 )))
        
        (setq org-todo-keyword-faces
              '(
        	("TODO"       :foreground "#B8BB26" :background nil :weight bold)
        	("INPROGRESS" :foreground "#98B8CC" :background nil :weight bold)
        	("WAITING"    :foreground "#FABD2F" :background nil :weight bold)
        	("DONE"       :foreground "#C0ACA7" :background nil :weight bold)
        	("CANCELED"   :foreground "#D75F5F" :background nil :weight bold))
              org-fontify-done-headline t
              )
        
        (custom-set-faces
         '(org-headline-done
                    ((((class color) (min-colors 10) (background dark))
                      (:foreground "#C0ACA7" :strike-through t)))))
        
        
        (require 'org-tempo)
        (add-to-list 'org-structure-template-alist '("sh" . "src shell :results output"))
        (add-to-list 'org-structure-template-alist '("py" . "src python :results output"))
        (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp :results output"))
      '';
    };

    evil-collection = {
      enable = true;
      config = ''
        (evil-collection-init 'term)
        (evil-collection-init 'dired)
      '';
    };

    # END OF PACKAGES
  };
}


