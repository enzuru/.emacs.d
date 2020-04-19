(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

(setq-default js2-basic-offset 2)
(setq js2-higlight-level 3)
(setq js2-strict-trailing-comma-warning nil)
(setq js2-strict-missing-semi-warning nil)
(setq js-indent-level 2)

(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)))
