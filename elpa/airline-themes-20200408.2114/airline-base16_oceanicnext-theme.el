
;;; Code:

(deftheme airline-base16_oceanicnext
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#343d46") (normal-outer-background   "#99c794")
      (normal-inner-foreground   "#cdd3de") (normal-inner-background   "#4f5b66")
      (normal-center-foreground  "#f99157") (normal-center-background  "#343d46")

      (insert-outer-foreground   "#343d46") (insert-outer-background   "#6699cc")
      (insert-inner-foreground   "#cdd3de") (insert-inner-background   "#4f5b66")
      (insert-center-foreground  "#f99157") (insert-center-background  "#343d46")

      (visual-outer-foreground   "#343d46") (visual-outer-background   "#c594c5")
      (visual-inner-foreground   "#cdd3de") (visual-inner-background   "#4f5b66")
      (visual-center-foreground  "#f99157") (visual-center-background  "#343d46")

      (replace-outer-foreground  "#343d46") (replace-outer-background  "#ec5f67")
      (replace-inner-foreground  "#cdd3de") (replace-inner-background  "#4f5b66")
      (replace-center-foreground "#f99157") (replace-center-background "#343d46")

      (emacs-outer-foreground    "#343d46") (emacs-outer-background    "#99c794")
      (emacs-inner-foreground    "#cdd3de") (emacs-inner-background    "#4f5b66")
      (emacs-center-foreground   "#f99157") (emacs-center-background   "#343d46")

      (inactive1-foreground      "#c0c5ce") (inactive1-background      "#343d46")
      (inactive2-foreground      "#c0c5ce") (inactive2-background      "#343d46")
      (inactive3-foreground      "#c0c5ce") (inactive3-background      "#343d46"))

  (airline-themes-set-deftheme 'airline-base16_oceanicnext)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_oceanicnext)
;;; airline-base16_oceanicnext-theme.el ends here
