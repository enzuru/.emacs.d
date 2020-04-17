
;;; Code:

(deftheme airline-solarized
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#fdf6e3") (normal-outer-background   "#93a1a1")
      (normal-inner-foreground   "#eee8d5") (normal-inner-background   "#657b83")
      (normal-center-foreground  "#586e75") (normal-center-background  "#073642")

      (insert-outer-foreground   "#fdf6e3") (insert-outer-background   "#b58900")
      (insert-inner-foreground   "#eee8d5") (insert-inner-background   "#657b83")
      (insert-center-foreground  "#586e75") (insert-center-background  "#073642")

      (visual-outer-foreground   "#fdf6e3") (visual-outer-background   "#d33682")
      (visual-inner-foreground   "#eee8d5") (visual-inner-background   "#657b83")
      (visual-center-foreground  "#586e75") (visual-center-background  "#073642")

      (replace-outer-foreground  "#fdf6e3") (replace-outer-background  "#dc322f")
      (replace-inner-foreground  "#eee8d5") (replace-inner-background  "#657b83")
      (replace-center-foreground "#586e75") (replace-center-background "#073642")

      (emacs-outer-foreground    "#fdf6e3") (emacs-outer-background    "#93a1a1")
      (emacs-inner-foreground    "#eee8d5") (emacs-inner-background    "#657b83")
      (emacs-center-foreground   "#586e75") (emacs-center-background   "#073642")

      (inactive1-foreground      "#073642") (inactive1-background      "#657b83")
      (inactive2-foreground      "#073642") (inactive2-background      "#657b83")
      (inactive3-foreground      "#073642") (inactive3-background      "#657b83"))

  (airline-themes-set-deftheme 'airline-solarized)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-solarized)
;;; airline-solarized-theme.el ends here
