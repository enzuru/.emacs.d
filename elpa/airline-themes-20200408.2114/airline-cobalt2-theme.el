
;;; Code:

(deftheme airline-cobalt2
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#ffffff") (normal-outer-background   "#1f7ad8")
      (normal-inner-foreground   "#ffffff") (normal-inner-background   "#8cc2fd")
      (normal-center-foreground  "#ffffff") (normal-center-background  "#204458")

      (insert-outer-foreground   "#666d51") (insert-outer-background   "#fee533")
      (insert-inner-foreground   "#ffffff") (insert-inner-background   "#8cc2fd")
      (insert-center-foreground  "#ffffff") (insert-center-background  "#204458")

      (visual-outer-foreground   "#ffff9a") (visual-outer-background   "#ff9d00")
      (visual-inner-foreground   "#ffffff") (visual-inner-background   "#8cc2fd")
      (visual-center-foreground  "#ffffff") (visual-center-background  "#204458")

      (replace-outer-foreground  "#ffffff") (replace-outer-background  "#ea9299")
      (replace-inner-foreground  "#ffffff") (replace-inner-background  "#8cc2fd")
      (replace-center-foreground "#ffffff") (replace-center-background "#204458")

      (emacs-outer-foreground    "#ffffff") (emacs-outer-background    "#1f7ad8")
      (emacs-inner-foreground    "#ffffff") (emacs-inner-background    "#8cc2fd")
      (emacs-center-foreground   "#ffffff") (emacs-center-background   "#204458")

      (inactive1-foreground      "#4e4e4e") (inactive1-background      "#204458")
      (inactive2-foreground      "#4e4e4e") (inactive2-background      "#204458")
      (inactive3-foreground      "#4e4e4e") (inactive3-background      "#204458"))

  (airline-themes-set-deftheme 'airline-cobalt2)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-cobalt2)
;;; airline-cobalt2-theme.el ends here
