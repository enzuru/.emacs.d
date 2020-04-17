
;;; Code:

(deftheme airline-biogoo
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#141A1F") (normal-outer-background   "#13AFAF")
      (normal-inner-foreground   "#13AFAF") (normal-inner-background   "#1A2128")
      (normal-center-foreground  "#13AFAF") (normal-center-background  "#141A1F")

      (insert-outer-foreground   "#141A1F") (insert-outer-background   "#141A1F")
      (insert-inner-foreground   "#13AFAF") (insert-inner-background   "#1A2128")
      (insert-center-foreground  "#13AFAF") (insert-center-background  "#141A1F")

      (visual-outer-foreground   "#141A1F") (visual-outer-background   "#EC5252")
      (visual-inner-foreground   "#13AFAF") (visual-inner-background   "#1A2128")
      (visual-center-foreground  "#13AFAF") (visual-center-background  "#141A1F")

      (replace-outer-foreground  "#141A1F") (replace-outer-background  "#6ECFCF")
      (replace-inner-foreground  "#13AFAF") (replace-inner-background  "#1A2128")
      (replace-center-foreground "#13AFAF") (replace-center-background "#141A1F")

      (emacs-outer-foreground    "#141A1F") (emacs-outer-background    "#13AFAF")
      (emacs-inner-foreground    "#13AFAF") (emacs-inner-background    "#1A2128")
      (emacs-center-foreground   "#13AFAF") (emacs-center-background   "#141A1F")

      (inactive1-foreground      "#13AFAF") (inactive1-background      "#141A1F")
      (inactive2-foreground      "#13AFAF") (inactive2-background      "#141A1F")
      (inactive3-foreground      "#13AFAF") (inactive3-background      "#141A1F"))

  (airline-themes-set-deftheme 'airline-biogoo)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-biogoo)
;;; airline-biogoo-theme.el ends here
