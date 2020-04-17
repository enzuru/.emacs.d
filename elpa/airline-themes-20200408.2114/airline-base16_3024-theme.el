
;;; Code:

(deftheme airline-base16_3024
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#3a3432") (normal-outer-background   "#01a252")
      (normal-inner-foreground   "#d6d5d4") (normal-inner-background   "#4a4543")
      (normal-center-foreground  "#e8bbd0") (normal-center-background  "#3a3432")

      (insert-outer-foreground   "#3a3432") (insert-outer-background   "#01a0e4")
      (insert-inner-foreground   "#d6d5d4") (insert-inner-background   "#4a4543")
      (insert-center-foreground  "#e8bbd0") (insert-center-background  "#3a3432")

      (visual-outer-foreground   "#3a3432") (visual-outer-background   "#a16a94")
      (visual-inner-foreground   "#d6d5d4") (visual-inner-background   "#4a4543")
      (visual-center-foreground  "#e8bbd0") (visual-center-background  "#3a3432")

      (replace-outer-foreground  "#3a3432") (replace-outer-background  "#db2d20")
      (replace-inner-foreground  "#d6d5d4") (replace-inner-background  "#4a4543")
      (replace-center-foreground "#e8bbd0") (replace-center-background "#3a3432")

      (emacs-outer-foreground    "#3a3432") (emacs-outer-background    "#01a252")
      (emacs-inner-foreground    "#d6d5d4") (emacs-inner-background    "#4a4543")
      (emacs-center-foreground   "#e8bbd0") (emacs-center-background   "#3a3432")

      (inactive1-foreground      "#a5a2a2") (inactive1-background      "#3a3432")
      (inactive2-foreground      "#a5a2a2") (inactive2-background      "#3a3432")
      (inactive3-foreground      "#a5a2a2") (inactive3-background      "#3a3432"))

  (airline-themes-set-deftheme 'airline-base16_3024)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_3024)
;;; airline-base16_3024-theme.el ends here
