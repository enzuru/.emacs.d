
;;; Code:

(deftheme airline-seagull
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#ffffff") (normal-outer-background   "#808487")
      (normal-inner-foreground   "#e6eaed") (normal-inner-background   "#6d767d")
      (normal-center-foreground  "#61707a") (normal-center-background  "#1d252b")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#00a5ab")
      (insert-inner-foreground   "#e6eaed") (insert-inner-background   "#6d767d")
      (insert-center-foreground  "#61707a") (insert-center-background  "#1d252b")

      (visual-outer-foreground   "#ffffff") (visual-outer-background   "#11ab00")
      (visual-inner-foreground   "#e6eaed") (visual-inner-background   "#6d767d")
      (visual-center-foreground  "#61707a") (visual-center-background  "#1d252b")

      (replace-outer-foreground  "#ffffff") (replace-outer-background  "#ff4053")
      (replace-inner-foreground  "#e6eaed") (replace-inner-background  "#6d767d")
      (replace-center-foreground "#61707a") (replace-center-background "#1d252b")

      (emacs-outer-foreground    "#ffffff") (emacs-outer-background    "#808487")
      (emacs-inner-foreground    "#e6eaed") (emacs-inner-background    "#6d767d")
      (emacs-center-foreground   "#61707a") (emacs-center-background   "#1d252b")

      (inactive1-foreground      "#1d252b") (inactive1-background      "#6d767d")
      (inactive2-foreground      "#1d252b") (inactive2-background      "#6d767d")
      (inactive3-foreground      "#1d252b") (inactive3-background      "#6d767d"))

  (airline-themes-set-deftheme 'airline-seagull)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-seagull)
;;; airline-seagull-theme.el ends here
