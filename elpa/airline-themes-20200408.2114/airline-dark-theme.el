
;;; Code:

(deftheme airline-dark
  "source: https://github.com/bling/vim-airline/blob/master/autoload/airline/themes/dark.vim")

(let ((normal-outer-foreground  "#00005f") (normal-outer-background  "#dfff00")
      (normal-inner-foreground  "#ffffff") (normal-inner-background  "#444444")
      (normal-center-foreground "#9cffd3") (normal-center-background "#202020")

      (insert-outer-foreground  "#00005f") (insert-outer-background  "#00dfff")
      (insert-inner-foreground  "#ffffff") (insert-inner-background  "#005fff")
      (insert-center-foreground "#ffffff") (insert-center-background "#000080")

      (visual-outer-foreground  "#000000") (visual-outer-background  "#ffaf00")
      (visual-inner-foreground  "#000000") (visual-inner-background  "#ff5f00")
      (visual-center-foreground "#ffffff") (visual-center-background "#5f0000")

      (replace-outer-foreground  "#ffffff") (replace-outer-background  "#af0000")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#444444")
      (replace-center-foreground "#9cffd3") (replace-center-background "#202020")

      (emacs-outer-foreground  "#d7d7ff") (emacs-outer-background  "#5f00af")
      (emacs-inner-foreground  "#ffffff") (emacs-inner-background  "#444444")
      (emacs-center-foreground "#9cffd3") (emacs-center-background "#202020")

      (inactive1-foreground "#4e4e4e") (inactive1-background "#1c1c1c")
      (inactive2-foreground "#4e4e4e") (inactive2-background "#262626")
      (inactive3-foreground "#4e4e4e") (inactive3-background "#262626"))

  (airline-themes-set-deftheme 'airline-dark)

  (when airline-cursor-colors
    (progn
     (setq evil-emacs-state-cursor   emacs-outer-background)
     (setq evil-normal-state-cursor  normal-outer-background)
     (setq evil-insert-state-cursor  `(bar ,insert-outer-background))
     (setq evil-replace-state-cursor replace-outer-background)
     (setq evil-visual-state-cursor  visual-outer-background)))
)

(airline-themes-set-modeline)

(provide-theme 'airline-dark)
;;; airline-dark-theme.el ends here
