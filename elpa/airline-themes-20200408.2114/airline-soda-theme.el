
;;; Code:

(deftheme airline-soda
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#ffffff") (normal-outer-background   "#875faf")
      (normal-inner-foreground   "#ffffff") (normal-inner-background   "#875f87")
      (normal-center-foreground  "#ffffff") (normal-center-background  "#5f0087")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#005f00")
      (insert-inner-foreground   "#ffffff") (insert-inner-background   "#008700")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#00af00")

      (visual-outer-foreground   "#767676") (visual-outer-background   "#ffff5f")
      (visual-inner-foreground   "#767676") (visual-inner-background   "#ffd75f")
      (visual-center-foreground  "#767676") (visual-center-background  "#ffaf5f")

      (replace-outer-foreground  "#767676") (replace-outer-background  "#ffff5f")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#875f87")
      (replace-center-foreground "#ffffff") (replace-center-background "#5f0087")

      (emacs-outer-foreground    "#ffffff") (emacs-outer-background    "#875faf")
      (emacs-inner-foreground    "#ffffff") (emacs-inner-background    "#875f87")
      (emacs-center-foreground   "#ffffff") (emacs-center-background   "#5f0087")

      (inactive1-foreground      "#767676") (inactive1-background      "#ffffff")
      (inactive2-foreground      "#767676") (inactive2-background      "#ffffff")
      (inactive3-foreground      "#767676") (inactive3-background      "#ffffff"))

  (airline-themes-set-deftheme 'airline-soda)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-soda)
;;; airline-soda-theme.el ends here
