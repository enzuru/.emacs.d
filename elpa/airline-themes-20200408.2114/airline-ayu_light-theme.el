
;;; Code:

(deftheme airline-ayu_light
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#6C7680") (normal-outer-background   "#86B300")
      (normal-inner-foreground   "#86B300") (normal-inner-background   "#6C7680")
      (normal-center-foreground  "#6C7680") (normal-center-background  "#FAFAFA")

      (insert-outer-foreground   "#6C7680") (insert-outer-background   "#55B4D4")
      (insert-inner-foreground   "#55B4D4") (insert-inner-background   "#6C7680")
      (insert-center-foreground  "#6C7680") (insert-center-background  "#FAFAFA")

      (visual-outer-foreground   "#6C7680") (visual-outer-background   "#FA8D3E")
      (visual-inner-foreground   "#FA8D3E") (visual-inner-background   "#6C7680")
      (visual-center-foreground  "#6C7680") (visual-center-background  "#FAFAFA")

      (replace-outer-foreground  "#6C7680") (replace-outer-background  "#F51818")
      (replace-inner-foreground  "#86B300") (replace-inner-background  "#6C7680")
      (replace-center-foreground "#6C7680") (replace-center-background "#FAFAFA")

      (emacs-outer-foreground    "#6C7680") (emacs-outer-background    "#86B300")
      (emacs-inner-foreground    "#86B300") (emacs-inner-background    "#6C7680")
      (emacs-center-foreground   "#6C7680") (emacs-center-background   "#FAFAFA")

      (inactive1-foreground      "#86B300") (inactive1-background      "#FAFAFA")
      (inactive2-foreground      "#86B300") (inactive2-background      "#FAFAFA")
      (inactive3-foreground      "#86B300") (inactive3-background      "#FAFAFA"))

  (airline-themes-set-deftheme 'airline-ayu_light)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-ayu_light)
;;; airline-ayu_light-theme.el ends here
