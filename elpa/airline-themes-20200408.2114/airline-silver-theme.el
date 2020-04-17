
;;; Code:

(deftheme airline-silver
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#414141") (normal-outer-background   "#e1e1e1")
      (normal-inner-foreground   "#414141") (normal-inner-background   "#e1e1e1")
      (normal-center-foreground  "#414141") (normal-center-background  "#e1e1e1")

      (insert-outer-foreground   "#0d935c") (insert-outer-background   "#e1e1e1")
      (insert-inner-foreground   "#0d935c") (insert-inner-background   "#e1e1e1")
      (insert-center-foreground  "#0d935c") (insert-center-background  "#e1e1e1")

      (visual-outer-foreground   "#0000b3") (visual-outer-background   "#e1e1e1")
      (visual-inner-foreground   "#0000b3") (visual-inner-background   "#e1e1e1")
      (visual-center-foreground  "#0000b3") (visual-center-background  "#e1e1e1")

      (replace-outer-foreground  "#b30000") (replace-outer-background  "#e1e1e1")
      (replace-inner-foreground  "#0d935c") (replace-inner-background  "#e1e1e1")
      (replace-center-foreground "#0d935c") (replace-center-background "#e1e1e1")

      (emacs-outer-foreground    "#414141") (emacs-outer-background    "#e1e1e1")
      (emacs-inner-foreground    "#414141") (emacs-inner-background    "#e1e1e1")
      (emacs-center-foreground   "#414141") (emacs-center-background   "#e1e1e1")

      (inactive1-foreground      "#a1a1a1") (inactive1-background      "#dddddd")
      (inactive2-foreground      "#a1a1a1") (inactive2-background      "#dddddd")
      (inactive3-foreground      "#a1a1a1") (inactive3-background      "#dddddd"))

  (airline-themes-set-deftheme 'airline-silver)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-silver)
;;; airline-silver-theme.el ends here
