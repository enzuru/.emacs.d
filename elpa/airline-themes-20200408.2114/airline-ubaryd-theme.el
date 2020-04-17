
;;; Code:

(deftheme airline-ubaryd
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#005f00") (normal-outer-background   "#f8f6f2")
      (normal-inner-foreground   "#f8f6f2") (normal-inner-background   "#005f00")
      (normal-center-foreground  "#b88853") (normal-center-background  "#242321")

      (insert-outer-foreground   "#f8f6f2") (insert-outer-background   "#e25a74")
      (insert-inner-foreground   "#242321") (insert-inner-background   "#c14c3d")
      (insert-center-foreground  "#f4cf86") (insert-center-background  "#242321")

      (visual-outer-foreground   "#416389") (visual-outer-background   "#f8f6f2")
      (visual-inner-foreground   "#416389") (visual-inner-background   "#f4cf86")
      (visual-center-foreground  "#9a4820") (visual-center-background  "#f8f6f2")

      (replace-outer-foreground  "#242321") (replace-outer-background  "#f8f6f2")
      (replace-inner-foreground  "#ffa724") (replace-inner-background  "#666462")
      (replace-center-foreground "#f8f6f2") (replace-center-background "#ff7400")

      (emacs-outer-foreground    "#005f00") (emacs-outer-background    "#f8f6f2")
      (emacs-inner-foreground    "#f8f6f2") (emacs-inner-background    "#005f00")
      (emacs-center-foreground   "#b88853") (emacs-center-background   "#242321")

      (inactive1-foreground      "#005f00") (inactive1-background      "#242321")
      (inactive2-foreground      "#005f00") (inactive2-background      "#242321")
      (inactive3-foreground      "#005f00") (inactive3-background      "#242321"))

  (airline-themes-set-deftheme 'airline-ubaryd)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-ubaryd)
;;; airline-ubaryd-theme.el ends here
