
;;; Code:

(deftheme airline-base16_snazzy
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#282a36") (normal-outer-background   "#57c7ff")
      (normal-inner-foreground   "#57c7ff") (normal-inner-background   "#282a36")
      (normal-center-foreground  "#57c7ff") (normal-center-background  "#282a36")

      (insert-outer-foreground   "#282a36") (insert-outer-background   "#5af78e")
      (insert-inner-foreground   "#5af78e") (insert-inner-background   "#282a36")
      (insert-center-foreground  "#5af78e") (insert-center-background  "#282a36")

      (visual-outer-foreground   "#282a36") (visual-outer-background   "#f3f99d")
      (visual-inner-foreground   "#f3f99d") (visual-inner-background   "#282a36")
      (visual-center-foreground  "#f3f99d") (visual-center-background  "#282a36")

      (replace-outer-foreground  "#282a36") (replace-outer-background  "#ff5c57")
      (replace-inner-foreground  "#ff5c57") (replace-inner-background  "#282a36")
      (replace-center-foreground "#ff5c57") (replace-center-background "#282a36")

      (emacs-outer-foreground    "#282a36") (emacs-outer-background    "#57c7ff")
      (emacs-inner-foreground    "#57c7ff") (emacs-inner-background    "#282a36")
      (emacs-center-foreground   "#57c7ff") (emacs-center-background   "#282a36")

      (inactive1-foreground      "#282a36") (inactive1-background      "#282a36")
      (inactive2-foreground      "#57c7ff") (inactive2-background      "#282a36")
      (inactive3-foreground      "#57c7ff") (inactive3-background      "#282a36"))

  (airline-themes-set-deftheme 'airline-base16_snazzy)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_snazzy)
;;; airline-base16_snazzy-theme.el ends here
