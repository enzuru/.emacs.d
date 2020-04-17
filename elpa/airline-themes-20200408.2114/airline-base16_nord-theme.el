
;;; Code:

(deftheme airline-base16_nord
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#3b4252") (normal-outer-background   "#bf616a")
      (normal-inner-foreground   "#eceff4") (normal-inner-background   "#434c5e")
      (normal-center-foreground  "#81a1c1") (normal-center-background  "#3b4252")

      (insert-outer-foreground   "#3b4252") (insert-outer-background   "#ebcb8b")
      (insert-inner-foreground   "#eceff4") (insert-inner-background   "#434c5e")
      (insert-center-foreground  "#81a1c1") (insert-center-background  "#3b4252")

      (visual-outer-foreground   "#3b4252") (visual-outer-background   "#a3be8c")
      (visual-inner-foreground   "#eceff4") (visual-inner-background   "#434c5e")
      (visual-center-foreground  "#81a1c1") (visual-center-background  "#3b4252")

      (replace-outer-foreground  "#3b4252") (replace-outer-background  "#88c0d0")
      (replace-inner-foreground  "#eceff4") (replace-inner-background  "#434c5e")
      (replace-center-foreground "#81a1c1") (replace-center-background "#3b4252")

      (emacs-outer-foreground    "#3b4252") (emacs-outer-background    "#bf616a")
      (emacs-inner-foreground    "#eceff4") (emacs-inner-background    "#434c5e")
      (emacs-center-foreground   "#81a1c1") (emacs-center-background   "#3b4252")

      (inactive1-foreground      "#e5e9f0") (inactive1-background      "#3b4252")
      (inactive2-foreground      "#e5e9f0") (inactive2-background      "#3b4252")
      (inactive3-foreground      "#e5e9f0") (inactive3-background      "#3b4252"))

  (airline-themes-set-deftheme 'airline-base16_nord)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_nord)
;;; airline-base16_nord-theme.el ends here
