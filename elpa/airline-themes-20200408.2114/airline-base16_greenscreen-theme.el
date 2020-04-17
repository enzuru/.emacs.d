
;;; Code:

(deftheme airline-base16_greenscreen
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#003300") (normal-outer-background   "#00bb00")
      (normal-inner-foreground   "#00dd00") (normal-inner-background   "#005500")
      (normal-center-foreground  "#009900") (normal-center-background  "#003300")

      (insert-outer-foreground   "#003300") (insert-outer-background   "#009900")
      (insert-inner-foreground   "#00dd00") (insert-inner-background   "#005500")
      (insert-center-foreground  "#009900") (insert-center-background  "#003300")

      (visual-outer-foreground   "#003300") (visual-outer-background   "#00bb00")
      (visual-inner-foreground   "#00dd00") (visual-inner-background   "#005500")
      (visual-center-foreground  "#009900") (visual-center-background  "#003300")

      (replace-outer-foreground  "#003300") (replace-outer-background  "#007700")
      (replace-inner-foreground  "#00dd00") (replace-inner-background  "#005500")
      (replace-center-foreground "#009900") (replace-center-background "#003300")

      (emacs-outer-foreground    "#003300") (emacs-outer-background    "#00bb00")
      (emacs-inner-foreground    "#00dd00") (emacs-inner-background    "#005500")
      (emacs-center-foreground   "#009900") (emacs-center-background   "#003300")

      (inactive1-foreground      "#00bb00") (inactive1-background      "#003300")
      (inactive2-foreground      "#00bb00") (inactive2-background      "#003300")
      (inactive3-foreground      "#00bb00") (inactive3-background      "#003300"))

  (airline-themes-set-deftheme 'airline-base16_greenscreen)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_greenscreen)
;;; airline-base16_greenscreen-theme.el ends here
