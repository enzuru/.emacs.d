
;;; Code:

(deftheme airline-night_owl
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#282C34") (normal-outer-background   "#83DCC8")
      (normal-inner-foreground   "#282C34") (normal-inner-background   "#68b0a0")
      (normal-center-foreground  "#83DCC8") (normal-center-background  "#282C34")

      (insert-outer-foreground   "#282C34") (insert-outer-background   "#AFD75F")
      (insert-inner-foreground   "#282C34") (insert-inner-background   "#8cac4c")
      (insert-center-foreground  "#AFD75F") (insert-center-background  "#282C34")

      (visual-outer-foreground   "#282C34") (visual-outer-background   "#81AAFF")
      (visual-inner-foreground   "#282C34") (visual-inner-background   "#6788cc")
      (visual-center-foreground  "#81AAFF") (visual-center-background  "#282C34")

      (replace-outer-foreground  "#282C34") (replace-outer-background  "#FFD787")
      (replace-inner-foreground  "#282C34") (replace-inner-background  "#ccac6c")
      (replace-center-foreground "#FFD787") (replace-center-background "#282C34")

      (emacs-outer-foreground    "#282C34") (emacs-outer-background    "#83DCC8")
      (emacs-inner-foreground    "#282C34") (emacs-inner-background    "#68b0a0")
      (emacs-center-foreground   "#83DCC8") (emacs-center-background   "#282C34")

      (inactive1-foreground      "#282C34") (inactive1-background      "#C792EA")
      (inactive2-foreground      "#C792EA") (inactive2-background      "#282C34")
      (inactive3-foreground      "#C792EA") (inactive3-background      "#282C34"))

  (airline-themes-set-deftheme 'airline-night_owl)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-night_owl)
;;; airline-night_owl-theme.el ends here
