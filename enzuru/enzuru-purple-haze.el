(add-to-list 'custom-theme-load-path "~/.emacs.d/local/purple-haze-theme/")
(load-theme 'purple-haze t)

(sml/apply-theme 'dark)

(set-face-background 'hl-line "#222222")
(set-face-attribute 'fringe nil :background "#000000" :foreground "#FFFFFF")

(custom-theme-set-variables
 'purple-haze
 '(linum-format " %7d "))

(set-face-attribute 'region nil :background "#666")

(set-face-attribute 'default nil
                    :family "Liberation Mono" :height 120 :weight 'normal)
