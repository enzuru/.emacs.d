
;;; Code:

(deftheme airline-alduin
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#ffdf87") (normal-outer-background   "#5f5f87")
      (normal-inner-foreground   "#ffffff") (normal-inner-background   "#af8787")
      (normal-center-foreground  "#dfaf87") (normal-center-background  "#545454")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#878787")
      (insert-inner-foreground   "#ffffff") (insert-inner-background   "#af8787")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#af8787")

      (visual-outer-foreground   "#ffffff") (visual-outer-background   "#87875f")
      (visual-inner-foreground   "#ffffff") (visual-inner-background   "#af8787")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#af8787")

      (replace-outer-foreground  "#87875f") (replace-outer-background  "#1c1c1c")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#af8787")
      (replace-center-foreground "#ffffff") (replace-center-background "#af8787")

      (emacs-outer-foreground    "#ffdf87") (emacs-outer-background    "#5f5f87")
      (emacs-inner-foreground    "#ffffff") (emacs-inner-background    "#af8787")
      (emacs-center-foreground   "#dfaf87") (emacs-center-background   "#545454")

      (inactive1-foreground      "#666666") (inactive1-background      "#af8787")
      (inactive2-foreground      "#dfaf87") (inactive2-background      "#2a2a2a")
      (inactive3-foreground      "#dfaf87") (inactive3-background      "#2a2a2a"))

  (airline-themes-set-deftheme 'airline-alduin)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-alduin)
;;; airline-alduin-theme.el ends here
