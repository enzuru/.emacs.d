
;;; Code:

(deftheme airline-base16-gui-light
  "Designed for use with the base16 emacs color schemes in the gui

url: https://github.com/mkaito/base16-emacs")

(let ((normal-outer-foreground  (face-background 'default)) (normal-outer-background  (face-foreground 'link))
      (normal-inner-foreground  (face-background 'fringe))  (normal-inner-background  (face-foreground 'rainbow-delimiters-depth-9-face))
      (normal-center-foreground (face-background 'fringe))  (normal-center-background (face-foreground 'mode-line-emphasis))

      (insert-outer-foreground  (face-background 'highlight)) (insert-outer-background  (face-foreground 'success))
      (insert-inner-foreground  (face-foreground 'success))   (insert-inner-background  (face-background 'default))
      (insert-center-foreground (face-background 'fringe))    (insert-center-background (face-foreground 'mode-line-emphasis))

      (visual-outer-foreground  (face-background 'highlight)) (visual-outer-background  (face-foreground 'warning))
      (visual-inner-foreground  (face-foreground 'warning))   (visual-inner-background  (face-background 'default))
      (visual-center-foreground (face-background 'fringe))    (visual-center-background (face-foreground 'mode-line-emphasis))

      (replace-outer-foreground  (face-background 'highlight)) (replace-outer-background  (face-foreground 'error))
      (replace-inner-foreground  (face-background 'fringe))    (replace-inner-background  (face-foreground 'rainbow-delimiters-depth-9-face))
      (replace-center-foreground (face-background 'fringe))    (replace-center-background (face-foreground 'mode-line-emphasis))

      (emacs-outer-foreground  (face-background 'highlight)) (emacs-outer-background  (face-foreground 'link-visited))
      (emacs-inner-foreground  (face-background 'fringe))    (emacs-inner-background  (face-foreground 'rainbow-delimiters-depth-9-face))
      (emacs-center-foreground (face-background 'fringe))    (emacs-center-background (face-foreground 'mode-line-emphasis))

      (inactive1-foreground (face-foreground 'font-lock-doc-face)) (inactive1-background (face-foreground 'mode-line-emphasis))
      (inactive2-foreground (face-foreground 'font-lock-doc-face)) (inactive2-background (face-foreground 'mode-line-emphasis))
      (inactive3-foreground (face-foreground 'font-lock-doc-face)) (inactive3-background (face-foreground 'mode-line-emphasis)))

  (airline-themes-set-deftheme 'airline-base16-gui-light)

  (when airline-cursor-colors
    (progn
     (setq evil-emacs-state-cursor   emacs-outer-background)
     (setq evil-normal-state-cursor  normal-outer-background)
     (setq evil-insert-state-cursor  `(bar ,insert-outer-background))
     (setq evil-replace-state-cursor replace-outer-background)
     (setq evil-visual-state-cursor  visual-outer-background)))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16-gui-light)
;;; airline-base16-gui-light-theme.el ends here
