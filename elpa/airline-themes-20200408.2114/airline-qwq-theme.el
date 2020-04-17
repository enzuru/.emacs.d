
;;; Code:

(deftheme airline-qwq
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#0E3B4F") (normal-outer-background   "#FFEEE5")
      (normal-inner-foreground   "#0E3B4F") (normal-inner-background   "#FFD3CB")
      (normal-center-foreground  "#ffffff") (normal-center-background  "#F7846E")

      (insert-outer-foreground   "#0E3B4F") (insert-outer-background   "#FFF5D9")
      (insert-inner-foreground   "#0E3B4F") (insert-inner-background   "#DDE58E")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#9ED47B")

      (visual-outer-foreground   "#0E3B4F") (visual-outer-background   "#FFEEE5")
      (visual-inner-foreground   "#0E3B4F") (visual-inner-background   "#FF9DA5")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#FF5B6F")

      (replace-outer-foreground  "#0E3B4F") (replace-outer-background  "#C1F9CD")
      (replace-inner-foreground  "#0E3B4F") (replace-inner-background  "#8BEFC7")
      (replace-center-foreground "#ffffff") (replace-center-background "#04BEC3")

      (emacs-outer-foreground    "#0E3B4F") (emacs-outer-background    "#FFEEE5")
      (emacs-inner-foreground    "#0E3B4F") (emacs-inner-background    "#FFD3CB")
      (emacs-center-foreground   "#ffffff") (emacs-center-background   "#F7846E")

      (inactive1-foreground      "#0E3B4F") (inactive1-background      "#FEFCF9")
      (inactive2-foreground      "#0E3B4F") (inactive2-background      "#DDC6AF")
      (inactive3-foreground      "#ffffff") (inactive3-background      "#A28E79"))

  (airline-themes-set-deftheme 'airline-qwq)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-qwq)
;;; airline-qwq-theme.el ends here
