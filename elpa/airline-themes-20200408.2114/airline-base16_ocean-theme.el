
;;; Code:

(deftheme airline-base16_ocean
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#343d46") (normal-outer-background   "#a3be8c")
      (normal-inner-foreground   "#dfe1e8") (normal-inner-background   "#4f5b66")
      (normal-center-foreground  "#d08770") (normal-center-background  "#343d46")

      (insert-outer-foreground   "#343d46") (insert-outer-background   "#8fa1b3")
      (insert-inner-foreground   "#dfe1e8") (insert-inner-background   "#4f5b66")
      (insert-center-foreground  "#d08770") (insert-center-background  "#343d46")

      (visual-outer-foreground   "#343d46") (visual-outer-background   "#b48ead")
      (visual-inner-foreground   "#dfe1e8") (visual-inner-background   "#4f5b66")
      (visual-center-foreground  "#d08770") (visual-center-background  "#343d46")

      (replace-outer-foreground  "#343d46") (replace-outer-background  "#bf616a")
      (replace-inner-foreground  "#dfe1e8") (replace-inner-background  "#4f5b66")
      (replace-center-foreground "#d08770") (replace-center-background "#343d46")

      (emacs-outer-foreground    "#343d46") (emacs-outer-background    "#a3be8c")
      (emacs-inner-foreground    "#dfe1e8") (emacs-inner-background    "#4f5b66")
      (emacs-center-foreground   "#d08770") (emacs-center-background   "#343d46")

      (inactive1-foreground      "#c0c5ce") (inactive1-background      "#343d46")
      (inactive2-foreground      "#c0c5ce") (inactive2-background      "#343d46")
      (inactive3-foreground      "#c0c5ce") (inactive3-background      "#343d46"))

  (airline-themes-set-deftheme 'airline-base16_ocean)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_ocean)
;;; airline-base16_ocean-theme.el ends here
