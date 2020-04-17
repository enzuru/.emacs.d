
;;; Code:

(deftheme airline-base16_shell
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#181818") (normal-outer-background   "#a1b56c")
      (normal-inner-foreground   "#b8b8b8") (normal-inner-background   "#383838")
      (normal-center-foreground  "#a1b56c") (normal-center-background  "#282828")

      (insert-outer-foreground   "#282828") (insert-outer-background   "#7cafc2")
      (insert-inner-foreground   "#b8b8b8") (insert-inner-background   "#383838")
      (insert-center-foreground  "#7cafc2") (insert-center-background  "#282828")

      (visual-outer-foreground   "#282828") (visual-outer-background   "#ba8baf")
      (visual-inner-foreground   "#b8b8b8") (visual-inner-background   "#383838")
      (visual-center-foreground  "#ba8baf") (visual-center-background  "#282828")

      (replace-outer-foreground  "#282828") (replace-outer-background  "#ab4642")
      (replace-inner-foreground  "#b8b8b8") (replace-inner-background  "#383838")
      (replace-center-foreground "#ab4642") (replace-center-background "#282828")

      (emacs-outer-foreground    "#181818") (emacs-outer-background    "#a1b56c")
      (emacs-inner-foreground    "#b8b8b8") (emacs-inner-background    "#383838")
      (emacs-center-foreground   "#a1b56c") (emacs-center-background   "#282828")

      (inactive1-foreground      "#585858") (inactive1-background      "#282828")
      (inactive2-foreground      "#585858") (inactive2-background      "#282828")
      (inactive3-foreground      "#585858") (inactive3-background      "#282828"))

  (airline-themes-set-deftheme 'airline-base16_shell)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_shell)
;;; airline-base16_shell-theme.el ends here
