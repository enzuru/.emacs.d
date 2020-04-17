
;;; Code:

(deftheme airline-base16_londontube
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#1c3f95") (normal-outer-background   "#00853e")
      (normal-inner-foreground   "#e7e7e8") (normal-inner-background   "#5a5758")
      (normal-center-foreground  "#f386a1") (normal-center-background  "#1c3f95")

      (insert-outer-foreground   "#1c3f95") (insert-outer-background   "#009ddc")
      (insert-inner-foreground   "#e7e7e8") (insert-inner-background   "#5a5758")
      (insert-center-foreground  "#f386a1") (insert-center-background  "#1c3f95")

      (visual-outer-foreground   "#1c3f95") (visual-outer-background   "#98005d")
      (visual-inner-foreground   "#e7e7e8") (visual-inner-background   "#5a5758")
      (visual-center-foreground  "#f386a1") (visual-center-background  "#1c3f95")

      (replace-outer-foreground  "#1c3f95") (replace-outer-background  "#ee2e24")
      (replace-inner-foreground  "#e7e7e8") (replace-inner-background  "#5a5758")
      (replace-center-foreground "#f386a1") (replace-center-background "#1c3f95")

      (emacs-outer-foreground    "#1c3f95") (emacs-outer-background    "#00853e")
      (emacs-inner-foreground    "#e7e7e8") (emacs-inner-background    "#5a5758")
      (emacs-center-foreground   "#f386a1") (emacs-center-background   "#1c3f95")

      (inactive1-foreground      "#d9d8d8") (inactive1-background      "#1c3f95")
      (inactive2-foreground      "#d9d8d8") (inactive2-background      "#1c3f95")
      (inactive3-foreground      "#d9d8d8") (inactive3-background      "#1c3f95"))

  (airline-themes-set-deftheme 'airline-base16_londontube)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_londontube)
;;; airline-base16_londontube-theme.el ends here
