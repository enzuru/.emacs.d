
;;; Code:

(deftheme airline-tomorrow
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#141A1F") (normal-outer-background   "#13AFAF")
      (normal-inner-foreground   "#141A1F") (normal-inner-background   "#6B859E")
      (normal-center-foreground  "#A6B5C5") (normal-center-background  "#1A2128")

      (insert-outer-foreground   "#141A1F") (insert-outer-background   "#13AFAF")
      (insert-inner-foreground   "#13AFAF") (insert-inner-background   "#141A1F")
      (insert-center-foreground  "#A6B5C5") (insert-center-background  "#1A2128")

      (visual-outer-foreground   "#141A1F") (visual-outer-background   "#CB96FF")
      (visual-inner-foreground   "#CB96FF") (visual-inner-background   "#141A1F")
      (visual-center-foreground  "#A6B5C5") (visual-center-background  "#1A2128")

      (replace-outer-foreground  "#EC5252") (replace-outer-background  "#141A1F")
      (replace-inner-foreground  "#141A1F") (replace-inner-background  "#6B859E")
      (replace-center-foreground "#A6B5C5") (replace-center-background "#1A2128")

      (emacs-outer-foreground    "#141A1F") (emacs-outer-background    "#13AFAF")
      (emacs-inner-foreground    "#141A1F") (emacs-inner-background    "#6B859E")
      (emacs-center-foreground   "#A6B5C5") (emacs-center-background   "#1A2128")

      (inactive1-foreground      "#6B859E") (inactive1-background      "#1A2128")
      (inactive2-foreground      "#6B859E") (inactive2-background      "#1A2128")
      (inactive3-foreground      "#6B859E") (inactive3-background      "#1A2128"))

  (airline-themes-set-deftheme 'airline-tomorrow)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-tomorrow)
;;; airline-tomorrow-theme.el ends here
