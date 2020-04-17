
;;; Code:

(deftheme airline-desertink
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#005f00") (normal-outer-background   "#afd700")
      (normal-inner-foreground   "#bbbbbb") (normal-inner-background   "#444444")
      (normal-center-foreground  "#ffffff") (normal-center-background  "#303030")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#004866")
      (insert-inner-foreground   "#99DDFF") (insert-inner-background   "#0087af")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#303030")

      (visual-outer-foreground   "#080808") (visual-outer-background   "#ffaf00")
      (visual-inner-foreground   "#bbbbbb") (visual-inner-background   "#444444")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#303030")

      (replace-outer-foreground  "#ffffff") (replace-outer-background  "#d74444")
      (replace-inner-foreground  "#bbbbbb") (replace-inner-background  "#444444")
      (replace-center-foreground "#ffffff") (replace-center-background "#303030")

      (emacs-outer-foreground    "#005f00") (emacs-outer-background    "#afd700")
      (emacs-inner-foreground    "#bbbbbb") (emacs-inner-background    "#444444")
      (emacs-center-foreground   "#ffffff") (emacs-center-background   "#303030")

      (inactive1-foreground      "#777777") (inactive1-background      "#4a4a4a")
      (inactive2-foreground      "#777777") (inactive2-background      "#3a3a3a")
      (inactive3-foreground      "#999999") (inactive3-background      "#303030"))

  (airline-themes-set-deftheme 'airline-desertink)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-desertink)
;;; airline-desertink-theme.el ends here
