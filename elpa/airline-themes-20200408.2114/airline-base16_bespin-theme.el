
;;; Code:

(deftheme airline-base16_bespin
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#36312e") (normal-outer-background   "#54be0d")
      (normal-inner-foreground   "#9d9b97") (normal-inner-background   "#5e5d5c")
      (normal-center-foreground  "#cf7d34") (normal-center-background  "#36312e")

      (insert-outer-foreground   "#36312e") (insert-outer-background   "#5ea6ea")
      (insert-inner-foreground   "#9d9b97") (insert-inner-background   "#5e5d5c")
      (insert-center-foreground  "#cf7d34") (insert-center-background  "#36312e")

      (visual-outer-foreground   "#36312e") (visual-outer-background   "#9b859d")
      (visual-inner-foreground   "#9d9b97") (visual-inner-background   "#5e5d5c")
      (visual-center-foreground  "#cf7d34") (visual-center-background  "#36312e")

      (replace-outer-foreground  "#36312e") (replace-outer-background  "#cf6a4c")
      (replace-inner-foreground  "#9d9b97") (replace-inner-background  "#5e5d5c")
      (replace-center-foreground "#cf7d34") (replace-center-background "#36312e")

      (emacs-outer-foreground    "#36312e") (emacs-outer-background    "#54be0d")
      (emacs-inner-foreground    "#9d9b97") (emacs-inner-background    "#5e5d5c")
      (emacs-center-foreground   "#cf7d34") (emacs-center-background   "#36312e")

      (inactive1-foreground      "#8a8986") (inactive1-background      "#36312e")
      (inactive2-foreground      "#8a8986") (inactive2-background      "#36312e")
      (inactive3-foreground      "#8a8986") (inactive3-background      "#36312e"))

  (airline-themes-set-deftheme 'airline-base16_bespin)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_bespin)
;;; airline-base16_bespin-theme.el ends here
