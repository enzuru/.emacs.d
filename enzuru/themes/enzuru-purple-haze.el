(add-to-list 'custom-theme-load-path "~/.emacs.d/local/purple-haze-theme/")
(load-theme 'purple-haze t)

(set-face-background 'hl-line "#222222")
(set-face-attribute 'fringe nil :background "#000000" :foreground "#FFFFFF")
(set-face-attribute 'region nil :background "#666")
(set-face-attribute 'default nil
                    :family "Liberation Mono" :height 120 :weight 'normal)

(sml/apply-theme 'dark)
