
;;; Code:

(deftheme airline-fruit_punch
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#303030") (normal-outer-background   "#f29db4")
      (normal-inner-foreground   "#b2b2b2") (normal-inner-background   "#3a3a3a")
      (normal-center-foreground  "#f29db4") (normal-center-background  "#444444")

      (insert-outer-foreground   "#303030") (insert-outer-background   "#fce78d")
      (insert-inner-foreground   "#b2b2b2") (insert-inner-background   "#3a3a3a")
      (insert-center-foreground  "#fce78d") (insert-center-background  "#444444")

      (visual-outer-foreground   "#303030") (visual-outer-background   "#79e5e0")
      (visual-inner-foreground   "#b2b2b2") (visual-inner-background   "#3a3a3a")
      (visual-center-foreground  "#79e5e0") (visual-center-background  "#444444")

      (replace-outer-foreground  "#303030") (replace-outer-background  "#f97070")
      (replace-inner-foreground  "#b2b2b2") (replace-inner-background  "#3a3a3a")
      (replace-center-foreground "#f97070") (replace-center-background "#444444")

      (emacs-outer-foreground    "#303030") (emacs-outer-background    "#f29db4")
      (emacs-inner-foreground    "#b2b2b2") (emacs-inner-background    "#3a3a3a")
      (emacs-center-foreground   "#f29db4") (emacs-center-background   "#444444")

      (inactive1-foreground      "#b2b2b2") (inactive1-background      "#444444")
      (inactive2-foreground      "#b2b2b2") (inactive2-background      "#444444")
      (inactive3-foreground      "#b2b2b2") (inactive3-background      "#444444"))

  (airline-themes-set-deftheme 'airline-fruit_punch)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-fruit_punch)
;;; airline-fruit_punch-theme.el ends here
