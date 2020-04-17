
;;; Code:

(deftheme airline-base16
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#122202") (normal-outer-background   "#9ACD68")
      (normal-inner-foreground   "#A6B5C5") (normal-inner-background   "#2A3540")
      (normal-center-foreground  "#A6B5C5") (normal-center-background  "#1A2128")

      (insert-outer-foreground   "#122202") (insert-outer-background   "#A6B5C5")
      (insert-inner-foreground   "#A6B5C5") (insert-inner-background   "#141A1F")
      (insert-center-foreground  "#A6B5C5") (insert-center-background  "#1A2128")

      (visual-outer-foreground   "#122202") (visual-outer-background   "#CB96FF")
      (visual-inner-foreground   "#CB96FF") (visual-inner-background   "#141A1F")
      (visual-center-foreground  "#A6B5C5") (visual-center-background  "#1A2128")

      (replace-outer-foreground  "#122202") (replace-outer-background  "#C97016")
      (replace-inner-foreground  "#A6B5C5") (replace-inner-background  "#2A3540")
      (replace-center-foreground "#A6B5C5") (replace-center-background "#1A2128")

      (emacs-outer-foreground    "#122202") (emacs-outer-background    "#9ACD68")
      (emacs-inner-foreground    "#A6B5C5") (emacs-inner-background    "#2A3540")
      (emacs-center-foreground   "#A6B5C5") (emacs-center-background   "#1A2128")

      (inactive1-foreground      "#141A1F") (inactive1-background      "NONE")
      (inactive2-foreground      "#141A1F") (inactive2-background      "NONE")
      (inactive3-foreground      "#141A1F") (inactive3-background      "NONE"))

  (airline-themes-set-deftheme 'airline-base16)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16)
;;; airline-base16-theme.el ends here
