
;;; Code:

(deftheme airline-base16_default
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#282828") (normal-outer-background   "#a1b56c")
      (normal-inner-foreground   "#e8e8e8") (normal-inner-background   "#383838")
      (normal-center-foreground  "#dc9656") (normal-center-background  "#282828")

      (insert-outer-foreground   "#282828") (insert-outer-background   "#7cafc2")
      (insert-inner-foreground   "#e8e8e8") (insert-inner-background   "#383838")
      (insert-center-foreground  "#dc9656") (insert-center-background  "#282828")

      (visual-outer-foreground   "#282828") (visual-outer-background   "#ba8baf")
      (visual-inner-foreground   "#e8e8e8") (visual-inner-background   "#383838")
      (visual-center-foreground  "#dc9656") (visual-center-background  "#282828")

      (replace-outer-foreground  "#282828") (replace-outer-background  "#ab4642")
      (replace-inner-foreground  "#e8e8e8") (replace-inner-background  "#383838")
      (replace-center-foreground "#dc9656") (replace-center-background "#282828")

      (emacs-outer-foreground    "#282828") (emacs-outer-background    "#a1b56c")
      (emacs-inner-foreground    "#e8e8e8") (emacs-inner-background    "#383838")
      (emacs-center-foreground   "#dc9656") (emacs-center-background   "#282828")

      (inactive1-foreground      "#d8d8d8") (inactive1-background      "#282828")
      (inactive2-foreground      "#d8d8d8") (inactive2-background      "#282828")
      (inactive3-foreground      "#d8d8d8") (inactive3-background      "#282828"))

  (airline-themes-set-deftheme 'airline-base16_default)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_default)
;;; airline-base16_default-theme.el ends here
