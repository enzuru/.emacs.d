
;;; Code:

(deftheme airline-ouo
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#FFFFFF") (normal-outer-background   "#005FFF")
      (normal-inner-foreground   "#AFAF87") (normal-inner-background   "#3A3A3A")
      (normal-center-foreground  "#00AFFF") (normal-center-background  "#1C1C1C")

      (insert-outer-foreground   "#FFFFFF") (insert-outer-background   "#5FAF00")
      (insert-inner-foreground   "#AFAF87") (insert-inner-background   "#3A3A3A")
      (insert-center-foreground  "#5FAF00") (insert-center-background  "#1C1C1C")

      (visual-outer-foreground   "#FFFFFF") (visual-outer-background   "#D75F00")
      (visual-inner-foreground   "#AFAF87") (visual-inner-background   "#3A3A3A")
      (visual-center-foreground  "#D75F00") (visual-center-background  "#1C1C1C")

      (replace-outer-foreground  "#FFFFFF") (replace-outer-background  "#D70000")
      (replace-inner-foreground  "#AFAF87") (replace-inner-background  "#3A3A3A")
      (replace-center-foreground "#AFAF87") (replace-center-background "#1C1C1C")

      (emacs-outer-foreground    "#FFFFFF") (emacs-outer-background    "#005FFF")
      (emacs-inner-foreground    "#AFAF87") (emacs-inner-background    "#3A3A3A")
      (emacs-center-foreground   "#00AFFF") (emacs-center-background   "#1C1C1C")

      (inactive1-foreground      "#4E4E4E") (inactive1-background      "#1C1C1C")
      (inactive2-foreground      "#4E4E4E") (inactive2-background      "#1C1C1C")
      (inactive3-foreground      "#4E4E4E") (inactive3-background      "#1C1C1C"))

  (airline-themes-set-deftheme 'airline-ouo)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-ouo)
;;; airline-ouo-theme.el ends here
