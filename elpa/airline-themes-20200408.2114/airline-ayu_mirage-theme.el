
;;; Code:

(deftheme airline-ayu_mirage
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#212733") (normal-outer-background   "#BBE67E")
      (normal-inner-foreground   "#BBE67E") (normal-inner-background   "#212733")
      (normal-center-foreground  "#E6E1CF") (normal-center-background  "#212733")

      (insert-outer-foreground   "#212733") (insert-outer-background   "#80D4FF")
      (insert-inner-foreground   "#80D4FF") (insert-inner-background   "#212733")
      (insert-center-foreground  "#E6E1CF") (insert-center-background  "#212733")

      (visual-outer-foreground   "#212733") (visual-outer-background   "#FFAE57")
      (visual-inner-foreground   "#FFAE57") (visual-inner-background   "#212733")
      (visual-center-foreground  "#E6E1CF") (visual-center-background  "#212733")

      (replace-outer-foreground  "#212733") (replace-outer-background  "#F07178")
      (replace-inner-foreground  "#BBE67E") (replace-inner-background  "#212733")
      (replace-center-foreground "#E6E1CF") (replace-center-background "#212733")

      (emacs-outer-foreground    "#212733") (emacs-outer-background    "#BBE67E")
      (emacs-inner-foreground    "#BBE67E") (emacs-inner-background    "#212733")
      (emacs-center-foreground   "#E6E1CF") (emacs-center-background   "#212733")

      (inactive1-foreground      "#BBE67E") (inactive1-background      "#212733")
      (inactive2-foreground      "#BBE67E") (inactive2-background      "#212733")
      (inactive3-foreground      "#BBE67E") (inactive3-background      "#212733"))

  (airline-themes-set-deftheme 'airline-ayu_mirage)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-ayu_mirage)
;;; airline-ayu_mirage-theme.el ends here
