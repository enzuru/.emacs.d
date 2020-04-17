
;;; Code:

(deftheme airline-base16_eighties
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#393939") (normal-outer-background   "#99cc99")
      (normal-inner-foreground   "#e8e6df") (normal-inner-background   "#515151")
      (normal-center-foreground  "#f99157") (normal-center-background  "#393939")

      (insert-outer-foreground   "#393939") (insert-outer-background   "#6699cc")
      (insert-inner-foreground   "#e8e6df") (insert-inner-background   "#515151")
      (insert-center-foreground  "#f99157") (insert-center-background  "#393939")

      (visual-outer-foreground   "#393939") (visual-outer-background   "#cc99cc")
      (visual-inner-foreground   "#e8e6df") (visual-inner-background   "#515151")
      (visual-center-foreground  "#f99157") (visual-center-background  "#393939")

      (replace-outer-foreground  "#393939") (replace-outer-background  "#f2777a")
      (replace-inner-foreground  "#e8e6df") (replace-inner-background  "#515151")
      (replace-center-foreground "#f99157") (replace-center-background "#393939")

      (emacs-outer-foreground    "#393939") (emacs-outer-background    "#99cc99")
      (emacs-inner-foreground    "#e8e6df") (emacs-inner-background    "#515151")
      (emacs-center-foreground   "#f99157") (emacs-center-background   "#393939")

      (inactive1-foreground      "#d3d0c8") (inactive1-background      "#393939")
      (inactive2-foreground      "#d3d0c8") (inactive2-background      "#393939")
      (inactive3-foreground      "#d3d0c8") (inactive3-background      "#393939"))

  (airline-themes-set-deftheme 'airline-base16_eighties)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_eighties)
;;; airline-base16_eighties-theme.el ends here
