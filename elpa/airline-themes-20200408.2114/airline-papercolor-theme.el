
;;; Code:

(deftheme airline-papercolor
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#585858") (normal-outer-background   "#e4e4e4")
      (normal-inner-foreground   "#e4e4e4") (normal-inner-background   "#0087af")
      (normal-center-foreground  "#eeeeee") (normal-center-background  "#005f87")

      (insert-outer-foreground   "#585858") (insert-outer-background   "#e4e4e4")
      (insert-inner-foreground   "#e4e4e4") (insert-inner-background   "#0087af")
      (insert-center-foreground  "#eeeeee") (insert-center-background  "#005f87")

      (visual-outer-foreground   "#005f87") (visual-outer-background   "#e4e4e4")
      (visual-inner-foreground   "#e4e4e4") (visual-inner-background   "#0087af")
      (visual-center-foreground  "#e4e4e4") (visual-center-background  "#005f87")

      (replace-outer-foreground  "#d7005f") (replace-outer-background  "#e4e4e4")
      (replace-inner-foreground  "#e4e4e4") (replace-inner-background  "#0087af")
      (replace-center-foreground "#eeeeee") (replace-center-background "#005f87")

      (emacs-outer-foreground    "#585858") (emacs-outer-background    "#e4e4e4")
      (emacs-inner-foreground    "#e4e4e4") (emacs-inner-background    "#0087af")
      (emacs-center-foreground   "#eeeeee") (emacs-center-background   "#005f87")

      (inactive1-foreground      "#585858") (inactive1-background      "#e4e4e4")
      (inactive2-foreground      "#585858") (inactive2-background      "#e4e4e4")
      (inactive3-foreground      "#585858") (inactive3-background      "#e4e4e4"))

  (airline-themes-set-deftheme 'airline-papercolor)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-papercolor)
;;; airline-papercolor-theme.el ends here
