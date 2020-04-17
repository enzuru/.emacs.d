
;;; Code:

(deftheme airline-base16_atelierforest
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#2c2421") (normal-outer-background   "#5ab738")
      (normal-inner-foreground   "#e6e2e0") (normal-inner-background   "#68615e")
      (normal-center-foreground  "#df5320") (normal-center-background  "#2c2421")

      (insert-outer-foreground   "#2c2421") (insert-outer-background   "#407ee7")
      (insert-inner-foreground   "#e6e2e0") (insert-inner-background   "#68615e")
      (insert-center-foreground  "#df5320") (insert-center-background  "#2c2421")

      (visual-outer-foreground   "#2c2421") (visual-outer-background   "#6666ea")
      (visual-inner-foreground   "#e6e2e0") (visual-inner-background   "#68615e")
      (visual-center-foreground  "#df5320") (visual-center-background  "#2c2421")

      (replace-outer-foreground  "#2c2421") (replace-outer-background  "#f22c40")
      (replace-inner-foreground  "#e6e2e0") (replace-inner-background  "#68615e")
      (replace-center-foreground "#df5320") (replace-center-background "#2c2421")

      (emacs-outer-foreground    "#2c2421") (emacs-outer-background    "#5ab738")
      (emacs-inner-foreground    "#e6e2e0") (emacs-inner-background    "#68615e")
      (emacs-center-foreground   "#df5320") (emacs-center-background   "#2c2421")

      (inactive1-foreground      "#a8a19f") (inactive1-background      "#2c2421")
      (inactive2-foreground      "#a8a19f") (inactive2-background      "#2c2421")
      (inactive3-foreground      "#a8a19f") (inactive3-background      "#2c2421"))

  (airline-themes-set-deftheme 'airline-base16_atelierforest)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_atelierforest)
;;; airline-base16_atelierforest-theme.el ends here
