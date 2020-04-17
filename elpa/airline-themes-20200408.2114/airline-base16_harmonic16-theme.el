
;;; Code:

(deftheme airline-base16_harmonic16
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#223b54") (normal-outer-background   "#56bf8b")
      (normal-inner-foreground   "#e5ebf1") (normal-inner-background   "#405c79")
      (normal-center-foreground  "#bfbf56") (normal-center-background  "#223b54")

      (insert-outer-foreground   "#223b54") (insert-outer-background   "#8b56bf")
      (insert-inner-foreground   "#e5ebf1") (insert-inner-background   "#405c79")
      (insert-center-foreground  "#bfbf56") (insert-center-background  "#223b54")

      (visual-outer-foreground   "#223b54") (visual-outer-background   "#bf568b")
      (visual-inner-foreground   "#e5ebf1") (visual-inner-background   "#405c79")
      (visual-center-foreground  "#bfbf56") (visual-center-background  "#223b54")

      (replace-outer-foreground  "#223b54") (replace-outer-background  "#bf8b56")
      (replace-inner-foreground  "#e5ebf1") (replace-inner-background  "#405c79")
      (replace-center-foreground "#bfbf56") (replace-center-background "#223b54")

      (emacs-outer-foreground    "#223b54") (emacs-outer-background    "#56bf8b")
      (emacs-inner-foreground    "#e5ebf1") (emacs-inner-background    "#405c79")
      (emacs-center-foreground   "#bfbf56") (emacs-center-background   "#223b54")

      (inactive1-foreground      "#cbd6e2") (inactive1-background      "#223b54")
      (inactive2-foreground      "#cbd6e2") (inactive2-background      "#223b54")
      (inactive3-foreground      "#cbd6e2") (inactive3-background      "#223b54"))

  (airline-themes-set-deftheme 'airline-base16_harmonic16)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_harmonic16)
;;; airline-base16_harmonic16-theme.el ends here
