
;;; Code:

(deftheme airline-base16_apathy
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#0B342D") (normal-outer-background   "#883E96")
      (normal-inner-foreground   "#A7CEC8") (normal-inner-background   "#184E45")
      (normal-center-foreground  "#3E7996") (normal-center-background  "#0B342D")

      (insert-outer-foreground   "#0B342D") (insert-outer-background   "#96883E")
      (insert-inner-foreground   "#A7CEC8") (insert-inner-background   "#184E45")
      (insert-center-foreground  "#3E7996") (insert-center-background  "#0B342D")

      (visual-outer-foreground   "#0B342D") (visual-outer-background   "#4C963E")
      (visual-inner-foreground   "#A7CEC8") (visual-inner-background   "#184E45")
      (visual-center-foreground  "#3E7996") (visual-center-background  "#0B342D")

      (replace-outer-foreground  "#0B342D") (replace-outer-background  "#3E9688")
      (replace-inner-foreground  "#A7CEC8") (replace-inner-background  "#184E45")
      (replace-center-foreground "#3E7996") (replace-center-background "#0B342D")

      (emacs-outer-foreground    "#0B342D") (emacs-outer-background    "#883E96")
      (emacs-inner-foreground    "#A7CEC8") (emacs-inner-background    "#184E45")
      (emacs-center-foreground   "#3E7996") (emacs-center-background   "#0B342D")

      (inactive1-foreground      "#81B5AC") (inactive1-background      "#0B342D")
      (inactive2-foreground      "#81B5AC") (inactive2-background      "#0B342D")
      (inactive3-foreground      "#81B5AC") (inactive3-background      "#0B342D"))

  (airline-themes-set-deftheme 'airline-base16_apathy)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_apathy)
;;; airline-base16_apathy-theme.el ends here
