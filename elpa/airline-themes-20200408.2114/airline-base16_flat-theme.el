
;;; Code:

(deftheme airline-base16_flat
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#34495E") (normal-outer-background   "#2ECC71")
      (normal-inner-foreground   "#f5f5f5") (normal-inner-background   "#7F8C8D")
      (normal-center-foreground  "#E67E22") (normal-center-background  "#34495E")

      (insert-outer-foreground   "#34495E") (insert-outer-background   "#3498DB")
      (insert-inner-foreground   "#f5f5f5") (insert-inner-background   "#7F8C8D")
      (insert-center-foreground  "#E67E22") (insert-center-background  "#34495E")

      (visual-outer-foreground   "#34495E") (visual-outer-background   "#9B59B6")
      (visual-inner-foreground   "#f5f5f5") (visual-inner-background   "#7F8C8D")
      (visual-center-foreground  "#E67E22") (visual-center-background  "#34495E")

      (replace-outer-foreground  "#34495E") (replace-outer-background  "#E74C3C")
      (replace-inner-foreground  "#f5f5f5") (replace-inner-background  "#7F8C8D")
      (replace-center-foreground "#E67E22") (replace-center-background "#34495E")

      (emacs-outer-foreground    "#34495E") (emacs-outer-background    "#2ECC71")
      (emacs-inner-foreground    "#f5f5f5") (emacs-inner-background    "#7F8C8D")
      (emacs-center-foreground   "#E67E22") (emacs-center-background   "#34495E")

      (inactive1-foreground      "#e0e0e0") (inactive1-background      "#34495E")
      (inactive2-foreground      "#e0e0e0") (inactive2-background      "#34495E")
      (inactive3-foreground      "#e0e0e0") (inactive3-background      "#34495E"))

  (airline-themes-set-deftheme 'airline-base16_flat)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_flat)
;;; airline-base16_flat-theme.el ends here
