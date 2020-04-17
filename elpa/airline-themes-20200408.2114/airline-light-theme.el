
;;; Code:

(deftheme airline-light
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#ffffff") (normal-outer-background   "#005fff")
      (normal-inner-foreground   "#000087") (normal-inner-background   "#00dfff")
      (normal-center-foreground  "#005fff") (normal-center-background  "#afffff")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#00875f")
      (insert-inner-foreground   "#005f00") (insert-inner-background   "#00df87")
      (insert-center-foreground  "#005f5f") (insert-center-background  "#afff87")

      (visual-outer-foreground   "#ffffff") (visual-outer-background   "#ff5f00")
      (visual-inner-foreground   "#5f0000") (visual-inner-background   "#ffaf00")
      (visual-center-foreground  "#df5f00") (visual-center-background  "#ffff87")

      (replace-outer-foreground  "#005f00") (replace-outer-background  "#ff0000")
      (replace-inner-foreground  "#005f00") (replace-inner-background  "#00df87")
      (replace-center-foreground "#005f5f") (replace-center-background "#afff87")

      (emacs-outer-foreground    "#ffffff") (emacs-outer-background    "#005fff")
      (emacs-inner-foreground    "#000087") (emacs-inner-background    "#00dfff")
      (emacs-center-foreground   "#005fff") (emacs-center-background   "#afffff")

      (inactive1-foreground      "#666666") (inactive1-background      "#b2b2b2")
      (inactive2-foreground      "#8a8a8a") (inactive2-background      "#d0d0d0")
      (inactive3-foreground      "#a8a8a8") (inactive3-background      "#ffffff"))

  (airline-themes-set-deftheme 'airline-light)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-light)
;;; airline-light-theme.el ends here
