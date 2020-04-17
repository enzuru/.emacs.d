
;;; Code:

(deftheme airline-jellybeans
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#d8dee9") (normal-outer-background   "#0d61ac")
      (normal-inner-foreground   "#ffffff") (normal-inner-background   "#262626")
      (normal-center-foreground  "#4f5b66") (normal-center-background  "#151515")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#437019")
      (insert-inner-foreground   "#ffffff") (insert-inner-background   "#262626")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#262626")

      (visual-outer-foreground   "#ffffff") (visual-outer-background   "#870000")
      (visual-inner-foreground   "#ffffff") (visual-inner-background   "#262626")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#262626")

      (replace-outer-foreground  "#870000") (replace-outer-background  "#262626")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#262626")
      (replace-center-foreground "#ffffff") (replace-center-background "#262626")

      (emacs-outer-foreground    "#d8dee9") (emacs-outer-background    "#0d61ac")
      (emacs-inner-foreground    "#ffffff") (emacs-inner-background    "#262626")
      (emacs-center-foreground   "#4f5b66") (emacs-center-background   "#151515")

      (inactive1-foreground      "#666666") (inactive1-background      "#262626")
      (inactive2-foreground      "#4f5b66") (inactive2-background      "#151515")
      (inactive3-foreground      "#4f5b66") (inactive3-background      "#151515"))

  (airline-themes-set-deftheme 'airline-jellybeans)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-jellybeans)
;;; airline-jellybeans-theme.el ends here
