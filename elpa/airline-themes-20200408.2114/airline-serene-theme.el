
;;; Code:

(deftheme airline-serene
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#00dfff") (normal-outer-background   "#080808")
      (normal-inner-foreground   "#ff5f00") (normal-inner-background   "#080808")
      (normal-center-foreground  "#767676") (normal-center-background  "#080808")

      (insert-outer-foreground   "#5fff00") (insert-outer-background   "#080808")
      (insert-inner-foreground   "#ff5f00") (insert-inner-background   "#080808")
      (insert-center-foreground  "#767676") (insert-center-background  "#080808")

      (visual-outer-foreground   "#dfdf00") (visual-outer-background   "#080808")
      (visual-inner-foreground   "#ff5f00") (visual-inner-background   "#080808")
      (visual-center-foreground  "#767676") (visual-center-background  "#080808")

      (replace-outer-foreground  "#5fff00") (replace-outer-background  "#af0000")
      (replace-inner-foreground  "#ff5f00") (replace-inner-background  "#080808")
      (replace-center-foreground "#767676") (replace-center-background "#080808")

      (emacs-outer-foreground    "#00dfff") (emacs-outer-background    "#080808")
      (emacs-inner-foreground    "#ff5f00") (emacs-inner-background    "#080808")
      (emacs-center-foreground   "#767676") (emacs-center-background   "#080808")

      (inactive1-foreground      "#4e4e4e") (inactive1-background      "#080808")
      (inactive2-foreground      "#4e4e4e") (inactive2-background      "#303030")
      (inactive3-foreground      "#4e4e4e") (inactive3-background      "#303030"))

  (airline-themes-set-deftheme 'airline-serene)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-serene)
;;; airline-serene-theme.el ends here
