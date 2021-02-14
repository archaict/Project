
# Table of Contents

1.  [DOOM](#org1e64cea)
    1.  [Installation](#org0bf8c43)
    2.  [Restore Configurations](#org3cd0b3f)
    3.  [Scratch Mode](#orgc557681)
    4.  [Provide Config File](#orgd6435ef)
2.  [Repair](#org68b43f8)
    1.  [Projectile](#org3cfc730)
    2.  [Fast Scroll](#orgba8feb6)
    3.  [Garbage Collection](#org7afffa0)
3.  [NixOS](#org87fa21c)
4.  [Bindings](#orge2f97aa)
    1.  [MODE](#org5b8ed61)
    2.  [TEXT](#org04b6139)
    3.  [EVIL](#org02ac1ea)
5.  [Interface](#org96422a8)
    1.  [Fonts](#orged3697d)
    2.  [Modeline](#orgfe12fa7)
    3.  [Centaur Tabs](#org4fbd56e)
    4.  [Command Line](#org5faeac6)
6.  [Extra Packages](#org2bf35eb)
    1.  [Company install](#orgaf9fb51)
    2.  [Figlet](#org48bf6e8)
    3.  [Yasnippet](#org2939926)
7.  [Mode](#org064947d)
    1.  [ORG](#orga737268)
        1.  [Prettify](#org023f1ea)
        2.  [Bullets](#org55f49cf)
        3.  [Company](#org2d63d7d)
    2.  [HIGHLIGHT](#org1068b8d)
8.  [Functions](#org4279a04)
9.  [Hooks](#org6337d1c)
    1.  [INIT Hooks](#org69750d0)
    2.  [ORG Hooks](#orgcf9a233)
    3.  [OTHER Hooks](#org028c5d8)
10. [Globals](#org47bc139)
11. [Defaults](#org0cd4501)

**EMACS CONFIGURATIONS:**
This is all configurations for church of emacs.


<a id="org1e64cea"></a>

# DOOM


<a id="org0bf8c43"></a>

## Installation

To install Doom Emacs you can use this command:

    $ git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    $ ~/.emacs.d/bin/doom install

You might want to create an alias like this:

    alias doom='~/.emacs.d/bin/doom'


<a id="org3cd0b3f"></a>

## Restore Configurations

This is to restore Doom Emacs configurations:

    DOOM=$HOME/Project/NixOS/
    ln -sf $DOOM/doom/ ~/.doom.d


<a id="orgc557681"></a>

## Scratch Mode

This is to restore Doom Emacs configurations:

    (setq doom-scratch-initial-major-mode 'org-mode)


<a id="orgd6435ef"></a>

## Provide Config File

Provide this config file to be used in `init.el`

    (provide 'config)


<a id="org68b43f8"></a>

# Repair

Some utilities to repair this doom that has been lingering since..


<a id="org3cfc730"></a>

## Projectile

    ;; (setq projectile-mode-line "Projectile")
    ;; (setq projectile-track-known-projects-automatically 'nil)


<a id="orgba8feb6"></a>

## TODO Fast Scroll

    ;; (require 'fast-scroll)
    ;; (fast-scroll-config)
    ;; (fast-scroll-mode 1)
    
    (setq fast-but-imprecise-scrolling 't)
    (setq jit-lock-defer-time 0)
    (setq display-line-numbers-type nil)
    (setq doom-theme 'doom-tomorrow-night)
    ;;(setq doom-theme 'doom-nord-light)
    (setq doom-modeline-enable-word-count nil)


<a id="org7afffa0"></a>

## Garbage Collection

Sometimes it is useful to collect your garbage.

    (after! gcmh
      (setq gcmh-high-cons-threshold 33554432))


<a id="org87fa21c"></a>

# NixOS

Lifehacks for NixOS options and stuffs.

    ;;(add-to-list 'company-backends 'company-nixos-options)


<a id="orge2f97aa"></a>

# Bindings

This bind your <del>yourself</del> keys to doom emacs configs.

    (map! :leader
          :desc "Tangle current file" "c t"   #'org-babel-tangle
          :desc "Tangle current file" "t t"   #'org-babel-tangle
    
          :desc "Highlight"    "t h"   #'hl-todo-mode
          :desc "Time"    "t T"   #'display-time
    
          :desc "Dired" "o d"   #'dired-jump
    
          :desc "Run code" "t c c" #'org-ctrl-c-ctrl-c
          :desc "Toggle command log mode" "t c m" #'command-log-mode
          :desc "Show command log buffer" "t c l" #'clm/toggle-command-log-buffer
    
          :desc "Terminal buffer" "o T" #'vterm
          )
    
    (map! :leader
          (:prefix-map ("N" . "NixOS")
            :desc "NixOS Options" "h" #'helm-nixos-options))


<a id="org5b8ed61"></a>

## MODE

    (map! :leader
          (:prefix-map ("M" . "mode")
    
            :desc "Shell" "s" #'shell-script-mode))


<a id="org04b6139"></a>

## TEXT

    (map! :leader
          (:prefix-map ("T" . "Text")
    
            :desc "Figlet Border" "f b" #'figlet-border
            :desc "Figlet Future" "f f" #'figlet-future
            :desc "Figlet Pagga"  "f p" #'figlet-pagga
            :desc "Figlet Small"  "f s" #'figlet-small
            :desc "Figlet Future Border" "f F" #'figlet-future-border
    
            :desc "List - Lorem Ipsum" "l" #'lorem-ipsum-insert-list
            :desc "Sentences - Lorem Ipsum" "s" #'lorem-ipsum-insert-sentences
            :desc "Paragraphs - Lorem Ipsum" "p" #'lorem-ipsum-insert-paragraphs))


<a id="org02ac1ea"></a>

## EVIL

    (evil-better-visual-line-on)
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
    (define-key evil-normal-state-map (kbd "J") 'evil-scroll-down)
    (define-key evil-normal-state-map (kbd "K") 'evil-scroll-up)
    (map! (:after dired
           :map dired-mode-map
           :n "H" #'dired-up-directory
           :n "L" #'dired-find-file
           :n "<backspace>" #'dired-up-directory)
          )


<a id="org96422a8"></a>

# Interface

All eye-candy configurations from yours truly.


<a id="orged3697d"></a>

## Fonts

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


<a id="orgfe12fa7"></a>

## Modeline

    (setq doom-modeline-enable-word-count nil)
    ;;(set-face-attribute 'header-line nil  :height 36)
    (setq-default header-line-format "   Archive-Code // 01-Ark // %M")
    (setq display-time-mode 1)


<a id="org4fbd56e"></a>

## Centaur Tabs

    (setq centaur-tabs-set-bar 'over
          centaur-tabs-set-icons t
          centaur-tabs-gray-out-icons 'buffer
          centaur-tabs-height 18
          centaur-tabs-set-modified-marker t
          centaur-tabs-style "bar"
          centaur-tabs-modified-marker "•")
    (map! :leader
          :desc "Toggle tabs on/off"
          "t c" #'centaur-tabs-local-mode)
    (evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
                                                   (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
                                                   (kbd "g <down>")  'centaur-tabs-forward-group
                                                   (kbd "g <up>")    'centaur-tabs-backward-group)


<a id="org5faeac6"></a>

## Command Line


<a id="org2bf35eb"></a>

# Extra Packages

    ;; NIXOS
    ;;(package! nixos-options)
    ;;(package! helm-nixos-options)
    ;;(package! company-nixos-options)
    
    ;; WINDOW MANAGER
    ;;(package! exwm)
    
    ;; OTHERS
    ;;(package! origami)
    
    (package! fast-scroll)
    (package! lorem-ipsum)
    (package! org-bullets)
    (package! figlet)
    
    (package! zen-mode)
    (package! command-log-mode)
    
    (package! doom-themes)
    (package! evil-better-visual-line)
    (provide 'packages)


<a id="orgaf9fb51"></a>

## Company install

    (setq company-idle-delay 0)
    (setq company-tooltip-limit 6)
    (setq company-dabbrev-downcase nil)
    (setq company-minimum-prefix-length 1)
    (setq company-dabbrev-ignore-case nil)
    (setq company-selection-wrap-around t)
    (setq company-selection-default 0)


<a id="org48bf6e8"></a>

## Figlet

    (defun figlet-border (&optional b e)
      (interactive "r")
      (shell-command-on-region b e "toilet -w 200 -f term -F border" (current-buffer) t))
    
    (defun figlet-future (&optional b e)
      (interactive "r")
      (shell-command-on-region b e "toilet -w 200 -f future" (current-buffer) t))
    
    (defun figlet-future-border (&optional b e)
      (interactive "r")
      (shell-command-on-region b e "toilet -w 200 -f future -F border" (current-buffer) t))
    
    (defun figlet-pagga (&optional b e)
      (interactive "r")
      (shell-command-on-region b e "toilet -w 200 -f pagga -F border" (current-buffer) t))
    
    (defun figlet-small (&optional b e)
      (interactive "r")
      (shell-command-on-region b e "figlet -f small" (current-buffer) t))


<a id="org2939926"></a>

## Yasnippet

Personal snippets location

    (setq yas-snippet-dirs '("~/Project/NixOS/doom/snippets"))


<a id="org064947d"></a>

# Mode

Configurations of every Emacs mode.


<a id="orga737268"></a>

## ORG

    (setq org-ellipsis " ")
    (setq org-hide-emphasis-markers t)
    
    ;; (eval-after-load 'org '(define-key org-mode-map
    ;;                (kbd "+") 'trigger-org-company-complete))
    
    (custom-set-faces
      '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
      '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
      '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
      '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
      '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))


<a id="org023f1ea"></a>

### Prettify

    ;; Hook in HOOKS FOREVER
    (prettify-symbols-mode t)
    (global-prettify-symbols-mode t)


<a id="org55f49cf"></a>

### Bullets

    (setq org-bullets-bullet-list '("⚛" "⁜" "⚜" "⛬"))


<a id="org2d63d7d"></a>

### Company

    ;; Company mode
    (defun trigger-org-company-complete ()
      (interactive)
      (if (string-equal "#" (string (preceding-char)))
        (progn
          (insert "+")
          (company-complete))
        (insert "+")))
    
    (defun trigger-org-company-complete () (interactive)
      (if (string-equa(setq org-hide-emphasis-markers t))))


<a id="org1068b8d"></a>

## HIGHLIGHT

    ;;(setq hl-todo-keyword-faces
    ;;    '(("TITLE"   . "#EBCB8B")
    ;;      ("SUBS"    . "#1E90FF")))
    
    (setq hl-todo-keyword-faces
          '(("HOLD"   . "#d0bf8f")
            ("TODO"   . "#cc9393")
            ("NEXT"   . "#dca3a3")
            ("THEM"   . "#dc8cc3")
            ("PROG"   . "#7cb8bb")
            ("OKAY"   . "#7cb8bb")
            ("DONT"   . "#5f7f5f")
            ("FAIL"   . "#8c5353")
            ("DONE"   . "#afd8af")
            ("NOTE"   . "#d0bf8f")
            ("KLUDGE" . "#d0bf8f")
            ("HACK"   . "#d0bf8f")
            ("TEMP"   . "#d0bf8f")
            ("FIXME"  . "#cc9393")
            ("XXX+"   . "#cc9393")))


<a id="org4279a04"></a>

# Functions

    (defun arc/make-tangled-files-executable ()
      (set-file-modes (buffer-file-name) #o755))
    (add-hook 'org-babel-post-tangle-hook 'arc/make-tangled-files-executable)

    (defun arc-syntax-color-hex ()
      (interactive)
      (font-lock-add-keywords
       nil
       '(("#[[:xdigit:]]\\{3\\}"
          (0 (put-text-property
              (match-beginning 0)
              (match-end 0)
              'face (list :background
                          (let* (
                                 (ms (match-string-no-properties 0))
                                 (r (substring ms 1 2))
                                 (g (substring ms 2 3))
                                 (b (substring ms 3 4)))
                            (concat "#" r r g g b b))))))
         ("#[[:xdigit:]]\\{6\\}"
          (0 (put-text-property
              (match-beginning 0)
              (match-end 0)
              'face (list :background (match-string-no-properties 0)))))))
      (font-lock-flush))


<a id="org6337d1c"></a>

# Hooks

Add-Hook to your emacs


<a id="org69750d0"></a>

## INIT Hooks

    (add-hook 'after-init-hook 'global-company-mode)
    (add-hook 'after-init-hook 'display-time-mode)
    (add-hook 'after-init-hook(lambda ()(setq indent-tabs-mode nil)))
    (add-hook 'after-init-hook(lambda ()(setq tab-width 2)))
    (add-hook 'after-init-hook(lambda ()(setq evil-shift-width 2)))


<a id="orgcf9a233"></a>

## ORG Hooks

    (add-hook 'org-mode-hook (lambda () (hl-todo-mode 1)))
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    (add-hook 'org-mode-hook ;; Prettify Symbols
              (lambda ()
                (push '("#+begin_src" . "λ") prettify-symbols-alist)
                (push '("#+end_src" . "λ") prettify-symbols-alist)))
    (add-hook 'org-mode-hook
              '(lambda ()
                 (add-hook 'write-contents-functions
                           'delete-trailing-whitespace)))


<a id="org028c5d8"></a>

## OTHER Hooks

    (add-hook 'fast-scroll-start-hook (lambda () (flycheck-mode -1)))
    (add-hook 'fast-scroll-end-hook (lambda () (flycheck-mode 1)))
    (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
    (add-hook 'css-mode-hook 'arc-syntax-color-hex)
    (add-hook 'php-mode-hook 'arc-syntax-color-hex)
    (add-hook 'html-mode-hook 'arc-syntax-color-hex)


<a id="org47bc139"></a>

# Globals

International variables on emacs.

    (global-hl-todo-mode 1)
    (global-hi-lock-mode 1)


<a id="org0cd4501"></a>

# Defaults

    (setq figlet-default-font "Future")

