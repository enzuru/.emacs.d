
;;; Code:

(deftheme airline-bubblegum
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#303030") (normal-outer-background   "#afd787")
      (normal-inner-foreground   "#b2b2b2") (normal-inner-background   "#3a3a3a")
      (normal-center-foreground  "#afd787") (normal-center-background  "#444444")

      (insert-outer-foreground   "#444444") (insert-outer-background   "#87afd7")
      (insert-inner-foreground   "#b2b2b2") (insert-inner-background   "#3a3a3a")
      (insert-center-foreground  "#87afd7") (insert-center-background  "#444444")

      (visual-outer-foreground   "#303030") (visual-outer-background   "#d7afd7")
      (visual-inner-foreground   "#b2b2b2") (visual-inner-background   "#3a3a3a")
      (visual-center-foreground  "#d7afd7") (visual-center-background  "#444444")

      (replace-outer-foreground  "#303030") (replace-outer-background  "#d78787")
      (replace-inner-foreground  "#b2b2b2") (replace-inner-background  "#3a3a3a")
      (replace-center-foreground "#d78787") (replace-center-background "#444444")

      (emacs-outer-foreground    "#303030") (emacs-outer-background    "#afd787")
      (emacs-inner-foreground    "#b2b2b2") (emacs-inner-background    "#3a3a3a")
      (emacs-center-foreground   "#afd787") (emacs-center-background   "#444444")

      (inactive1-foreground      "#b2b2b2") (inactive1-background      "#444444")
      (inactive2-foreground      "#b2b2b2") (inactive2-background      "#444444")
      (inactive3-foreground      "#b2b2b2") (inactive3-background      "#444444"))

  (airline-themes-set-deftheme 'airline-bubblegum)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-bubblegum)
;;; airline-bubblegum-theme.el ends here
