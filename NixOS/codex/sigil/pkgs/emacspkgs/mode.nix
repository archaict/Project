{ config, lib, usr, pkgs, flake, ... }:

{
  programs.emacs.init.usePackage = {
    
    nix-mode = {
      enable = true;
    };
  
    org ={
      enable = true;
      config = ''
        (setq org-log-done 'time)
     ;; (setq org-agenda-files '("~/archaict"))
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

    toc-org = {
      enable = true;
    };

  };
}
