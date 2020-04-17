
;;; Code:

(deftheme airline-base16_grayscale
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#252525") (normal-outer-background   "#8e8e8e")
      (normal-inner-foreground   "#e3e3e3") (normal-inner-background   "#464646")
      (normal-center-foreground  "#999999") (normal-center-background  "#252525")

      (insert-outer-foreground   "#252525") (insert-outer-background   "#686868")
      (insert-inner-foreground   "#e3e3e3") (insert-inner-background   "#464646")
      (insert-center-foreground  "#999999") (insert-center-background  "#252525")

      (visual-outer-foreground   "#252525") (visual-outer-background   "#747474")
      (visual-inner-foreground   "#e3e3e3") (visual-inner-background   "#464646")
      (visual-center-foreground  "#999999") (visual-center-background  "#252525")

      (replace-outer-foreground  "#252525") (replace-outer-background  "#7c7c7c")
      (replace-inner-foreground  "#e3e3e3") (replace-inner-background  "#464646")
      (replace-center-foreground "#999999") (replace-center-background "#252525")

      (emacs-outer-foreground    "#252525") (emacs-outer-background    "#8e8e8e")
      (emacs-inner-foreground    "#e3e3e3") (emacs-inner-background    "#464646")
      (emacs-center-foreground   "#999999") (emacs-center-background   "#252525")

      (inactive1-foreground      "#b9b9b9") (inactive1-background      "#252525")
      (inactive2-foreground      "#b9b9b9") (inactive2-background      "#252525")
      (inactive3-foreground      "#b9b9b9") (inactive3-background      "#252525"))

  (airline-themes-set-deftheme 'airline-base16_grayscale)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_grayscale)
;;; airline-base16_grayscale-theme.el ends here
