
;;; Code:

(deftheme airline-base16-shell-dark
  "source: https://github.com/bling/vim-airline/blob/master/autoload/airline/themes/base16.vim")

(if (display-graphic-p)
    (message "This theme is designed for use in terminal emacs only")
  (progn
    (let ((normal-outer-foreground  "color-18") (normal-outer-background  "blue")
          (normal-inner-foreground  "color-20") (normal-inner-background  "color-19")
          (normal-center-foreground "color-20") (normal-center-background "color-18")

          (insert-outer-foreground  "color-18") (insert-outer-background  "green")
          (insert-inner-foreground  "green")    (insert-inner-background  "black")
          (insert-center-foreground "color-20") (insert-center-background "color-18")

          (visual-outer-foreground  "color-18") (visual-outer-background  "color-16")
          (visual-inner-foreground  "color-16") (visual-inner-background  "black")
          (visual-center-foreground "color-20") (visual-center-background "color-18")

          (replace-outer-foreground  "color-18") (replace-outer-background  "red")
          (replace-inner-foreground  "color-20") (replace-inner-background  "color-19")
          (replace-center-foreground "color-20") (replace-center-background "color-18")

          (emacs-outer-foreground  "color-18") (emacs-outer-background  "magenta")
          (emacs-inner-foreground  "color-20") (emacs-inner-background  "color-19")
          (emacs-center-foreground "color-20") (emacs-center-background "color-18")

          (inactive1-foreground "color-19") (inactive1-background "color-18")
          (inactive2-foreground "color-19") (inactive2-background "color-18")
          (inactive3-foreground "color-19") (inactive3-background "color-18"))

      (airline-themes-set-deftheme 'airline-base16-shell-dark)

      (when airline-cursor-colors
        (progn
          (setq evil-emacs-state-cursor   emacs-outer-background)
          (setq evil-normal-state-cursor  normal-outer-background)
          (setq evil-insert-state-cursor  `(bar ,insert-outer-background))
          (setq evil-replace-state-cursor replace-outer-background)
          (setq evil-visual-state-cursor  visual-outer-background)))
      )

    (airline-themes-set-modeline)))

(provide-theme 'airline-base16-shell-dark)
;;; airline-base16-shell-dark-theme.el ends here
