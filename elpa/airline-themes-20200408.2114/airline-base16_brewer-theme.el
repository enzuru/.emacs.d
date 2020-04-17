
;;; Code:

(deftheme airline-base16_brewer
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#2e2f30") (normal-outer-background   "#31a354")
      (normal-inner-foreground   "#dadbdc") (normal-inner-background   "#515253")
      (normal-center-foreground  "#e6550d") (normal-center-background  "#2e2f30")

      (insert-outer-foreground   "#2e2f30") (insert-outer-background   "#3182bd")
      (insert-inner-foreground   "#dadbdc") (insert-inner-background   "#515253")
      (insert-center-foreground  "#e6550d") (insert-center-background  "#2e2f30")

      (visual-outer-foreground   "#2e2f30") (visual-outer-background   "#756bb1")
      (visual-inner-foreground   "#dadbdc") (visual-inner-background   "#515253")
      (visual-center-foreground  "#e6550d") (visual-center-background  "#2e2f30")

      (replace-outer-foreground  "#2e2f30") (replace-outer-background  "#e31a1c")
      (replace-inner-foreground  "#dadbdc") (replace-inner-background  "#515253")
      (replace-center-foreground "#e6550d") (replace-center-background "#2e2f30")

      (emacs-outer-foreground    "#2e2f30") (emacs-outer-background    "#31a354")
      (emacs-inner-foreground    "#dadbdc") (emacs-inner-background    "#515253")
      (emacs-center-foreground   "#e6550d") (emacs-center-background   "#2e2f30")

      (inactive1-foreground      "#b7b8b9") (inactive1-background      "#2e2f30")
      (inactive2-foreground      "#b7b8b9") (inactive2-background      "#2e2f30")
      (inactive3-foreground      "#b7b8b9") (inactive3-background      "#2e2f30"))

  (airline-themes-set-deftheme 'airline-base16_brewer)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_brewer)
;;; airline-base16_brewer-theme.el ends here
