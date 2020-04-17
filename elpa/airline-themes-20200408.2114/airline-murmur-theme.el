
;;; Code:

(deftheme airline-murmur
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#FFFFFF") (normal-outer-background   "#5F87FF")
      (normal-inner-foreground   "#AFAF87") (normal-inner-background   "#5F5F5F")
      (normal-center-foreground  "#F5F5F5") (normal-center-background  "#1C1C1C")

      (insert-outer-foreground   "#FFFFFF") (insert-outer-background   "#87AF5F")
      (insert-inner-foreground   "#AFAF87") (insert-inner-background   "#5F5F5F")
      (insert-center-foreground  "#87AF5F") (insert-center-background  "#1C1C1C")

      (visual-outer-foreground   "#FFFFFF") (visual-outer-background   "#ff8c00")
      (visual-inner-foreground   "#AFAF87") (visual-inner-background   "#5F5F5F")
      (visual-center-foreground  "#ff8c00") (visual-center-background  "#1C1C1C")

      (replace-outer-foreground  "#FFFFFF") (replace-outer-background  "#870000")
      (replace-inner-foreground  "#AFAF87") (replace-inner-background  "#5F5F5F")
      (replace-center-foreground "#AFAF87") (replace-center-background "#1C1C1C")

      (emacs-outer-foreground    "#FFFFFF") (emacs-outer-background    "#5F87FF")
      (emacs-inner-foreground    "#AFAF87") (emacs-inner-background    "#5F5F5F")
      (emacs-center-foreground   "#F5F5F5") (emacs-center-background   "#1C1C1C")

      (inactive1-foreground      "#4E4E4E") (inactive1-background      "#1C1C1C")
      (inactive2-foreground      "#4E4E4E") (inactive2-background      "#1C1C1C")
      (inactive3-foreground      "#4E4E4E") (inactive3-background      "#1C1C1C"))

  (airline-themes-set-deftheme 'airline-murmur)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-murmur)
;;; airline-murmur-theme.el ends here
