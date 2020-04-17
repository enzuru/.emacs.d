;;; airline-doom-one --- Summary
;;; Commentary:
;;; Code:

(deftheme airline-doom-one
  "source: https://github.com/hlissner/emacs-doom-theme")

(let ((normal-outer-foreground   "#1B2229") (normal-outer-background   "#51afef")
      (normal-inner-foreground   "#bbc2cf") (normal-inner-background   "#21242b")
      (normal-center-foreground  "#bbc2cf") (normal-center-background  "#21242b")

      (insert-outer-foreground   "#1B2229") (insert-outer-background   "#98be65")
      (insert-inner-foreground   "#bbc2cf") (insert-inner-background   "#21242b")
      (insert-center-foreground  "#bbc2cf") (insert-center-background  "#21242b")

      (visual-outer-foreground   "#1B2229") (visual-outer-background   "#4db5bd")
      (visual-inner-foreground   "#bbc2cf") (visual-inner-background   "#21242b")
      (visual-center-foreground  "#bbc2cf") (visual-center-background  "#21242b")

      (replace-outer-foreground  "#1B2229") (replace-outer-background  "#ff6c6b")
      (replace-inner-foreground  "#bbc2cf") (replace-inner-background  "#21242b")
      (replace-center-foreground "#bbc2cf") (replace-center-background "#21242b")

      (emacs-outer-foreground    "#1B2229") (emacs-outer-background    "#a9a1e1")
      (emacs-inner-foreground    "#bbc2cf") (emacs-inner-background    "#21242b")
      (emacs-center-foreground   "#bbc2cf") (emacs-center-background   "#21242b")

      (inactive1-foreground      "#5B6268") (inactive1-background      "#23272e")
      (inactive2-foreground      "#5B6268") (inactive2-background      "#23272e")
      (inactive3-foreground      "#5B6268") (inactive3-background      "#23272e"))

  (airline-themes-set-deftheme 'airline-doom-one)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
  )

(airline-themes-set-modeline)

(provide-theme 'airline-doom-one)
;;; airline-doom-one-theme.el ends here
