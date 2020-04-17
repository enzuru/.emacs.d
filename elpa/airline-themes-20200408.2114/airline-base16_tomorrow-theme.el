
;;; Code:

(deftheme airline-base16_tomorrow
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#282a2e") (normal-outer-background   "#b5bd68")
      (normal-inner-foreground   "#e0e0e0") (normal-inner-background   "#373b41")
      (normal-center-foreground  "#de935f") (normal-center-background  "#282a2e")

      (insert-outer-foreground   "#282a2e") (insert-outer-background   "#81a2be")
      (insert-inner-foreground   "#e0e0e0") (insert-inner-background   "#373b41")
      (insert-center-foreground  "#de935f") (insert-center-background  "#282a2e")

      (visual-outer-foreground   "#282a2e") (visual-outer-background   "#b294bb")
      (visual-inner-foreground   "#e0e0e0") (visual-inner-background   "#373b41")
      (visual-center-foreground  "#de935f") (visual-center-background  "#282a2e")

      (replace-outer-foreground  "#282a2e") (replace-outer-background  "#cc6666")
      (replace-inner-foreground  "#e0e0e0") (replace-inner-background  "#373b41")
      (replace-center-foreground "#de935f") (replace-center-background "#282a2e")

      (emacs-outer-foreground    "#282a2e") (emacs-outer-background    "#b5bd68")
      (emacs-inner-foreground    "#e0e0e0") (emacs-inner-background    "#373b41")
      (emacs-center-foreground   "#de935f") (emacs-center-background   "#282a2e")

      (inactive1-foreground      "#c5c8c6") (inactive1-background      "#282a2e")
      (inactive2-foreground      "#c5c8c6") (inactive2-background      "#282a2e")
      (inactive3-foreground      "#c5c8c6") (inactive3-background      "#282a2e"))

  (airline-themes-set-deftheme 'airline-base16_tomorrow)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_tomorrow)
;;; airline-base16_tomorrow-theme.el ends here
