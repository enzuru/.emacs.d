;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-js2-mode ()
  (setq-default js2-basic-offset 2)
  (setq js2-strict-trailing-comma-warning nil
        js2-strict-missing-semi-warning nil
        js-indent-level 2))

(defun enzuru-configure-mmm-mode ()
  (add-hook 'mmm-mode-hook
            (lambda ()
              (set-face-background 'mmm-default-submode-face nil))))

;; Packages

(use-package js2-mode
  :ensure t
  :config (enzuru-configure-js2-mode))

(use-package mmm-mode
  :ensure t
  :config (enzuru-configure-mmm-mode))

(use-package rjsx-mode
  :ensure t
  :mode (("\\.js\\'" . rjsx-mode)))

(provide 'enzuru-javascript)
