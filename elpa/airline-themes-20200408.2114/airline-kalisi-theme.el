
;;; Code:

(deftheme airline-kalisi
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#005f00") (normal-outer-background   "#afd700")
      (normal-inner-foreground   "#afd700") (normal-inner-background   "#005f00")
      (normal-center-foreground  "#A6B5C5") (normal-center-background  "#1A2128")

      (insert-outer-foreground   "#ffffff") (insert-outer-background   "#e80000")
      (insert-inner-foreground   "#ff0000") (insert-inner-background   "#5f0000")
      (insert-center-foreground  "#A6B5C5") (insert-center-background  "#1A2128")

      (visual-outer-foreground   "#0087ff") (visual-outer-background   "#ffffff")
      (visual-inner-foreground   "#005faf") (visual-inner-background   "#5fafff")
      (visual-center-foreground  "#87d7ff") (visual-center-background  "#005faf")

      (replace-outer-foreground  "#d75fff") (replace-outer-background  "#ffffff")
      (replace-inner-foreground  "#5f005f") (replace-inner-background  "#d75fff")
      (replace-center-foreground "#ff87ff") (replace-center-background "#8700af")

      (emacs-outer-foreground    "#005f00") (emacs-outer-background    "#afd700")
      (emacs-inner-foreground    "#afd700") (emacs-inner-background    "#005f00")
      (emacs-center-foreground   "#A6B5C5") (emacs-center-background   "#1A2128")

      (inactive1-foreground      "#A6B5C5") (inactive1-background      "#1A2128")
      (inactive2-foreground      "#A6B5C5") (inactive2-background      "#1A2128")
      (inactive3-foreground      "#A6B5C5") (inactive3-background      "#1A2128"))

  (airline-themes-set-deftheme 'airline-kalisi)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-kalisi)
;;; airline-kalisi-theme.el ends here
