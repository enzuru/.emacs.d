
;;; Code:

(deftheme airline-sol
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#343434") (normal-outer-background   "#a0a0a0")
      (normal-inner-foreground   "#343434") (normal-inner-background   "#b3b3b3")
      (normal-center-foreground  "#343434") (normal-center-background  "#c7c7c7")

      (insert-outer-foreground   "#eeeeee") (insert-outer-background   "#09643f")
      (insert-inner-foreground   "#343434") (insert-inner-background   "#a3a3a3")
      (insert-center-foreground  "#343434") (insert-center-background  "#b0b0b0")

      (visual-outer-foreground   "#ffff9a") (visual-outer-background   "#ff6003")
      (visual-inner-foreground   "#343434") (visual-inner-background   "#a3a3a3")
      (visual-center-foreground  "#343434") (visual-center-background  "#b0b0b0")

      (replace-outer-foreground  "#eeeeee") (replace-outer-background  "#ff2121")
      (replace-inner-foreground  "#343434") (replace-inner-background  "#a3a3a3")
      (replace-center-foreground "#343434") (replace-center-background "#b0b0b0")

      (emacs-outer-foreground    "#343434") (emacs-outer-background    "#a0a0a0")
      (emacs-inner-foreground    "#343434") (emacs-inner-background    "#b3b3b3")
      (emacs-center-foreground   "#343434") (emacs-center-background   "#c7c7c7")

      (inactive1-foreground      "#777777") (inactive1-background      "#c7c7c7")
      (inactive2-foreground      "#777777") (inactive2-background      "#c7c7c7")
      (inactive3-foreground      "#777777") (inactive3-background      "#c7c7c7"))

  (airline-themes-set-deftheme 'airline-sol)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-sol)
;;; airline-sol-theme.el ends here
