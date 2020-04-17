
;;; Code:

(deftheme airline-base16_isotope
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#404040") (normal-outer-background   "#33ff00")
      (normal-inner-foreground   "#e0e0e0") (normal-inner-background   "#606060")
      (normal-center-foreground  "#ff9900") (normal-center-background  "#404040")

      (insert-outer-foreground   "#404040") (insert-outer-background   "#0066ff")
      (insert-inner-foreground   "#e0e0e0") (insert-inner-background   "#606060")
      (insert-center-foreground  "#ff9900") (insert-center-background  "#404040")

      (visual-outer-foreground   "#404040") (visual-outer-background   "#cc00ff")
      (visual-inner-foreground   "#e0e0e0") (visual-inner-background   "#606060")
      (visual-center-foreground  "#ff9900") (visual-center-background  "#404040")

      (replace-outer-foreground  "#404040") (replace-outer-background  "#ff0000")
      (replace-inner-foreground  "#e0e0e0") (replace-inner-background  "#606060")
      (replace-center-foreground "#ff9900") (replace-center-background "#404040")

      (emacs-outer-foreground    "#404040") (emacs-outer-background    "#33ff00")
      (emacs-inner-foreground    "#e0e0e0") (emacs-inner-background    "#606060")
      (emacs-center-foreground   "#ff9900") (emacs-center-background   "#404040")

      (inactive1-foreground      "#d0d0d0") (inactive1-background      "#404040")
      (inactive2-foreground      "#d0d0d0") (inactive2-background      "#404040")
      (inactive3-foreground      "#d0d0d0") (inactive3-background      "#404040"))

  (airline-themes-set-deftheme 'airline-base16_isotope)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_isotope)
;;; airline-base16_isotope-theme.el ends here
