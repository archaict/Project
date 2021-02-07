;;; config.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021
;;
;; Author:  <http://github/archaict>
;; Maintainer:  <archaict@nixos>
;; Created: February 06, 2021
;; Modified: February 06, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/archaict/config
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(provide 'config)

;; FAST SCROLL
(require 'fast-scroll)
;; If you would like to turn on/off other modes, like flycheck, add
;; your own hooks.
;; (add-hook 'fast-scroll-start-hook (lambda () (flycheck-mode -1)))
;; (add-hook 'fast-scroll-end-hook (lambda () (flycheck-mode 1)))
(fast-scroll-config)
(fast-scroll-mode 1)
(setq fast-but-imprecise-scrolling 't)
(setq jit-lock-defer-time 0)
(setq display-line-numbers-type 'relative)
(setq doom-theme 'doom-tomorrow-night)
(setq doom-modeline-enable-word-count nil)
;;(setq projectile-mode-line "Projectile")
(add-hook 'find-file-hook
          (lambda ()
            (when (file-remote-p default-directory)
              (setq-local projectile-mode-line "Projectile"))))

;; MODELINE
(setq doom-modeline-enable-word-count nil)
;;; config.el ends here
