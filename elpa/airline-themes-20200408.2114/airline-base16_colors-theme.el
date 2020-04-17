
;;; Code:

(deftheme airline-base16_colors
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#333333") (normal-outer-background   "#2ecc40")
      (normal-inner-foreground   "#dddddd") (normal-inner-background   "#555555")
      (normal-center-foreground  "#ff851b") (normal-center-background  "#333333")

      (insert-outer-foreground   "#333333") (insert-outer-background   "#0074d9")
      (insert-inner-foreground   "#dddddd") (insert-inner-background   "#555555")
      (insert-center-foreground  "#ff851b") (insert-center-background  "#333333")

      (visual-outer-foreground   "#333333") (visual-outer-background   "#b10dc9")
      (visual-inner-foreground   "#dddddd") (visual-inner-background   "#555555")
      (visual-center-foreground  "#ff851b") (visual-center-background  "#333333")

      (replace-outer-foreground  "#333333") (replace-outer-background  "#ff4136")
      (replace-inner-foreground  "#dddddd") (replace-inner-background  "#555555")
      (replace-center-foreground "#ff851b") (replace-center-background "#333333")

      (emacs-outer-foreground    "#333333") (emacs-outer-background    "#2ecc40")
      (emacs-inner-foreground    "#dddddd") (emacs-inner-background    "#555555")
      (emacs-center-foreground   "#ff851b") (emacs-center-background   "#333333")

      (inactive1-foreground      "#bbbbbb") (inactive1-background      "#333333")
      (inactive2-foreground      "#bbbbbb") (inactive2-background      "#333333")
      (inactive3-foreground      "#bbbbbb") (inactive3-background      "#333333"))

  (airline-themes-set-deftheme 'airline-base16_colors)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_colors)
;;; airline-base16_colors-theme.el ends here
