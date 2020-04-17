
;;; Code:

(deftheme airline-hybrid
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#A6B5C5") (normal-outer-background   "#122202")
      (normal-inner-foreground   "#A6B5C5") (normal-inner-background   "#1A2128")
      (normal-center-foreground  "#141A1F") (normal-center-background  "#6B859E")

      (insert-outer-foreground   "#A6B5C5") (insert-outer-background   "#122202")
      (insert-inner-foreground   "#A6B5C5") (insert-inner-background   "#1A2128")
      (insert-center-foreground  "#141A1F") (insert-center-background  "#6B859E")

      (visual-outer-foreground   "#A6B5C5") (visual-outer-background   "#4E0404")
      (visual-inner-foreground   "#A6B5C5") (visual-inner-background   "#1A2128")
      (visual-center-foreground  "#141A1F") (visual-center-background  "#6B859E")

      (replace-outer-foreground  "#A6B5C5") (replace-outer-background  "#031F3A")
      (replace-inner-foreground  "#A6B5C5") (replace-inner-background  "#1A2128")
      (replace-center-foreground "#141A1F") (replace-center-background "#6B859E")

      (emacs-outer-foreground    "#A6B5C5") (emacs-outer-background    "#122202")
      (emacs-inner-foreground    "#A6B5C5") (emacs-inner-background    "#1A2128")
      (emacs-center-foreground   "#141A1F") (emacs-center-background   "#6B859E")

      (inactive1-foreground      "#A6B5C5") (inactive1-background      "#1A2128")
      (inactive2-foreground      "#A6B5C5") (inactive2-background      "#1A2128")
      (inactive3-foreground      "#A6B5C5") (inactive3-background      "#1A2128"))

  (airline-themes-set-deftheme 'airline-hybrid)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-hybrid)
;;; airline-hybrid-theme.el ends here
