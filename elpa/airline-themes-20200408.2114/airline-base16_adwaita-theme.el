
;;; Code:

(deftheme airline-base16_adwaita
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#33393B") (normal-outer-background   "#6FEE91")
      (normal-inner-foreground   "#D3D4D5") (normal-inner-background   "#4B5356")
      (normal-center-foreground  "#FFFF60") (normal-center-background  "#33393B")

      (insert-outer-foreground   "#33393B") (insert-outer-background   "#916FB4")
      (insert-inner-foreground   "#D3D4D5") (insert-inner-background   "#4B5356")
      (insert-center-foreground  "#FFFF60") (insert-center-background  "#33393B")

      (visual-outer-foreground   "#33393B") (visual-outer-background   "#EE6F91")
      (visual-inner-foreground   "#D3D4D5") (visual-inner-background   "#4B5356")
      (visual-center-foreground  "#FFFF60") (visual-center-background  "#33393B")

      (replace-outer-foreground  "#33393B") (replace-outer-background  "#FFA500")
      (replace-inner-foreground  "#D3D4D5") (replace-inner-background  "#4B5356")
      (replace-center-foreground "#FFFF60") (replace-center-background "#33393B")

      (emacs-outer-foreground    "#33393B") (emacs-outer-background    "#6FEE91")
      (emacs-inner-foreground    "#D3D4D5") (emacs-inner-background    "#4B5356")
      (emacs-center-foreground   "#FFFF60") (emacs-center-background   "#33393B")

      (inactive1-foreground      "#C5C6C5") (inactive1-background      "#33393B")
      (inactive2-foreground      "#C5C6C5") (inactive2-background      "#33393B")
      (inactive3-foreground      "#C5C6C5") (inactive3-background      "#33393B"))

  (airline-themes-set-deftheme 'airline-base16_adwaita)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_adwaita)
;;; airline-base16_adwaita-theme.el ends here
