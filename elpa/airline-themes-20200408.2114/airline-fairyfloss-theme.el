
;;; Code:

(deftheme airline-fairyfloss
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#f8f8f0") (normal-outer-background   "#ae81ff")
      (normal-inner-foreground   "#f8f8f0") (normal-inner-background   "#49483e")
      (normal-center-foreground  "#3b3a32") (normal-center-background  "#ae81ff")

      (insert-outer-foreground   "#49483e") (insert-outer-background   "#80ffbd")
      (insert-inner-foreground   "#f8f8f0") (insert-inner-background   "#49483e")
      (insert-center-foreground  "#f8f8f0") (insert-center-background  "#49483e")

      (visual-outer-foreground   "#f8f8f0") (visual-outer-background   "#f92672")
      (visual-inner-foreground   "#f8f8f0") (visual-inner-background   "#49483e")
      (visual-center-foreground  "#f8f8f0") (visual-center-background  "#49483e")

      (replace-outer-foreground  "#f92672") (replace-outer-background  "#49483e")
      (replace-inner-foreground  "#f8f8f0") (replace-inner-background  "#49483e")
      (replace-center-foreground "#f8f8f0") (replace-center-background "#49483e")

      (emacs-outer-foreground    "#f8f8f0") (emacs-outer-background    "#ae81ff")
      (emacs-inner-foreground    "#f8f8f0") (emacs-inner-background    "#49483e")
      (emacs-center-foreground   "#3b3a32") (emacs-center-background   "#ae81ff")

      (inactive1-foreground      "#8076aa") (inactive1-background      "#49483e")
      (inactive2-foreground      "#8076aa") (inactive2-background      "#3b3a32")
      (inactive3-foreground      "#8076aa") (inactive3-background      "#3b3a32"))

  (airline-themes-set-deftheme 'airline-fairyfloss)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-fairyfloss)
;;; airline-fairyfloss-theme.el ends here
