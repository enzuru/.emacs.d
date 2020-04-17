
;;; Code:

(deftheme airline-minimalist
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#E4E4E4") (normal-outer-background   "#3A3A3A")
      (normal-inner-foreground   "#E4E4E4") (normal-inner-background   "#4E4E4E")
      (normal-center-foreground  "#EEEEEE") (normal-center-background  "#262626")

      (insert-outer-foreground   "#E4E4E4") (insert-outer-background   "#3A3A3A")
      (insert-inner-foreground   "#E4E4E4") (insert-inner-background   "#4E4E4E")
      (insert-center-foreground  "#EEEEEE") (insert-center-background  "#262626")

      (visual-outer-foreground   "#E4E4E4") (visual-outer-background   "#3A3A3A")
      (visual-inner-foreground   "#E4E4E4") (visual-inner-background   "#4E4E4E")
      (visual-center-foreground  "#EEEEEE") (visual-center-background  "#262626")

      (replace-outer-foreground  "#E4E4E4") (replace-outer-background  "#3A3A3A")
      (replace-inner-foreground  "#E4E4E4") (replace-inner-background  "#4E4E4E")
      (replace-center-foreground "#EEEEEE") (replace-center-background "#262626")

      (emacs-outer-foreground    "#E4E4E4") (emacs-outer-background    "#3A3A3A")
      (emacs-inner-foreground    "#E4E4E4") (emacs-inner-background    "#4E4E4E")
      (emacs-center-foreground   "#EEEEEE") (emacs-center-background   "#262626")

      (inactive1-foreground      "#666666") (inactive1-background      "#262626")
      (inactive2-foreground      "#666666") (inactive2-background      "#262626")
      (inactive3-foreground      "#666666") (inactive3-background      "#262626"))

  (airline-themes-set-deftheme 'airline-minimalist)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-minimalist)
;;; airline-minimalist-theme.el ends here
