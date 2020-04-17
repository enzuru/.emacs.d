
;;; Code:

(deftheme airline-base16_shapeshifter
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#040404") (normal-outer-background   "#0ed839")
      (normal-inner-foreground   "#e0e0e0") (normal-inner-background   "#102015")
      (normal-center-foreground  "#e09448") (normal-center-background  "#040404")

      (insert-outer-foreground   "#040404") (insert-outer-background   "#3b48e3")
      (insert-inner-foreground   "#e0e0e0") (insert-inner-background   "#102015")
      (insert-center-foreground  "#e09448") (insert-center-background  "#040404")

      (visual-outer-foreground   "#040404") (visual-outer-background   "#f996e2")
      (visual-inner-foreground   "#e0e0e0") (visual-inner-background   "#102015")
      (visual-center-foreground  "#e09448") (visual-center-background  "#040404")

      (replace-outer-foreground  "#040404") (replace-outer-background  "#e92f2f")
      (replace-inner-foreground  "#e0e0e0") (replace-inner-background  "#102015")
      (replace-center-foreground "#e09448") (replace-center-background "#040404")

      (emacs-outer-foreground    "#040404") (emacs-outer-background    "#0ed839")
      (emacs-inner-foreground    "#e0e0e0") (emacs-inner-background    "#102015")
      (emacs-center-foreground   "#e09448") (emacs-center-background   "#040404")

      (inactive1-foreground      "#ababab") (inactive1-background      "#040404")
      (inactive2-foreground      "#ababab") (inactive2-background      "#040404")
      (inactive3-foreground      "#ababab") (inactive3-background      "#040404"))

  (airline-themes-set-deftheme 'airline-base16_shapeshifter)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_shapeshifter)
;;; airline-base16_shapeshifter-theme.el ends here
