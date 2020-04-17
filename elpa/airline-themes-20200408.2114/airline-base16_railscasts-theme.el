
;;; Code:

(deftheme airline-base16_railscasts
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#272935") (normal-outer-background   "#a5c261")
      (normal-inner-foreground   "#f4f1ed") (normal-inner-background   "#3a4055")
      (normal-center-foreground  "#cc7833") (normal-center-background  "#272935")

      (insert-outer-foreground   "#272935") (insert-outer-background   "#6d9cbe")
      (insert-inner-foreground   "#f4f1ed") (insert-inner-background   "#3a4055")
      (insert-center-foreground  "#cc7833") (insert-center-background  "#272935")

      (visual-outer-foreground   "#272935") (visual-outer-background   "#b6b3eb")
      (visual-inner-foreground   "#f4f1ed") (visual-inner-background   "#3a4055")
      (visual-center-foreground  "#cc7833") (visual-center-background  "#272935")

      (replace-outer-foreground  "#272935") (replace-outer-background  "#da4939")
      (replace-inner-foreground  "#f4f1ed") (replace-inner-background  "#3a4055")
      (replace-center-foreground "#cc7833") (replace-center-background "#272935")

      (emacs-outer-foreground    "#272935") (emacs-outer-background    "#a5c261")
      (emacs-inner-foreground    "#f4f1ed") (emacs-inner-background    "#3a4055")
      (emacs-center-foreground   "#cc7833") (emacs-center-background   "#272935")

      (inactive1-foreground      "#e6e1dc") (inactive1-background      "#272935")
      (inactive2-foreground      "#e6e1dc") (inactive2-background      "#272935")
      (inactive3-foreground      "#e6e1dc") (inactive3-background      "#272935"))

  (airline-themes-set-deftheme 'airline-base16_railscasts)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_railscasts)
;;; airline-base16_railscasts-theme.el ends here
