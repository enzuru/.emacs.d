
;;; Code:

(deftheme airline-badwolf
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#141413") (normal-outer-background   "#aeee00")
      (normal-inner-foreground   "#f4cf86") (normal-inner-background   "#45413b")
      (normal-center-foreground  "#8cffba") (normal-center-background  "#242321")

      (insert-outer-foreground   "#141413") (insert-outer-background   "#0a9dff")
      (insert-inner-foreground   "#f4cf86") (insert-inner-background   "#005fff")
      (insert-center-foreground  "#0a9dff") (insert-center-background  "#242321")

      (visual-outer-foreground   "#141413") (visual-outer-background   "#ffa724")
      (visual-inner-foreground   "#000000") (visual-inner-background   "#fade3e")
      (visual-center-foreground  "#000000") (visual-center-background  "#b88853")

      (replace-outer-foreground  "#141413") (replace-outer-background  "#ff9eb8")
      (replace-inner-foreground  "#f4cf86") (replace-inner-background  "#005fff")
      (replace-center-foreground "#0a9dff") (replace-center-background "#242321")

      (emacs-outer-foreground    "#141413") (emacs-outer-background    "#aeee00")
      (emacs-inner-foreground    "#f4cf86") (emacs-inner-background    "#45413b")
      (emacs-center-foreground   "#8cffba") (emacs-center-background   "#242321")

      (inactive1-foreground      "#242321") (inactive1-background      "#45413b")
      (inactive2-foreground      "#242321") (inactive2-background      "#45413b")
      (inactive3-foreground      "#242321") (inactive3-background      "#45413b"))

  (airline-themes-set-deftheme 'airline-badwolf)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-badwolf)
;;; airline-badwolf-theme.el ends here
