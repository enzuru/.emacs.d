;;; Code:

(deftheme airline-gruvbox-dark
  "source: https://github.com/morhetz/gruvbox/blob/master/autoload/airline/themes/gruvbox.vim")

(let ((normal-outer-foreground  "#282828") (normal-outer-background  "#a89984")
      (normal-inner-foreground  "#ebdbb2") (normal-inner-background  "#3c3836")
      (normal-center-foreground "#ebdbb2") (normal-center-background "#665c54")

      (insert-outer-foreground  "#282828") (insert-outer-background  "#83a598")
      (insert-inner-foreground  "#ebdbb2") (insert-inner-background  "#3c3836")
      (insert-center-foreground "#ebdbb2") (insert-center-background "#665c54")

      (visual-outer-foreground  "#282828") (visual-outer-background  "#fd971f")
      (visual-inner-foreground  "#ebdbb2") (visual-inner-background  "#3c3836")
      (visual-center-foreground "#282828") (visual-center-background "#bdae93")

      (replace-outer-foreground  "#282828") (replace-outer-background  "#8ec07c")
      (replace-inner-foreground  "#ebdbb2") (replace-inner-background  "#3c3836")
      (replace-center-foreground "#ebdbb2") (replace-center-background "#665c54")

      (emacs-outer-foreground  "#282828") (emacs-outer-background  "#5f00af")
      (emacs-inner-foreground  "#ebdbb2") (emacs-inner-background  "#3c3836")
      (emacs-center-foreground "#ebdbb2") (emacs-center-background "#665c54")

      (inactive1-foreground "#1d2021") (inactive1-background "#282828")
      (inactive2-foreground "#282828") (inactive2-background "#3c3836")
      (inactive3-foreground "#282828") (inactive3-background "#665c54"))

  (airline-themes-set-deftheme 'airline-gruvbox-dark)

  (when airline-cursor-colors
    (progn
     (setq evil-emacs-state-cursor   emacs-outer-background)
     (setq evil-normal-state-cursor  normal-outer-background)
     (setq evil-insert-state-cursor  `(bar ,insert-outer-background))
     (setq evil-replace-state-cursor replace-outer-background)
     (setq evil-visual-state-cursor  visual-outer-background)))
  )

(airline-themes-set-modeline)

(provide-theme 'airline-gruvbox-dark)
;;; airline-gruvbox-dark-theme.el ends here
