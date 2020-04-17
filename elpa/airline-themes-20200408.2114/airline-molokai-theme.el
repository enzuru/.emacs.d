
;;; Code:

(deftheme airline-molokai
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#080808") (normal-outer-background   "#e6db74")
      (normal-inner-foreground   "#f8f8f0") (normal-inner-background   "#232526")
      (normal-center-foreground  "#f8f8f0") (normal-center-background  "#465457")

      (insert-outer-foreground   "#080808") (insert-outer-background   "#66d9ef")
      (insert-inner-foreground   "#f8f8f0") (insert-inner-background   "#232526")
      (insert-center-foreground  "#f8f8f0") (insert-center-background  "#465457")

      (visual-outer-foreground   "#080808") (visual-outer-background   "#a6e22e")
      (visual-inner-foreground   "#f8f8f0") (visual-inner-background   "#232526")
      (visual-center-foreground  "#f8f8f0") (visual-center-background  "#465457")

      (replace-outer-foreground  "#080808") (replace-outer-background  "#f92672")
      (replace-inner-foreground  "#f8f8f0") (replace-inner-background  "#232526")
      (replace-center-foreground "#f8f8f0") (replace-center-background "#465457")

      (emacs-outer-foreground    "#080808") (emacs-outer-background    "#e6db74")
      (emacs-inner-foreground    "#f8f8f0") (emacs-inner-background    "#232526")
      (emacs-center-foreground   "#f8f8f0") (emacs-center-background   "#465457")

      (inactive1-foreground      "#1b1d1e") (inactive1-background      "#465457")
      (inactive2-foreground      "#1b1d1e") (inactive2-background      "#465457")
      (inactive3-foreground      "#1b1d1e") (inactive3-background      "#465457"))

  (airline-themes-set-deftheme 'airline-molokai)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-molokai)
;;; airline-molokai-theme.el ends here
