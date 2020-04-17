
;;; Code:

(deftheme airline-base16_codeschool
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#1c3657") (normal-outer-background   "#237986")
      (normal-inner-foreground   "#a7cfa3") (normal-inner-background   "#2a343a")
      (normal-center-foreground  "#43820d") (normal-center-background  "#1c3657")

      (insert-outer-foreground   "#1c3657") (insert-outer-background   "#484d79")
      (insert-inner-foreground   "#a7cfa3") (insert-inner-background   "#2a343a")
      (insert-center-foreground  "#43820d") (insert-center-background  "#1c3657")

      (visual-outer-foreground   "#1c3657") (visual-outer-background   "#c59820")
      (visual-inner-foreground   "#a7cfa3") (visual-inner-background   "#2a343a")
      (visual-center-foreground  "#43820d") (visual-center-background  "#1c3657")

      (replace-outer-foreground  "#1c3657") (replace-outer-background  "#2a5491")
      (replace-inner-foreground  "#a7cfa3") (replace-inner-background  "#2a343a")
      (replace-center-foreground "#43820d") (replace-center-background "#1c3657")

      (emacs-outer-foreground    "#1c3657") (emacs-outer-background    "#237986")
      (emacs-inner-foreground    "#a7cfa3") (emacs-inner-background    "#2a343a")
      (emacs-center-foreground   "#43820d") (emacs-center-background   "#1c3657")

      (inactive1-foreground      "#9ea7a6") (inactive1-background      "#1c3657")
      (inactive2-foreground      "#9ea7a6") (inactive2-background      "#1c3657")
      (inactive3-foreground      "#9ea7a6") (inactive3-background      "#1c3657"))

  (airline-themes-set-deftheme 'airline-base16_codeschool)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_codeschool)
;;; airline-base16_codeschool-theme.el ends here
