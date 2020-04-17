
;;; Code:

(deftheme airline-base16_solarized
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#073642") (normal-outer-background   "#859900")
      (normal-inner-foreground   "#eee8d5") (normal-inner-background   "#586e75")
      (normal-center-foreground  "#cb4b16") (normal-center-background  "#073642")

      (insert-outer-foreground   "#073642") (insert-outer-background   "#268bd2")
      (insert-inner-foreground   "#eee8d5") (insert-inner-background   "#586e75")
      (insert-center-foreground  "#cb4b16") (insert-center-background  "#073642")

      (visual-outer-foreground   "#073642") (visual-outer-background   "#6c71c4")
      (visual-inner-foreground   "#eee8d5") (visual-inner-background   "#586e75")
      (visual-center-foreground  "#cb4b16") (visual-center-background  "#073642")

      (replace-outer-foreground  "#073642") (replace-outer-background  "#dc322f")
      (replace-inner-foreground  "#eee8d5") (replace-inner-background  "#586e75")
      (replace-center-foreground "#cb4b16") (replace-center-background "#073642")

      (emacs-outer-foreground    "#073642") (emacs-outer-background    "#859900")
      (emacs-inner-foreground    "#eee8d5") (emacs-inner-background    "#586e75")
      (emacs-center-foreground   "#cb4b16") (emacs-center-background   "#073642")

      (inactive1-foreground      "#93a1a1") (inactive1-background      "#073642")
      (inactive2-foreground      "#93a1a1") (inactive2-background      "#073642")
      (inactive3-foreground      "#93a1a1") (inactive3-background      "#073642"))

  (airline-themes-set-deftheme 'airline-base16_solarized)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_solarized)
;;; airline-base16_solarized-theme.el ends here
