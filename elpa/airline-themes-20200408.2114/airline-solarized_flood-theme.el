
;;; Code:

(deftheme airline-solarized_flood
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#002B36") (normal-outer-background   "#859900")
      (normal-inner-foreground   "#93A1A1") (normal-inner-background   "#002B36")
      (normal-center-foreground  "#2AA198") (normal-center-background  "#002B36")

      (insert-outer-foreground   "#002B36") (insert-outer-background   "#2AA198")
      (insert-inner-foreground   "#93A1A1") (insert-inner-background   "#002B36")
      (insert-center-foreground  "#268BD2") (insert-center-background  "#002B36")

      (visual-outer-foreground   "#002B36") (visual-outer-background   "#B58900")
      (visual-inner-foreground   "#93A1A1") (visual-inner-background   "#002B36")
      (visual-center-foreground  "#DC322F") (visual-center-background  "#002B36")

      (replace-outer-foreground  "#002B36") (replace-outer-background  "#DC322F")
      (replace-inner-foreground  "#93A1A1") (replace-inner-background  "#002B36")
      (replace-center-foreground "#268BD2") (replace-center-background "#002B36")

      (emacs-outer-foreground    "#002B36") (emacs-outer-background    "#859900")
      (emacs-inner-foreground    "#93A1A1") (emacs-inner-background    "#002B36")
      (emacs-center-foreground   "#2AA198") (emacs-center-background   "#002B36")

      (inactive1-foreground      "#4e4e4e") (inactive1-background      "#1c1c1c")
      (inactive2-foreground      "#4e4e4e") (inactive2-background      "#262626")
      (inactive3-foreground      "#4e4e4e") (inactive3-background      "#303030"))

  (airline-themes-set-deftheme 'airline-solarized_flood)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-solarized_flood)
;;; airline-solarized_flood-theme.el ends here
