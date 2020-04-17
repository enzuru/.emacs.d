
;;; Code:

(deftheme airline-base16_ashes
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#393F45") (normal-outer-background   "#95C7AE")
      (normal-inner-foreground   "#DFE2E5") (normal-inner-background   "#565E65")
      (normal-center-foreground  "#C7C795") (normal-center-background  "#393F45")

      (insert-outer-foreground   "#393F45") (insert-outer-background   "#AE95C7")
      (insert-inner-foreground   "#DFE2E5") (insert-inner-background   "#565E65")
      (insert-center-foreground  "#C7C795") (insert-center-background  "#393F45")

      (visual-outer-foreground   "#393F45") (visual-outer-background   "#C795AE")
      (visual-inner-foreground   "#DFE2E5") (visual-inner-background   "#565E65")
      (visual-center-foreground  "#C7C795") (visual-center-background  "#393F45")

      (replace-outer-foreground  "#393F45") (replace-outer-background  "#C7AE95")
      (replace-inner-foreground  "#DFE2E5") (replace-inner-background  "#565E65")
      (replace-center-foreground "#C7C795") (replace-center-background "#393F45")

      (emacs-outer-foreground    "#393F45") (emacs-outer-background    "#95C7AE")
      (emacs-inner-foreground    "#DFE2E5") (emacs-inner-background    "#565E65")
      (emacs-center-foreground   "#C7C795") (emacs-center-background   "#393F45")

      (inactive1-foreground      "#C7CCD1") (inactive1-background      "#393F45")
      (inactive2-foreground      "#C7CCD1") (inactive2-background      "#393F45")
      (inactive3-foreground      "#C7CCD1") (inactive3-background      "#393F45"))

  (airline-themes-set-deftheme 'airline-base16_ashes)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_ashes)
;;; airline-base16_ashes-theme.el ends here
