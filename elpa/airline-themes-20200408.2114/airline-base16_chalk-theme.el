
;;; Code:

(deftheme airline-base16_chalk
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#202020") (normal-outer-background   "#acc267")
      (normal-inner-foreground   "#e0e0e0") (normal-inner-background   "#303030")
      (normal-center-foreground  "#eda987") (normal-center-background  "#202020")

      (insert-outer-foreground   "#202020") (insert-outer-background   "#6fc2ef")
      (insert-inner-foreground   "#e0e0e0") (insert-inner-background   "#303030")
      (insert-center-foreground  "#eda987") (insert-center-background  "#202020")

      (visual-outer-foreground   "#202020") (visual-outer-background   "#e1a3ee")
      (visual-inner-foreground   "#e0e0e0") (visual-inner-background   "#303030")
      (visual-center-foreground  "#eda987") (visual-center-background  "#202020")

      (replace-outer-foreground  "#202020") (replace-outer-background  "#fb9fb1")
      (replace-inner-foreground  "#e0e0e0") (replace-inner-background  "#303030")
      (replace-center-foreground "#eda987") (replace-center-background "#202020")

      (emacs-outer-foreground    "#202020") (emacs-outer-background    "#acc267")
      (emacs-inner-foreground    "#e0e0e0") (emacs-inner-background    "#303030")
      (emacs-center-foreground   "#eda987") (emacs-center-background   "#202020")

      (inactive1-foreground      "#d0d0d0") (inactive1-background      "#202020")
      (inactive2-foreground      "#d0d0d0") (inactive2-background      "#202020")
      (inactive3-foreground      "#d0d0d0") (inactive3-background      "#202020"))

  (airline-themes-set-deftheme 'airline-base16_chalk)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_chalk)
;;; airline-base16_chalk-theme.el ends here
