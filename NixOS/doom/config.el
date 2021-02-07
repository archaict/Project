;;(add-to-list 'company-backends 'company-nixos-options)

(map! :leader
      :desc "Tangle current file" "c t"   #'org-babel-tangle

      :desc "Tangle current file" "t t"   #'org-babel-tangle
      :desc "Toggle Highlight"    "t h"   #'hl-todo-mode

      :desc "Toggle command log mode" "t c m" #'command-log-mode
      :desc "Show command log buffer" "t c l" #'clm/toggle-command-log-buffer)

(map! :leader
      (:prefix-map ("T" . "Text")
        :desc "List - Lorem Ipsum" "l" #'lorem-ipsum-insert-list
        :desc "Sentences - Lorem Ipsum" "s" #'lorem-ipsum-insert-sentences
        :desc "Paragraphs - Lorem Ipsum" "p" #'lorem-ipsum-insert-paragraphs))

(map! :leader
      (:prefix-map ("N" . "NixOS")
        :desc "NixOS Options" "h" #'helm-nixos-options))

(evil-better-visual-line-on)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "J") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "K") 'evil-scroll-up)

(set-window-margins nil 2)
(setq doom-font (font-spec :family "Iosevka" :size 15)
      doom-variable-pitch-font (font-spec :family "Iosevka" :size 15)
      doom-big-font (font-spec :family "Iosevka" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(when (file-exists-p "~/.doom.d/banner")
  (setq +doom-dashboard-banner-padding '(2 . 2)
        +doom-dashboard-banner-file "arkiv.png"
        +doom-dashboard-banner-dir "~/.doom.d/banner"))

(setq doom-modeline-enable-word-count nil)
;;(set-face-attribute 'header-line nil  :height 36)
(setq-default header-line-format "   Archive-Code // 01-Ark // %b")

;;(add-to-list 'load-path "~/.emacs.d/.local/straight/build-27.1/eaf")

;; (setq projectile-mode-line "Projectile")
;; (setq projectile-track-known-projects-automatically 'nil)

(require 'fast-scroll)
(fast-scroll-config)
(fast-scroll-mode 1)
(setq fast-but-imprecise-scrolling 't)
(setq jit-lock-defer-time 0)
(setq display-line-numbers-type nil)
(setq doom-theme 'doom-tomorrow-night)
;;(setq doom-theme 'doom-nord-light)
(setq doom-modeline-enable-word-count nil)

(after! gcmh
  (setq gcmh-high-cons-threshold 33554432))

(provide 'config)

(setq company-idle-delay 0)
(setq company-tooltip-limit 6)
(setq company-dabbrev-downcase nil)
(setq company-minimum-prefix-length 1)
(setq company-dabbrev-ignore-case nil)
(setq company-selection-wrap-around t)
(setq company-selection-default 0)

(setq org-hide-emphasis-markers t)
(setq org-ellipsis " ")

;; Company mode
(defun trigger-org-company-complete () (interactive)
  (if (string-equa(setq org-hide-emphasis-markers t))))

(setq org-ellipsis " ")

;; Company mode
(defun trigger-org-company-complete ()
  (interactive)
  (if (string-equal "#" (string (preceding-char)))
    (progn
      (insert "+")
      (company-complete))
    (insert "+")))

(eval-after-load 'org '(define-key org-mode-map
               (kbd "+") 'trigger-org-company-complete))

(setq org-bullets-bullet-list '("⚛" "⁜" "⚜" "⛬"))

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(global-hl-todo-mode 1)
(global-hi-lock-mode 1)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'org-mode-hook (lambda () (hl-todo-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook
          '(lambda ()
             (add-hook 'write-contents-functions
                       'delete-trailing-whitespace)))

;;(add-hook 'fast-scroll-start-hook (lambda () (flycheck-mode -1)))
;;(add-hook 'fast-scroll-end-hook (lambda () (flycheck-mode 1)))
