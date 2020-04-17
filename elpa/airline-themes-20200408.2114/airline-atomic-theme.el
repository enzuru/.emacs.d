
;;; Code:

(deftheme airline-atomic
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#141A1F") (normal-outer-background   "#13AFAF")
      (normal-inner-foreground   "#141A1F") (normal-inner-background   "#6B859E")
      (normal-center-foreground  "#13AFAF") (normal-center-background  "#1A2128")

      (insert-outer-foreground   "#141A1F") (insert-outer-background   "#5DA713")
      (insert-inner-foreground   "#141A1F") (insert-inner-background   "#6B859E")
      (insert-center-foreground  "#5DA713") (insert-center-background  "#1A2128")

      (visual-outer-foreground   "#141A1F") (visual-outer-background   "#C97016")
      (visual-inner-foreground   "#141A1F") (visual-inner-background   "#6B859E")
      (visual-center-foreground  "#C97016") (visual-center-background  "#1A2128")

      (replace-outer-foreground  "#141A1F") (replace-outer-background  "#EC5252")
      (replace-inner-foreground  "#141A1F") (replace-inner-background  "#6B859E")
      (replace-center-foreground "#EC5252") (replace-center-background "#1A2128")

      (emacs-outer-foreground    "#141A1F") (emacs-outer-background    "#13AFAF")
      (emacs-inner-foreground    "#141A1F") (emacs-inner-background    "#6B859E")
      (emacs-center-foreground   "#13AFAF") (emacs-center-background   "#1A2128")

      (inactive1-foreground      "#6B859E") (inactive1-background      "#1A2128")
      (inactive2-foreground      "#6B859E") (inactive2-background      "#1A2128")
      (inactive3-foreground      "#6B859E") (inactive3-background      "#1A2128"))

  (airline-themes-set-deftheme 'airline-atomic)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-atomic)
;;; airline-atomic-theme.el ends here
