
;;; Code:

(deftheme airline-base16_summerfruit
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#202020") (normal-outer-background   "#00C918")
      (normal-inner-foreground   "#E0E0E0") (normal-inner-background   "#303030")
      (normal-center-foreground  "#FD8900") (normal-center-background  "#202020")

      (insert-outer-foreground   "#202020") (insert-outer-background   "#3777E6")
      (insert-inner-foreground   "#E0E0E0") (insert-inner-background   "#303030")
      (insert-center-foreground  "#FD8900") (insert-center-background  "#202020")

      (visual-outer-foreground   "#202020") (visual-outer-background   "#AD00A1")
      (visual-inner-foreground   "#E0E0E0") (visual-inner-background   "#303030")
      (visual-center-foreground  "#FD8900") (visual-center-background  "#202020")

      (replace-outer-foreground  "#202020") (replace-outer-background  "#FF0086")
      (replace-inner-foreground  "#E0E0E0") (replace-inner-background  "#303030")
      (replace-center-foreground "#FD8900") (replace-center-background "#202020")

      (emacs-outer-foreground    "#202020") (emacs-outer-background    "#00C918")
      (emacs-inner-foreground    "#E0E0E0") (emacs-inner-background    "#303030")
      (emacs-center-foreground   "#FD8900") (emacs-center-background   "#202020")

      (inactive1-foreground      "#D0D0D0") (inactive1-background      "#202020")
      (inactive2-foreground      "#D0D0D0") (inactive2-background      "#202020")
      (inactive3-foreground      "#D0D0D0") (inactive3-background      "#202020"))

  (airline-themes-set-deftheme 'airline-base16_summerfruit)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_summerfruit)
;;; airline-base16_summerfruit-theme.el ends here
