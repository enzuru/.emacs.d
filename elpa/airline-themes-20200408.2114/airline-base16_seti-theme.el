
;;; Code:

(deftheme airline-base16_seti
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#282a2b") (normal-outer-background   "#9fca56")
      (normal-inner-foreground   "#eeeeee") (normal-inner-background   "#3B758C")
      (normal-center-foreground  "#db7b55") (normal-center-background  "#282a2b")

      (insert-outer-foreground   "#282a2b") (insert-outer-background   "#55b5db")
      (insert-inner-foreground   "#eeeeee") (insert-inner-background   "#3B758C")
      (insert-center-foreground  "#db7b55") (insert-center-background  "#282a2b")

      (visual-outer-foreground   "#282a2b") (visual-outer-background   "#a074c4")
      (visual-inner-foreground   "#eeeeee") (visual-inner-background   "#3B758C")
      (visual-center-foreground  "#db7b55") (visual-center-background  "#282a2b")

      (replace-outer-foreground  "#282a2b") (replace-outer-background  "#Cd3f45")
      (replace-inner-foreground  "#eeeeee") (replace-inner-background  "#3B758C")
      (replace-center-foreground "#db7b55") (replace-center-background "#282a2b")

      (emacs-outer-foreground    "#282a2b") (emacs-outer-background    "#9fca56")
      (emacs-inner-foreground    "#eeeeee") (emacs-inner-background    "#3B758C")
      (emacs-center-foreground   "#db7b55") (emacs-center-background   "#282a2b")

      (inactive1-foreground      "#d6d6d6") (inactive1-background      "#282a2b")
      (inactive2-foreground      "#d6d6d6") (inactive2-background      "#282a2b")
      (inactive3-foreground      "#d6d6d6") (inactive3-background      "#282a2b"))

  (airline-themes-set-deftheme 'airline-base16_seti)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_seti)
;;; airline-base16_seti-theme.el ends here
