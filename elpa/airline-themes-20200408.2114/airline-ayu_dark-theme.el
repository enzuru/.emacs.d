
;;; Code:

(deftheme airline-ayu_dark
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#3D424D") (normal-outer-background   "#C2D94C")
      (normal-inner-foreground   "#C2D94C") (normal-inner-background   "#304357")
      (normal-center-foreground  "#B3B1AD") (normal-center-background  "#0A0E14")

      (insert-outer-foreground   "#3D424D") (insert-outer-background   "#39BAE6")
      (insert-inner-foreground   "#39BAE6") (insert-inner-background   "#304357")
      (insert-center-foreground  "#B3B1AD") (insert-center-background  "#0A0E14")

      (visual-outer-foreground   "#3D424D") (visual-outer-background   "#FF8F40")
      (visual-inner-foreground   "#FF8F40") (visual-inner-background   "#304357")
      (visual-center-foreground  "#B3B1AD") (visual-center-background  "#0A0E14")

      (replace-outer-foreground  "#3D424D") (replace-outer-background  "#FF3333")
      (replace-inner-foreground  "#C2D94C") (replace-inner-background  "#304357")
      (replace-center-foreground "#B3B1AD") (replace-center-background "#0A0E14")

      (emacs-outer-foreground    "#3D424D") (emacs-outer-background    "#C2D94C")
      (emacs-inner-foreground    "#C2D94C") (emacs-inner-background    "#304357")
      (emacs-center-foreground   "#B3B1AD") (emacs-center-background   "#0A0E14")

      (inactive1-foreground      "#C2D94C") (inactive1-background      "#0A0E14")
      (inactive2-foreground      "#C2D94C") (inactive2-background      "#0A0E14")
      (inactive3-foreground      "#C2D94C") (inactive3-background      "#0A0E14"))

  (airline-themes-set-deftheme 'airline-ayu_dark)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-ayu_dark)
;;; airline-ayu_dark-theme.el ends here
