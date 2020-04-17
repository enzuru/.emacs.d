
;;; Code:

(deftheme airline-base16_gruvbox_dark_hard
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#3c3836") (normal-outer-background   "#b8bb26")
      (normal-inner-foreground   "#ebdbb2") (normal-inner-background   "#504945")
      (normal-center-foreground  "#fe8019") (normal-center-background  "#3c3836")

      (insert-outer-foreground   "#3c3836") (insert-outer-background   "#83a598")
      (insert-inner-foreground   "#ebdbb2") (insert-inner-background   "#504945")
      (insert-center-foreground  "#fe8019") (insert-center-background  "#3c3836")

      (visual-outer-foreground   "#3c3836") (visual-outer-background   "#d3869b")
      (visual-inner-foreground   "#ebdbb2") (visual-inner-background   "#504945")
      (visual-center-foreground  "#fe8019") (visual-center-background  "#3c3836")

      (replace-outer-foreground  "#3c3836") (replace-outer-background  "#fb4934")
      (replace-inner-foreground  "#ebdbb2") (replace-inner-background  "#504945")
      (replace-center-foreground "#fe8019") (replace-center-background "#3c3836")

      (emacs-outer-foreground    "#3c3836") (emacs-outer-background    "#b8bb26")
      (emacs-inner-foreground    "#ebdbb2") (emacs-inner-background    "#504945")
      (emacs-center-foreground   "#fe8019") (emacs-center-background   "#3c3836")

      (inactive1-foreground      "#d5c4a1") (inactive1-background      "#3c3836")
      (inactive2-foreground      "#d5c4a1") (inactive2-background      "#3c3836")
      (inactive3-foreground      "#d5c4a1") (inactive3-background      "#3c3836"))

  (airline-themes-set-deftheme 'airline-base16_gruvbox_dark_hard)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_gruvbox_dark_hard)
;;; airline-base16_gruvbox_dark_hard-theme.el ends here
