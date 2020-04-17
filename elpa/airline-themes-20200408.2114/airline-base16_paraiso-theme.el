
;;; Code:

(deftheme airline-base16_paraiso
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#41323f") (normal-outer-background   "#48b685")
      (normal-inner-foreground   "#b9b6b0") (normal-inner-background   "#4f424c")
      (normal-center-foreground  "#f99b15") (normal-center-background  "#41323f")

      (insert-outer-foreground   "#41323f") (insert-outer-background   "#06b6ef")
      (insert-inner-foreground   "#b9b6b0") (insert-inner-background   "#4f424c")
      (insert-center-foreground  "#f99b15") (insert-center-background  "#41323f")

      (visual-outer-foreground   "#41323f") (visual-outer-background   "#815ba4")
      (visual-inner-foreground   "#b9b6b0") (visual-inner-background   "#4f424c")
      (visual-center-foreground  "#f99b15") (visual-center-background  "#41323f")

      (replace-outer-foreground  "#41323f") (replace-outer-background  "#ef6155")
      (replace-inner-foreground  "#b9b6b0") (replace-inner-background  "#4f424c")
      (replace-center-foreground "#f99b15") (replace-center-background "#41323f")

      (emacs-outer-foreground    "#41323f") (emacs-outer-background    "#48b685")
      (emacs-inner-foreground    "#b9b6b0") (emacs-inner-background    "#4f424c")
      (emacs-center-foreground   "#f99b15") (emacs-center-background   "#41323f")

      (inactive1-foreground      "#a39e9b") (inactive1-background      "#41323f")
      (inactive2-foreground      "#a39e9b") (inactive2-background      "#41323f")
      (inactive3-foreground      "#a39e9b") (inactive3-background      "#41323f"))

  (airline-themes-set-deftheme 'airline-base16_paraiso)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_paraiso)
;;; airline-base16_paraiso-theme.el ends here
