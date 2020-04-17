
;;; Code:

(deftheme airline-hybridline
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#005f00") (normal-outer-background   "#b5bd68")
      (normal-inner-foreground   "#c5c8c6") (normal-inner-background   "#373b41")
      (normal-center-foreground  "#ffffff") (normal-center-background  "#282a2e")

      (insert-outer-foreground   "#005f5f") (insert-outer-background   "#8abeb7")
      (insert-inner-foreground   "#c5c8c6") (insert-inner-background   "#0087af")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#005f87")

      (visual-outer-foreground   "#000000") (visual-outer-background   "#de935f")
      (visual-inner-foreground   "#c5c8c6") (visual-inner-background   "#373b41")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#282a2e")

      (replace-outer-foreground  "#000000") (replace-outer-background  "#CC6666")
      (replace-inner-foreground  "#c5c8c6") (replace-inner-background  "#373b41")
      (replace-center-foreground "#ffffff") (replace-center-background "#282a2e")

      (emacs-outer-foreground    "#005f00") (emacs-outer-background    "#b5bd68")
      (emacs-inner-foreground    "#c5c8c6") (emacs-inner-background    "#373b41")
      (emacs-center-foreground   "#ffffff") (emacs-center-background   "#282a2e")

      (inactive1-foreground      "#4e4e4e") (inactive1-background      "#1c1c1c")
      (inactive2-foreground      "#4e4e4e") (inactive2-background      "#262626")
      (inactive3-foreground      "#4e4e4e") (inactive3-background      "#303030"))

  (airline-themes-set-deftheme 'airline-hybridline)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-hybridline)
;;; airline-hybridline-theme.el ends here
