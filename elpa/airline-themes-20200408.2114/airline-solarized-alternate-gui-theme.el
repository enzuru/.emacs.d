
;;; Code:

(deftheme airline-solarized-alternate-gui
  "source: https://github.com/bling/vim-airline/blob/master/autoload/airline/themes/solarized-alternate-gui.vim")

(let ((normal-outer-foreground  (face-background 'highlight)) (normal-outer-background  (face-foreground 'font-lock-function-name-face))
      (normal-inner-foreground  (face-foreground 'fringe))    (normal-inner-background  (face-background 'fringe))
      (normal-center-foreground (face-foreground 'highlight)) (normal-center-background (face-background 'highlight))

      (insert-outer-foreground  (face-background 'highlight)) (insert-outer-background  (face-foreground 'success))
      (insert-inner-foreground  (face-foreground 'success))   (insert-inner-background  (face-background 'fringe))
      (insert-center-foreground (face-foreground 'highlight)) (insert-center-background (face-background 'highlight))

      (visual-outer-foreground  (face-background 'highlight))          (visual-outer-background  (face-foreground 'font-lock-doc-face))
      (visual-inner-foreground  (face-foreground 'font-lock-doc-face)) (visual-inner-background  (face-background 'fringe))
      (visual-center-foreground (face-foreground 'highlight))          (visual-center-background (face-background 'highlight))

      (replace-outer-foreground  (face-background 'highlight)) (replace-outer-background  (face-foreground 'error))
      (replace-inner-foreground  (face-foreground 'fringe))    (replace-inner-background  (face-background 'fringe))
      (replace-center-foreground (face-foreground 'highlight)) (replace-center-background (face-background 'highlight))

      (emacs-outer-foreground  (face-background 'highlight)) (emacs-outer-background  (face-foreground 'escape-glyph))
      (emacs-inner-foreground  (face-foreground 'fringe))    (emacs-inner-background  (face-background 'fringe))
      (emacs-center-foreground (face-foreground 'highlight)) (emacs-center-background (face-background 'highlight))

      (inactive1-foreground (face-foreground 'fringe)) (inactive1-background (face-foreground 'highlight))
      (inactive2-foreground (face-foreground 'fringe)) (inactive2-background (face-foreground 'highlight))
      (inactive3-foreground (face-foreground 'fringe)) (inactive3-background (face-foreground 'highlight)))

  (airline-themes-set-deftheme 'airline-solarized-alternate-gui)

  (when airline-cursor-colors
    (progn
     (setq evil-emacs-state-cursor   emacs-outer-background)
     (setq evil-normal-state-cursor  normal-outer-background)
     (setq evil-insert-state-cursor  `(bar ,insert-outer-background))
     (setq evil-replace-state-cursor replace-outer-background)
     (setq evil-visual-state-cursor  visual-outer-background)))
)

(airline-themes-set-modeline)

(provide-theme 'airline-solarized-alternate-gui)
;;; airline-solarized-alternate-gui-theme.el ends here
