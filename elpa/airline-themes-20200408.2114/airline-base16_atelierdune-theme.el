
;;; Code:

(deftheme airline-base16_atelierdune
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#292824") (normal-outer-background   "#60ac39")
      (normal-inner-foreground   "#e8e4cf") (normal-inner-background   "#6e6b5e")
      (normal-center-foreground  "#b65611") (normal-center-background  "#292824")

      (insert-outer-foreground   "#292824") (insert-outer-background   "#6684e1")
      (insert-inner-foreground   "#e8e4cf") (insert-inner-background   "#6e6b5e")
      (insert-center-foreground  "#b65611") (insert-center-background  "#292824")

      (visual-outer-foreground   "#292824") (visual-outer-background   "#b854d4")
      (visual-inner-foreground   "#e8e4cf") (visual-inner-background   "#6e6b5e")
      (visual-center-foreground  "#b65611") (visual-center-background  "#292824")

      (replace-outer-foreground  "#292824") (replace-outer-background  "#d73737")
      (replace-inner-foreground  "#e8e4cf") (replace-inner-background  "#6e6b5e")
      (replace-center-foreground "#b65611") (replace-center-background "#292824")

      (emacs-outer-foreground    "#292824") (emacs-outer-background    "#60ac39")
      (emacs-inner-foreground    "#e8e4cf") (emacs-inner-background    "#6e6b5e")
      (emacs-center-foreground   "#b65611") (emacs-center-background   "#292824")

      (inactive1-foreground      "#a6a28c") (inactive1-background      "#292824")
      (inactive2-foreground      "#a6a28c") (inactive2-background      "#292824")
      (inactive3-foreground      "#a6a28c") (inactive3-background      "#292824"))

  (airline-themes-set-deftheme 'airline-base16_atelierdune)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_atelierdune)
;;; airline-base16_atelierdune-theme.el ends here
