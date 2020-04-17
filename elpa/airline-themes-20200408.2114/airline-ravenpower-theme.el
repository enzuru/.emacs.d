
;;; Code:

(deftheme airline-ravenpower
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#005f00") (normal-outer-background   "#1d1f21")
      (normal-inner-foreground   "#9e9e9e") (normal-inner-background   "#303030")
      (normal-center-foreground  "#c8c8c8") (normal-center-background  "#2e2e2e")

      (insert-outer-foreground   "#87d7ff") (insert-outer-background   "#1d1f21")
      (insert-inner-foreground   "#9e9e9e") (insert-inner-background   "#303030")
      (insert-center-foreground  "#c8c8c8") (insert-center-background  "#2e2e2e")

      (visual-outer-foreground   "#080808") (visual-outer-background   "#ffaf00")
      (visual-inner-foreground   "#9e9e9e") (visual-inner-background   "#303030")
      (visual-center-foreground  "#c8c8c8") (visual-center-background  "#2e2e2e")

      (replace-outer-foreground  "#ffffff") (replace-outer-background  "#d70000")
      (replace-inner-foreground  "#9e9e9e") (replace-inner-background  "#303030")
      (replace-center-foreground "#c8c8c8") (replace-center-background "#2e2e2e")

      (emacs-outer-foreground    "#005f00") (emacs-outer-background    "#1d1f21")
      (emacs-inner-foreground    "#9e9e9e") (emacs-inner-background    "#303030")
      (emacs-center-foreground   "#c8c8c8") (emacs-center-background   "#2e2e2e")

      (inactive1-foreground      "#303030") (inactive1-background      "#2e2e2e")
      (inactive2-foreground      "#303030") (inactive2-background      "#2e2e2e")
      (inactive3-foreground      "#303030") (inactive3-background      "#2e2e2e"))

  (airline-themes-set-deftheme 'airline-ravenpower)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-ravenpower)
;;; airline-ravenpower-theme.el ends here
