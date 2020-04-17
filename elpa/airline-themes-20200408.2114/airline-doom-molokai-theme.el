;;; airline-doom-molokai --- Summary
;;; Commentary:
;;; Code:

(deftheme airline-doom-molokai
  "source: https://github.com/hlissner/emacs-doom-theme")

(let ((normal-outer-foreground   "#1B2229") (normal-outer-background   "#fd971f")
      (normal-inner-foreground   "#ffffff") (normal-inner-background   "#2d2d2d")
      (normal-center-foreground  "#ffffff") (normal-center-background  "#2d2d2d")

      (insert-outer-foreground   "#1B2229") (insert-outer-background   "#b6e63e")
      (insert-inner-foreground   "#ffffff") (insert-inner-background   "#2d2d2d")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#2d2d2d")

      (visual-outer-foreground   "#1B2229") (visual-outer-background   "#66d9ef")
      (visual-inner-foreground   "#ffffff") (visual-inner-background   "#2d2d2d")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#2d2d2d")

      (replace-outer-foreground  "#1B2229") (replace-outer-background  "#e74c3c")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#2d2d2d")
      (replace-center-foreground "#ffffff") (replace-center-background "#2d2d2d")

      (emacs-outer-foreground    "#1B2229") (emacs-outer-background    "#9c91e4")
      (emacs-inner-foreground    "#ffffff") (emacs-inner-background    "#2d2d2d")
      (emacs-center-foreground   "#ffffff") (emacs-center-background   "#2d2d2d")

      (inactive1-foreground      "#4e4e4e") (inactive1-background      "#191919")
      (inactive2-foreground      "#4e4e4e") (inactive2-background      "#191919")
      (inactive3-foreground      "#4e4e4e") (inactive3-background      "#191919"))

  (airline-themes-set-deftheme 'airline-doom-molokai)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
  )

(airline-themes-set-modeline)

(provide-theme 'airline-doom-molokai)
;;; airline-doom-molokai-theme.el ends here
