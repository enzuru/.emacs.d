
;;; Code:

(deftheme airline-understated
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#FFFFFF") (normal-outer-background   "#5F87FF")
      (normal-inner-foreground   "#AFAF87") (normal-inner-background   "#5F5F5F")
      (normal-center-foreground  "#AFAF87") (normal-center-background  "#5F5F5F")

      (insert-outer-foreground   "#FFFFFF") (insert-outer-background   "#87AF5F")
      (insert-inner-foreground   "#AFAF87") (insert-inner-background   "#5F5F5F")
      (insert-center-foreground  "#AFAF87") (insert-center-background  "#5F5F5F")

      (visual-outer-foreground   "#FFFFFF") (visual-outer-background   "#AF5F00")
      (visual-inner-foreground   "#AFAF87") (visual-inner-background   "#5F5F5F")
      (visual-center-foreground  "#AFAF87") (visual-center-background  "#5F5F5F")

      (replace-outer-foreground  "#FFFFFF") (replace-outer-background  "#870000")
      (replace-inner-foreground  "#AFAF87") (replace-inner-background  "#5F5F5F")
      (replace-center-foreground "#AFAF87") (replace-center-background "#5F5F5F")

      (emacs-outer-foreground    "#FFFFFF") (emacs-outer-background    "#5F87FF")
      (emacs-inner-foreground    "#AFAF87") (emacs-inner-background    "#5F5F5F")
      (emacs-center-foreground   "#AFAF87") (emacs-center-background   "#5F5F5F")

      (inactive1-foreground      "#4E4E4E") (inactive1-background      "#1C1C1C")
      (inactive2-foreground      "#4E4E4E") (inactive2-background      "#1C1C1C")
      (inactive3-foreground      "#4E4E4E") (inactive3-background      "#1C1C1C"))

  (airline-themes-set-deftheme 'airline-understated)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-understated)
;;; airline-understated-theme.el ends here
