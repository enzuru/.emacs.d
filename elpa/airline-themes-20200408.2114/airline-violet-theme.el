
;;; Code:

(deftheme airline-violet
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#bcbcbc") (normal-outer-background   "#875faf")
      (normal-inner-foreground   "#d75fd7") (normal-inner-background   "#4e4e4e")
      (normal-center-foreground  "#c6c6c6") (normal-center-background  "#3a3a3a")

      (insert-outer-foreground   "#CACFD2") (insert-outer-background   "#009966")
      (insert-inner-foreground   "#d75fd7") (insert-inner-background   "#4e4e4e")
      (insert-center-foreground  "#c6c6c6") (insert-center-background  "#3a3a3a")

      (visual-outer-foreground   "#5f0000") (visual-outer-background   "#ff5faf")
      (visual-inner-foreground   "#d75fd7") (visual-inner-background   "#4e4e4e")
      (visual-center-foreground  "#c6c6c6") (visual-center-background  "#3a3a3a")

      (replace-outer-foreground  "#c6c6c6") (replace-outer-background  "#ce537a")
      (replace-inner-foreground  "#d75fd7") (replace-inner-background  "#4e4e4e")
      (replace-center-foreground "#c6c6c6") (replace-center-background "#3a3a3a")

      (emacs-outer-foreground    "#bcbcbc") (emacs-outer-background    "#875faf")
      (emacs-inner-foreground    "#d75fd7") (emacs-inner-background    "#4e4e4e")
      (emacs-center-foreground   "#c6c6c6") (emacs-center-background   "#3a3a3a")

      (inactive1-foreground      "#875faf") (inactive1-background      "#3a3a3a")
      (inactive2-foreground      "#875faf") (inactive2-background      "#3a3a3a")
      (inactive3-foreground      "#875faf") (inactive3-background      "#3a3a3a"))

  (airline-themes-set-deftheme 'airline-violet)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-violet)
;;; airline-violet-theme.el ends here
