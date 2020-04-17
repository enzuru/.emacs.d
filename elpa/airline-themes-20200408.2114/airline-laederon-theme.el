
;;; Code:

(deftheme airline-laederon
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#081c8c") (normal-outer-background   "#f8f6f2")
      (normal-inner-foreground   "#1693a5") (normal-inner-background   "#f8f6f2")
      (normal-center-foreground  "#90a680") (normal-center-background  "#2e2d2a")

      (insert-outer-foreground   "#f8f6f2") (insert-outer-background   "#ab3e5b")
      (insert-inner-foreground   "#242321") (insert-inner-background   "#ab3e5b")
      (insert-center-foreground  "#1693a5") (insert-center-background  "#f8f6f2")

      (visual-outer-foreground   "#005f00") (visual-outer-background   "#f8f6f2")
      (visual-inner-foreground   "#f8f6f2") (visual-inner-background   "#005f00")
      (visual-center-foreground  "#594512") (visual-center-background  "#f8f6f2")

      (replace-outer-foreground  "#90a680") (replace-outer-background  "#f8f6f2")
      (replace-inner-foreground  "#90a680") (replace-inner-background  "#242321")
      (replace-center-foreground "#f8f6f2") (replace-center-background "#90a680")

      (emacs-outer-foreground    "#081c8c") (emacs-outer-background    "#f8f6f2")
      (emacs-inner-foreground    "#1693a5") (emacs-inner-background    "#f8f6f2")
      (emacs-center-foreground   "#90a680") (emacs-center-background   "#2e2d2a")

      (inactive1-foreground      "#f8f6f2") (inactive1-background      "#2e2d2a")
      (inactive2-foreground      "#f8f6f2") (inactive2-background      "#2e2d2a")
      (inactive3-foreground      "#f8f6f2") (inactive3-background      "#2e2d2a"))

  (airline-themes-set-deftheme 'airline-laederon)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-laederon)
;;; airline-laederon-theme.el ends here
