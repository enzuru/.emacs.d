
;;; Code:

(deftheme airline-base16_twilight
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#323537") (normal-outer-background   "#8f9d6a")
      (normal-inner-foreground   "#c3c3c3") (normal-inner-background   "#464b50")
      (normal-center-foreground  "#cda869") (normal-center-background  "#323537")

      (insert-outer-foreground   "#323537") (insert-outer-background   "#7587a6")
      (insert-inner-foreground   "#c3c3c3") (insert-inner-background   "#464b50")
      (insert-center-foreground  "#cda869") (insert-center-background  "#323537")

      (visual-outer-foreground   "#323537") (visual-outer-background   "#9b859d")
      (visual-inner-foreground   "#c3c3c3") (visual-inner-background   "#464b50")
      (visual-center-foreground  "#cda869") (visual-center-background  "#323537")

      (replace-outer-foreground  "#323537") (replace-outer-background  "#cf6a4c")
      (replace-inner-foreground  "#c3c3c3") (replace-inner-background  "#464b50")
      (replace-center-foreground "#cda869") (replace-center-background "#323537")

      (emacs-outer-foreground    "#323537") (emacs-outer-background    "#8f9d6a")
      (emacs-inner-foreground    "#c3c3c3") (emacs-inner-background    "#464b50")
      (emacs-center-foreground   "#cda869") (emacs-center-background   "#323537")

      (inactive1-foreground      "#a7a7a7") (inactive1-background      "#323537")
      (inactive2-foreground      "#a7a7a7") (inactive2-background      "#323537")
      (inactive3-foreground      "#a7a7a7") (inactive3-background      "#323537"))

  (airline-themes-set-deftheme 'airline-base16_twilight)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_twilight)
;;; airline-base16_twilight-theme.el ends here
