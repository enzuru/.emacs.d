
;;; Code:

(deftheme airline-base16_pop
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#202020") (normal-outer-background   "#37b349")
      (normal-inner-foreground   "#e0e0e0") (normal-inner-background   "#303030")
      (normal-center-foreground  "#f29333") (normal-center-background  "#202020")

      (insert-outer-foreground   "#202020") (insert-outer-background   "#0e5a94")
      (insert-inner-foreground   "#e0e0e0") (insert-inner-background   "#303030")
      (insert-center-foreground  "#f29333") (insert-center-background  "#202020")

      (visual-outer-foreground   "#202020") (visual-outer-background   "#b31e8d")
      (visual-inner-foreground   "#e0e0e0") (visual-inner-background   "#303030")
      (visual-center-foreground  "#f29333") (visual-center-background  "#202020")

      (replace-outer-foreground  "#202020") (replace-outer-background  "#eb008a")
      (replace-inner-foreground  "#e0e0e0") (replace-inner-background  "#303030")
      (replace-center-foreground "#f29333") (replace-center-background "#202020")

      (emacs-outer-foreground    "#202020") (emacs-outer-background    "#37b349")
      (emacs-inner-foreground    "#e0e0e0") (emacs-inner-background    "#303030")
      (emacs-center-foreground   "#f29333") (emacs-center-background   "#202020")

      (inactive1-foreground      "#d0d0d0") (inactive1-background      "#202020")
      (inactive2-foreground      "#d0d0d0") (inactive2-background      "#202020")
      (inactive3-foreground      "#d0d0d0") (inactive3-background      "#202020"))

  (airline-themes-set-deftheme 'airline-base16_pop)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_pop)
;;; airline-base16_pop-theme.el ends here
