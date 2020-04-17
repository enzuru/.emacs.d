
;;; Code:

(deftheme airline-base16_embers
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#2C2620") (normal-outer-background   "#57826D")
      (normal-inner-foreground   "#BEB6AE") (normal-inner-background   "#433B32")
      (normal-center-foreground  "#828257") (normal-center-background  "#2C2620")

      (insert-outer-foreground   "#2C2620") (insert-outer-background   "#6D5782")
      (insert-inner-foreground   "#BEB6AE") (insert-inner-background   "#433B32")
      (insert-center-foreground  "#828257") (insert-center-background  "#2C2620")

      (visual-outer-foreground   "#2C2620") (visual-outer-background   "#82576D")
      (visual-inner-foreground   "#BEB6AE") (visual-inner-background   "#433B32")
      (visual-center-foreground  "#828257") (visual-center-background  "#2C2620")

      (replace-outer-foreground  "#2C2620") (replace-outer-background  "#826D57")
      (replace-inner-foreground  "#BEB6AE") (replace-inner-background  "#433B32")
      (replace-center-foreground "#828257") (replace-center-background "#2C2620")

      (emacs-outer-foreground    "#2C2620") (emacs-outer-background    "#57826D")
      (emacs-inner-foreground    "#BEB6AE") (emacs-inner-background    "#433B32")
      (emacs-center-foreground   "#828257") (emacs-center-background   "#2C2620")

      (inactive1-foreground      "#A39A90") (inactive1-background      "#2C2620")
      (inactive2-foreground      "#A39A90") (inactive2-background      "#2C2620")
      (inactive3-foreground      "#A39A90") (inactive3-background      "#2C2620"))

  (airline-themes-set-deftheme 'airline-base16_embers)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_embers)
;;; airline-base16_embers-theme.el ends here
