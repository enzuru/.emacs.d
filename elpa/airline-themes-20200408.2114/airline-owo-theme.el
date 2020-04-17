
;;; Code:

(deftheme airline-owo
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#303030") (normal-outer-background   "#87d7ff")
      (normal-inner-foreground   "#b2b2b2") (normal-inner-background   "#3a3a3a")
      (normal-center-foreground  "#87d7ff") (normal-center-background  "#444444")

      (insert-outer-foreground   "#444444") (insert-outer-background   "#87afd7")
      (insert-inner-foreground   "#b2b2b2") (insert-inner-background   "#3a3a3a")
      (insert-center-foreground  "#87afd7") (insert-center-background  "#444444")

      (visual-outer-foreground   "#303030") (visual-outer-background   "#87d787")
      (visual-inner-foreground   "#b2b2b2") (visual-inner-background   "#3a3a3a")
      (visual-center-foreground  "#87d787") (visual-center-background  "#444444")

      (replace-outer-foreground  "#303030") (replace-outer-background  "#8787ff")
      (replace-inner-foreground  "#b2b2b2") (replace-inner-background  "#3a3a3a")
      (replace-center-foreground "#8787ff") (replace-center-background "#444444")

      (emacs-outer-foreground    "#303030") (emacs-outer-background    "#87d7ff")
      (emacs-inner-foreground    "#b2b2b2") (emacs-inner-background    "#3a3a3a")
      (emacs-center-foreground   "#87d7ff") (emacs-center-background   "#444444")

      (inactive1-foreground      "#b2b2b2") (inactive1-background      "#444444")
      (inactive2-foreground      "#b2b2b2") (inactive2-background      "#444444")
      (inactive3-foreground      "#b2b2b2") (inactive3-background      "#444444"))

  (airline-themes-set-deftheme 'airline-owo)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-owo)
;;; airline-owo-theme.el ends here
