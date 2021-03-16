;; NIXOS
;;(package! nixos-options)
;;(package! helm-nixos-options)
;;(package! company-nixos-options)

;; MAJOR MODE
(package! zen-mode)
(package! command-log-mode)
(package! xwwp)

;; TEXT MODE
;;(package! perfect-margin)
(package! lorem-ipsum)
(package! org-bullets)
(package! figlet)

;; PRESENTATION
(package! ox-reveal)
(package! org-tree-slide)

(package! openwith)
;; Language

;; ORG
(package! ox-pandoc)

(package! fast-scroll)
;; (package! origami)

(package! doom-themes)

(package! evil-better-visual-line)
(provide 'packages)

(package! exwm-outer-gaps
  :recipe
  (:host github
   :repo "lucasgruss/exwm-outer-gaps"))

(package! github-search)

(package! exwm)
(package! wallpaper)
;; (package! edwina)
