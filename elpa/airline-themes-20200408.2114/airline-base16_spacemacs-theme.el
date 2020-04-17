
;;; Code:

(deftheme airline-base16_spacemacs
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#f8f8f8") (normal-outer-background   "#4f97d7")
      (normal-inner-foreground   "#e8e8e8") (normal-inner-background   "#444155")
      (normal-center-foreground  "#e8e8e8") (normal-center-background  "#1f2022")

      (insert-outer-foreground   "#f8f8f8") (insert-outer-background   "#67b11d")
      (insert-inner-foreground   "#e8e8e8") (insert-inner-background   "#444155")
      (insert-center-foreground  "#67b11d") (insert-center-background  "#1f2022")

      (visual-outer-foreground   "#f8f8f8") (visual-outer-background   "#ffa500")
      (visual-inner-foreground   "#e8e8e8") (visual-inner-background   "#444155")
      (visual-center-foreground  "#ffa500") (visual-center-background  "#1f2022")

      (replace-outer-foreground  "#f8f8f8") (replace-outer-background  "#f2241f")
      (replace-inner-foreground  "#e8e8e8") (replace-inner-background  "#444155")
      (replace-center-foreground "#e8e8e8") (replace-center-background "#1f2022")

      (emacs-outer-foreground    "#f8f8f8") (emacs-outer-background    "#4f97d7")
      (emacs-inner-foreground    "#e8e8e8") (emacs-inner-background    "#444155")
      (emacs-center-foreground   "#e8e8e8") (emacs-center-background   "#1f2022")

      (inactive1-foreground      "#b8b8b8") (inactive1-background      "#444155")
      (inactive2-foreground      "#b8b8b8") (inactive2-background      "#444155")
      (inactive3-foreground      "#b8b8b8") (inactive3-background      "#444155"))

  (airline-themes-set-deftheme 'airline-base16_spacemacs)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_spacemacs)
;;; airline-base16_spacemacs-theme.el ends here
