
;;; Code:

(deftheme airline-sierra
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#ffffff") (normal-outer-background   "#dfaf87")
      (normal-inner-foreground   "#ffffff") (normal-inner-background   "#af5f5f")
      (normal-center-foreground  "#d75f5f") (normal-center-background  "#545454")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#afd7d7")
      (insert-inner-foreground   "#ffffff") (insert-inner-background   "#af5f5f")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#af5f5f")

      (visual-outer-foreground   "#ffffff") (visual-outer-background   "#686868")
      (visual-inner-foreground   "#ffffff") (visual-inner-background   "#af5f5f")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#af5f5f")

      (replace-outer-foreground  "#686868") (replace-outer-background  "#303030")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#af5f5f")
      (replace-center-foreground "#ffffff") (replace-center-background "#af5f5f")

      (emacs-outer-foreground    "#ffffff") (emacs-outer-background    "#dfaf87")
      (emacs-inner-foreground    "#ffffff") (emacs-inner-background    "#af5f5f")
      (emacs-center-foreground   "#d75f5f") (emacs-center-background   "#545454")

      (inactive1-foreground      "#666666") (inactive1-background      "#af5f5f")
      (inactive2-foreground      "#d75f5f") (inactive2-background      "#2a2a2a")
      (inactive3-foreground      "#d75f5f") (inactive3-background      "#2a2a2a"))

  (airline-themes-set-deftheme 'airline-sierra)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-sierra)
;;; airline-sierra-theme.el ends here
