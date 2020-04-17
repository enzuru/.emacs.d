
;;; Code:

(deftheme airline-base16_atelierseaside
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#242924") (normal-outer-background   "#29a329")
      (normal-inner-foreground   "#cfe8cf") (normal-inner-background   "#5e6e5e")
      (normal-center-foreground  "#87711d") (normal-center-background  "#242924")

      (insert-outer-foreground   "#242924") (insert-outer-background   "#3d62f5")
      (insert-inner-foreground   "#cfe8cf") (insert-inner-background   "#5e6e5e")
      (insert-center-foreground  "#87711d") (insert-center-background  "#242924")

      (visual-outer-foreground   "#242924") (visual-outer-background   "#ad2bee")
      (visual-inner-foreground   "#cfe8cf") (visual-inner-background   "#5e6e5e")
      (visual-center-foreground  "#87711d") (visual-center-background  "#242924")

      (replace-outer-foreground  "#242924") (replace-outer-background  "#e6193c")
      (replace-inner-foreground  "#cfe8cf") (replace-inner-background  "#5e6e5e")
      (replace-center-foreground "#87711d") (replace-center-background "#242924")

      (emacs-outer-foreground    "#242924") (emacs-outer-background    "#29a329")
      (emacs-inner-foreground    "#cfe8cf") (emacs-inner-background    "#5e6e5e")
      (emacs-center-foreground   "#87711d") (emacs-center-background   "#242924")

      (inactive1-foreground      "#8ca68c") (inactive1-background      "#242924")
      (inactive2-foreground      "#8ca68c") (inactive2-background      "#242924")
      (inactive3-foreground      "#8ca68c") (inactive3-background      "#242924"))

  (airline-themes-set-deftheme 'airline-base16_atelierseaside)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_atelierseaside)
;;; airline-base16_atelierseaside-theme.el ends here
