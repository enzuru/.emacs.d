
;;; Code:

(deftheme airline-zenburn
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#141A1F") (normal-outer-background   "#13AFAF")
      (normal-inner-foreground   "#13AFAF") (normal-inner-background   "#1A2128")
      (normal-center-foreground  "#6B859E") (normal-center-background  "#141A1F")

      (insert-outer-foreground   "#141A1F") (insert-outer-background   "#6ECFCF")
      (insert-inner-foreground   "#6ECFCF") (insert-inner-background   "#1A2128")
      (insert-center-foreground  "#6B859E") (insert-center-background  "#141A1F")

      (visual-outer-foreground   "#141A1F") (visual-outer-background   "#EDA55D")
      (visual-inner-foreground   "#EDA55D") (visual-inner-background   "#1A2128")
      (visual-center-foreground  "#6B859E") (visual-center-background  "#141A1F")

      (replace-outer-foreground  "#141A1F") (replace-outer-background  "#6B859E")
      (replace-inner-foreground  "#6B859E") (replace-inner-background  "#1A2128")
      (replace-center-foreground "#6B859E") (replace-center-background "#141A1F")

      (emacs-outer-foreground    "#141A1F") (emacs-outer-background    "#13AFAF")
      (emacs-inner-foreground    "#13AFAF") (emacs-inner-background    "#1A2128")
      (emacs-center-foreground   "#6B859E") (emacs-center-background   "#141A1F")

      (inactive1-foreground      "#6B859E") (inactive1-background      "#141A1F")
      (inactive2-foreground      "#6B859E") (inactive2-background      "#141A1F")
      (inactive3-foreground      "#6B859E") (inactive3-background      "#141A1F"))

  (airline-themes-set-deftheme 'airline-zenburn)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-zenburn)
;;; airline-zenburn-theme.el ends here
