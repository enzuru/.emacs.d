
;;; Code:

(deftheme airline-base16_monokai
  "source: https://github.com/vim-airline/vim-airline-themes")

(let ((normal-outer-foreground   "#383830") (normal-outer-background   "#a6e22e")
      (normal-inner-foreground   "#f5f4f1") (normal-inner-background   "#49483e")
      (normal-center-foreground  "#fd971f") (normal-center-background  "#383830")

      (insert-outer-foreground   "#383830") (insert-outer-background   "#66d9ef")
      (insert-inner-foreground   "#f5f4f1") (insert-inner-background   "#49483e")
      (insert-center-foreground  "#fd971f") (insert-center-background  "#383830")

      (visual-outer-foreground   "#383830") (visual-outer-background   "#ae81ff")
      (visual-inner-foreground   "#f5f4f1") (visual-inner-background   "#49483e")
      (visual-center-foreground  "#fd971f") (visual-center-background  "#383830")

      (replace-outer-foreground  "#383830") (replace-outer-background  "#f92672")
      (replace-inner-foreground  "#f5f4f1") (replace-inner-background  "#49483e")
      (replace-center-foreground "#fd971f") (replace-center-background "#383830")

      (emacs-outer-foreground    "#383830") (emacs-outer-background    "#a6e22e")
      (emacs-inner-foreground    "#f5f4f1") (emacs-inner-background    "#49483e")
      (emacs-center-foreground   "#fd971f") (emacs-center-background   "#383830")

      (inactive1-foreground      "#f8f8f2") (inactive1-background      "#383830")
      (inactive2-foreground      "#f8f8f2") (inactive2-background      "#383830")
      (inactive3-foreground      "#f8f8f2") (inactive3-background      "#383830"))

  (airline-themes-set-deftheme 'airline-base16_monokai)

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-base16_monokai)
;;; airline-base16_monokai-theme.el ends here
