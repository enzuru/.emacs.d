
;;; Code:

(deftheme airline-base16_marrakesh
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#302e00") (normal-outer-background   "#18974e")
      (normal-inner-foreground   "#ccc37a") (normal-inner-background   "#5f5b17")
      (normal-center-foreground  "#b36144") (normal-center-background  "#302e00")

      (insert-outer-foreground   "#302e00") (insert-outer-background   "#477ca1")
      (insert-inner-foreground   "#ccc37a") (insert-inner-background   "#5f5b17")
      (insert-center-foreground  "#b36144") (insert-center-background  "#302e00")

      (visual-outer-foreground   "#302e00") (visual-outer-background   "#8868b3")
      (visual-inner-foreground   "#ccc37a") (visual-inner-background   "#5f5b17")
      (visual-center-foreground  "#b36144") (visual-center-background  "#302e00")

      (replace-outer-foreground  "#302e00") (replace-outer-background  "#c35359")
      (replace-inner-foreground  "#ccc37a") (replace-inner-background  "#5f5b17")
      (replace-center-foreground "#b36144") (replace-center-background "#302e00")

      (emacs-outer-foreground    "#302e00") (emacs-outer-background    "#18974e")
      (emacs-inner-foreground    "#ccc37a") (emacs-inner-background    "#5f5b17")
      (emacs-center-foreground   "#b36144") (emacs-center-background   "#302e00")

      (inactive1-foreground      "#948e48") (inactive1-background      "#302e00")
      (inactive2-foreground      "#948e48") (inactive2-background      "#302e00")
      (inactive3-foreground      "#948e48") (inactive3-background      "#302e00"))

  (airline-themes-set-deftheme 'airline-base16_marrakesh)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_marrakesh)
;;; airline-base16_marrakesh-theme.el ends here
