
;;; Code:

(deftheme airline-base16_atelierheath
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#292329") (normal-outer-background   "#379a37")
      (normal-inner-foreground   "#d8cad8") (normal-inner-background   "#695d69")
      (normal-center-foreground  "#a65926") (normal-center-background  "#292329")

      (insert-outer-foreground   "#292329") (insert-outer-background   "#516aec")
      (insert-inner-foreground   "#d8cad8") (insert-inner-background   "#695d69")
      (insert-center-foreground  "#a65926") (insert-center-background  "#292329")

      (visual-outer-foreground   "#292329") (visual-outer-background   "#7b59c0")
      (visual-inner-foreground   "#d8cad8") (visual-inner-background   "#695d69")
      (visual-center-foreground  "#a65926") (visual-center-background  "#292329")

      (replace-outer-foreground  "#292329") (replace-outer-background  "#ca402b")
      (replace-inner-foreground  "#d8cad8") (replace-inner-background  "#695d69")
      (replace-center-foreground "#a65926") (replace-center-background "#292329")

      (emacs-outer-foreground    "#292329") (emacs-outer-background    "#379a37")
      (emacs-inner-foreground    "#d8cad8") (emacs-inner-background    "#695d69")
      (emacs-center-foreground   "#a65926") (emacs-center-background   "#292329")

      (inactive1-foreground      "#ab9bab") (inactive1-background      "#292329")
      (inactive2-foreground      "#ab9bab") (inactive2-background      "#292329")
      (inactive3-foreground      "#ab9bab") (inactive3-background      "#292329"))

  (airline-themes-set-deftheme 'airline-base16_atelierheath)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_atelierheath)
;;; airline-base16_atelierheath-theme.el ends here
