(setq sml/mode-width 'full)
(setq sml/name-width 20)
(setq sml/shorten-modes 't)
(setq sml/no-confirm-load-theme t)

(sml/setup)

(if window-system
    (load-library "enzuru-gui"))
