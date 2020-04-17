
;;; Code:

(deftheme airline-dark_minimal
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#00005f") (normal-outer-background   "#dfff00")
      (normal-inner-foreground   "#ffffff") (normal-inner-background   "#444444")
      (normal-center-foreground  "#9cffd3") (normal-center-background  "#202020")

      (insert-outer-foreground   "#00005f") (insert-outer-background   "#dfff00")
      (insert-inner-foreground   "#ffffff") (insert-inner-background   "#444444")
      (insert-center-foreground  "#9cffd3") (insert-center-background  "#202020")

      (visual-outer-foreground   "#00005f") (visual-outer-background   "#dfff00")
      (visual-inner-foreground   "#ffffff") (visual-inner-background   "#444444")
      (visual-center-foreground  "#9cffd3") (visual-center-background  "#202020")

      (replace-outer-foreground  "#00005f") (replace-outer-background  "#dfff00")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#444444")
      (replace-center-foreground "#9cffd3") (replace-center-background "#202020")

      (emacs-outer-foreground    "#00005f") (emacs-outer-background    "#dfff00")
      (emacs-inner-foreground    "#ffffff") (emacs-inner-background    "#444444")
      (emacs-center-foreground   "#9cffd3") (emacs-center-background   "#202020")

      (inactive1-foreground      "#00005f") (inactive1-background      "#dfff00")
      (inactive2-foreground      "#ffffff") (inactive2-background      "#444444")
      (inactive3-foreground      "#9cffd3") (inactive3-background      "#202020"))

  (airline-themes-set-deftheme 'airline-dark_minimal)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-dark_minimal)
;;; airline-dark_minimal-theme.el ends here
