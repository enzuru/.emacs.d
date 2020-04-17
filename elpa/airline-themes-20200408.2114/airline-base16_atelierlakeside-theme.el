
;;; Code:

(deftheme airline-base16_atelierlakeside
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#1f292e") (normal-outer-background   "#568c3b")
      (normal-inner-foreground   "#c1e4f6") (normal-inner-background   "#516d7b")
      (normal-center-foreground  "#935c25") (normal-center-background  "#1f292e")

      (insert-outer-foreground   "#1f292e") (insert-outer-background   "#257fad")
      (insert-inner-foreground   "#c1e4f6") (insert-inner-background   "#516d7b")
      (insert-center-foreground  "#935c25") (insert-center-background  "#1f292e")

      (visual-outer-foreground   "#1f292e") (visual-outer-background   "#5d5db1")
      (visual-inner-foreground   "#c1e4f6") (visual-inner-background   "#516d7b")
      (visual-center-foreground  "#935c25") (visual-center-background  "#1f292e")

      (replace-outer-foreground  "#1f292e") (replace-outer-background  "#d22d72")
      (replace-inner-foreground  "#c1e4f6") (replace-inner-background  "#516d7b")
      (replace-center-foreground "#935c25") (replace-center-background "#1f292e")

      (emacs-outer-foreground    "#1f292e") (emacs-outer-background    "#568c3b")
      (emacs-inner-foreground    "#c1e4f6") (emacs-inner-background    "#516d7b")
      (emacs-center-foreground   "#935c25") (emacs-center-background   "#1f292e")

      (inactive1-foreground      "#7ea2b4") (inactive1-background      "#1f292e")
      (inactive2-foreground      "#7ea2b4") (inactive2-background      "#1f292e")
      (inactive3-foreground      "#7ea2b4") (inactive3-background      "#1f292e"))

  (airline-themes-set-deftheme 'airline-base16_atelierlakeside)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_atelierlakeside)
;;; airline-base16_atelierlakeside-theme.el ends here
