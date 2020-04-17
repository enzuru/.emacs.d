
;;; Code:

(deftheme airline-luna
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#ffffff") (normal-outer-background   "#005252")
      (normal-inner-foreground   "#ffffff") (normal-inner-background   "#003f3f")
      (normal-center-foreground  "#ffffff") (normal-center-background  "#002b2b")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#789f00")
      (insert-inner-foreground   "#ffffff") (insert-inner-background   "#003f3f")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#002b2b")

      (visual-outer-foreground   "#ffff9a") (visual-outer-background   "#ff8036")
      (visual-inner-foreground   "#ffffff") (visual-inner-background   "#003f3f")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#002b2b")

      (replace-outer-foreground  "#ffffff") (replace-outer-background  "#920000")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#003f3f")
      (replace-center-foreground "#ffffff") (replace-center-background "#002b2b")

      (emacs-outer-foreground    "#ffffff") (emacs-outer-background    "#005252")
      (emacs-inner-foreground    "#ffffff") (emacs-inner-background    "#003f3f")
      (emacs-center-foreground   "#ffffff") (emacs-center-background   "#002b2b")

      (inactive1-foreground      "#4e4e4e") (inactive1-background      "#002b2b")
      (inactive2-foreground      "#4e4e4e") (inactive2-background      "#002b2b")
      (inactive3-foreground      "#4e4e4e") (inactive3-background      "#002b2b"))

  (airline-themes-set-deftheme 'airline-luna)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-luna)
;;; airline-luna-theme.el ends here
