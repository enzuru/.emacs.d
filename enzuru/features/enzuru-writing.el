(setq olivetti-body-width 90)

(add-hook 'olivetti-mode-hook
          (lambda ()
            (setq olivetti-body-width 90)
            (olivetti-toggle-hide-modeline)))

(add-hook 'fountain-mode-hook
          (lambda ()
            (variable-pitch-mode)
                (olivetti-mode)
                (auto-complete-mode)))
