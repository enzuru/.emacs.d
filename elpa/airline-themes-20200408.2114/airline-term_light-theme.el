
;;; Code:

(deftheme airline-term_light
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#f0f0f0") (normal-outer-background   "#86CD74")
      (normal-inner-foreground   "#86CD74") (normal-inner-background   "#deded9")
      (normal-center-foreground  "#86CD74") (normal-center-background  "#888a85")

      (insert-outer-foreground   "#f0f0f0") (insert-outer-background   "#FADE3E")
      (insert-inner-foreground   "#FADE3E") (insert-inner-background   "#deded9")
      (insert-center-foreground  "#FADE3E") (insert-center-background  "#888a85")

      (visual-outer-foreground   "#f0f0f0") (visual-outer-background   "#7CB0E6")
      (visual-inner-foreground   "#7CB0E6") (visual-inner-background   "#deded9")
      (visual-center-foreground  "#7CB0E6") (visual-center-background  "#888a85")

      (replace-outer-foreground  "#f0f0f0") (replace-outer-background  "#E55345")
      (replace-inner-foreground  "#E55345") (replace-inner-background  "#deded9")
      (replace-center-foreground "#E55345") (replace-center-background "#888a85")

      (emacs-outer-foreground    "#f0f0f0") (emacs-outer-background    "#86CD74")
      (emacs-inner-foreground    "#86CD74") (emacs-inner-background    "#deded9")
      (emacs-center-foreground   "#86CD74") (emacs-center-background   "#888a85")

      (inactive1-foreground      "#767676") (inactive1-background      "#888a85")
      (inactive2-foreground      "#767676") (inactive2-background      "#888a85")
      (inactive3-foreground      "#767676") (inactive3-background      "#888a85"))

  (airline-themes-set-deftheme 'airline-term_light)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-term_light)
;;; airline-term_light-theme.el ends here
