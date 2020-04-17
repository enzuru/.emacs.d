
;;; Code:

(deftheme airline-base16_google
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#282a2e") (normal-outer-background   "#198844")
      (normal-inner-foreground   "#e0e0e0") (normal-inner-background   "#373b41")
      (normal-center-foreground  "#F96A38") (normal-center-background  "#282a2e")

      (insert-outer-foreground   "#282a2e") (insert-outer-background   "#3971ED")
      (insert-inner-foreground   "#e0e0e0") (insert-inner-background   "#373b41")
      (insert-center-foreground  "#F96A38") (insert-center-background  "#282a2e")

      (visual-outer-foreground   "#282a2e") (visual-outer-background   "#A36AC7")
      (visual-inner-foreground   "#e0e0e0") (visual-inner-background   "#373b41")
      (visual-center-foreground  "#F96A38") (visual-center-background  "#282a2e")

      (replace-outer-foreground  "#282a2e") (replace-outer-background  "#CC342B")
      (replace-inner-foreground  "#e0e0e0") (replace-inner-background  "#373b41")
      (replace-center-foreground "#F96A38") (replace-center-background "#282a2e")

      (emacs-outer-foreground    "#282a2e") (emacs-outer-background    "#198844")
      (emacs-inner-foreground    "#e0e0e0") (emacs-inner-background    "#373b41")
      (emacs-center-foreground   "#F96A38") (emacs-center-background   "#282a2e")

      (inactive1-foreground      "#c5c8c6") (inactive1-background      "#282a2e")
      (inactive2-foreground      "#c5c8c6") (inactive2-background      "#282a2e")
      (inactive3-foreground      "#c5c8c6") (inactive3-background      "#282a2e"))

  (airline-themes-set-deftheme 'airline-base16_google)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_google)
;;; airline-base16_google-theme.el ends here
