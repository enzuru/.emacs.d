
;;; Code:

(deftheme airline-base16color
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#141413") (normal-outer-background   "#CAE682")
      (normal-inner-foreground   "#CAE682") (normal-inner-background   "#32322F")
      (normal-center-foreground  "#CAE682") (normal-center-background  "#242424")

      (insert-outer-foreground   "#141413") (insert-outer-background   "#FDE76E")
      (insert-inner-foreground   "#FDE76E") (insert-inner-background   "#32322F")
      (insert-center-foreground  "#FDE76E") (insert-center-background  "#242424")

      (visual-outer-foreground   "#141413") (visual-outer-background   "#B5D3F3")
      (visual-inner-foreground   "#B5D3F3") (visual-inner-background   "#32322F")
      (visual-center-foreground  "#B5D3F3") (visual-center-background  "#242424")

      (replace-outer-foreground  "#141413") (replace-outer-background  "#E5786D")
      (replace-inner-foreground  "#E5786D") (replace-inner-background  "#32322F")
      (replace-center-foreground "#E5786D") (replace-center-background "#242424")

      (emacs-outer-foreground    "#141413") (emacs-outer-background    "#CAE682")
      (emacs-inner-foreground    "#CAE682") (emacs-inner-background    "#32322F")
      (emacs-center-foreground   "#CAE682") (emacs-center-background   "#242424")

      (inactive1-foreground      "#767676") (inactive1-background      "#242424")
      (inactive2-foreground      "#767676") (inactive2-background      "#242424")
      (inactive3-foreground      "#767676") (inactive3-background      "#242424"))

  (airline-themes-set-deftheme 'airline-base16color)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16color)
;;; airline-base16color-theme.el ends here
