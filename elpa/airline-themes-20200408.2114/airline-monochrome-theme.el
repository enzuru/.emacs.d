
;;; Code:

(deftheme airline-monochrome
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#A6B5C5") (normal-outer-background   "#1A2128")
      (normal-inner-foreground   "#A6B5C5") (normal-inner-background   "#1A2128")
      (normal-center-foreground  "#A6B5C5") (normal-center-background  "#1A2128")

      (insert-outer-foreground   "#A6B5C5") (insert-outer-background   "#1A2128")
      (insert-inner-foreground   "#A6B5C5") (insert-inner-background   "#1A2128")
      (insert-center-foreground  "#A6B5C5") (insert-center-background  "#1A2128")

      (visual-outer-foreground   "#A6B5C5") (visual-outer-background   "#1A2128")
      (visual-inner-foreground   "#A6B5C5") (visual-inner-background   "#1A2128")
      (visual-center-foreground  "#A6B5C5") (visual-center-background  "#1A2128")

      (replace-outer-foreground  "#A6B5C5") (replace-outer-background  "#1A2128")
      (replace-inner-foreground  "#A6B5C5") (replace-inner-background  "#1A2128")
      (replace-center-foreground "#A6B5C5") (replace-center-background "#1A2128")

      (emacs-outer-foreground    "#A6B5C5") (emacs-outer-background    "#1A2128")
      (emacs-inner-foreground    "#A6B5C5") (emacs-inner-background    "#1A2128")
      (emacs-center-foreground   "#A6B5C5") (emacs-center-background   "#1A2128")

      (inactive1-foreground      "#A6B5C5") (inactive1-background      "#1A2128")
      (inactive2-foreground      "#A6B5C5") (inactive2-background      "#1A2128")
      (inactive3-foreground      "#A6B5C5") (inactive3-background      "#1A2128"))

  (airline-themes-set-deftheme 'airline-monochrome)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-monochrome)
;;; airline-monochrome-theme.el ends here
