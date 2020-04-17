
;;; Code:

(deftheme airline-base16_mocha
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#534636") (normal-outer-background   "#beb55b")
      (normal-inner-foreground   "#e9e1dd") (normal-inner-background   "#645240")
      (normal-center-foreground  "#d28b71") (normal-center-background  "#534636")

      (insert-outer-foreground   "#534636") (insert-outer-background   "#8ab3b5")
      (insert-inner-foreground   "#e9e1dd") (insert-inner-background   "#645240")
      (insert-center-foreground  "#d28b71") (insert-center-background  "#534636")

      (visual-outer-foreground   "#534636") (visual-outer-background   "#a89bb9")
      (visual-inner-foreground   "#e9e1dd") (visual-inner-background   "#645240")
      (visual-center-foreground  "#d28b71") (visual-center-background  "#534636")

      (replace-outer-foreground  "#534636") (replace-outer-background  "#cb6077")
      (replace-inner-foreground  "#e9e1dd") (replace-inner-background  "#645240")
      (replace-center-foreground "#d28b71") (replace-center-background "#534636")

      (emacs-outer-foreground    "#534636") (emacs-outer-background    "#beb55b")
      (emacs-inner-foreground    "#e9e1dd") (emacs-inner-background    "#645240")
      (emacs-center-foreground   "#d28b71") (emacs-center-background   "#534636")

      (inactive1-foreground      "#d0c8c6") (inactive1-background      "#534636")
      (inactive2-foreground      "#d0c8c6") (inactive2-background      "#534636")
      (inactive3-foreground      "#d0c8c6") (inactive3-background      "#534636"))

  (airline-themes-set-deftheme 'airline-base16_mocha)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_mocha)
;;; airline-base16_mocha-theme.el ends here
