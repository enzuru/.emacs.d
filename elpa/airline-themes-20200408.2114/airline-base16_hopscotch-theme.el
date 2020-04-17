
;;; Code:

(deftheme airline-base16_hopscotch
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#433b42") (normal-outer-background   "#8fc13e")
      (normal-inner-foreground   "#d5d3d5") (normal-inner-background   "#5c545b")
      (normal-center-foreground  "#fd8b19") (normal-center-background  "#433b42")

      (insert-outer-foreground   "#433b42") (insert-outer-background   "#1290bf")
      (insert-inner-foreground   "#d5d3d5") (insert-inner-background   "#5c545b")
      (insert-center-foreground  "#fd8b19") (insert-center-background  "#433b42")

      (visual-outer-foreground   "#433b42") (visual-outer-background   "#c85e7c")
      (visual-inner-foreground   "#d5d3d5") (visual-inner-background   "#5c545b")
      (visual-center-foreground  "#fd8b19") (visual-center-background  "#433b42")

      (replace-outer-foreground  "#433b42") (replace-outer-background  "#dd464c")
      (replace-inner-foreground  "#d5d3d5") (replace-inner-background  "#5c545b")
      (replace-center-foreground "#fd8b19") (replace-center-background "#433b42")

      (emacs-outer-foreground    "#433b42") (emacs-outer-background    "#8fc13e")
      (emacs-inner-foreground    "#d5d3d5") (emacs-inner-background    "#5c545b")
      (emacs-center-foreground   "#fd8b19") (emacs-center-background   "#433b42")

      (inactive1-foreground      "#b9b5b8") (inactive1-background      "#433b42")
      (inactive2-foreground      "#b9b5b8") (inactive2-background      "#433b42")
      (inactive3-foreground      "#b9b5b8") (inactive3-background      "#433b42"))

  (airline-themes-set-deftheme 'airline-base16_hopscotch)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_hopscotch)
;;; airline-base16_hopscotch-theme.el ends here
