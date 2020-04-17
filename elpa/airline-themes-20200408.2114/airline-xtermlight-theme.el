
;;; Code:

(deftheme airline-xtermlight
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#eeeeee") (normal-outer-background   "#005fff")
      (normal-inner-foreground   "#000087") (normal-inner-background   "#00d7ff")
      (normal-center-foreground  "#005fff") (normal-center-background  "#afffff")

      (insert-outer-foreground   "#eeeeee") (insert-outer-background   "#00875f")
      (insert-inner-foreground   "#005f00") (insert-inner-background   "#00d787")
      (insert-center-foreground  "#005f5f") (insert-center-background  "#afff87")

      (visual-outer-foreground   "#eeeeee") (visual-outer-background   "#ff5f00")
      (visual-inner-foreground   "#5f0000") (visual-inner-background   "#ffaf00")
      (visual-center-foreground  "#d75f00") (visual-center-background  "#ffff87")

      (replace-outer-foreground  "#005f00") (replace-outer-background  "#ff0000")
      (replace-inner-foreground  "#005f00") (replace-inner-background  "#00d787")
      (replace-center-foreground "#005f5f") (replace-center-background "#afff87")

      (emacs-outer-foreground    "#eeeeee") (emacs-outer-background    "#005fff")
      (emacs-inner-foreground    "#000087") (emacs-inner-background    "#00d7ff")
      (emacs-center-foreground   "#005fff") (emacs-center-background   "#afffff")

      (inactive1-foreground      "#6c6c6c") (inactive1-background      "#b2b2b2")
      (inactive2-foreground      "#8a8a8a") (inactive2-background      "#d0d0d0")
      (inactive3-foreground      "#a8a8a8") (inactive3-background      "#eeeeee"))

  (airline-themes-set-deftheme 'airline-xtermlight)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-xtermlight)
;;; airline-xtermlight-theme.el ends here
