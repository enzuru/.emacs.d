
;;; Code:

(deftheme airline-base16_bright
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#303030") (normal-outer-background   "#a1c659")
      (normal-inner-foreground   "#f5f5f5") (normal-inner-background   "#505050")
      (normal-center-foreground  "#fc6d24") (normal-center-background  "#303030")

      (insert-outer-foreground   "#303030") (insert-outer-background   "#6fb3d2")
      (insert-inner-foreground   "#f5f5f5") (insert-inner-background   "#505050")
      (insert-center-foreground  "#fc6d24") (insert-center-background  "#303030")

      (visual-outer-foreground   "#303030") (visual-outer-background   "#d381c3")
      (visual-inner-foreground   "#f5f5f5") (visual-inner-background   "#505050")
      (visual-center-foreground  "#fc6d24") (visual-center-background  "#303030")

      (replace-outer-foreground  "#303030") (replace-outer-background  "#fb0120")
      (replace-inner-foreground  "#f5f5f5") (replace-inner-background  "#505050")
      (replace-center-foreground "#fc6d24") (replace-center-background "#303030")

      (emacs-outer-foreground    "#303030") (emacs-outer-background    "#a1c659")
      (emacs-inner-foreground    "#f5f5f5") (emacs-inner-background    "#505050")
      (emacs-center-foreground   "#fc6d24") (emacs-center-background   "#303030")

      (inactive1-foreground      "#e0e0e0") (inactive1-background      "#303030")
      (inactive2-foreground      "#e0e0e0") (inactive2-background      "#303030")
      (inactive3-foreground      "#e0e0e0") (inactive3-background      "#303030"))

  (airline-themes-set-deftheme 'airline-base16_bright)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_bright)
;;; airline-base16_bright-theme.el ends here
