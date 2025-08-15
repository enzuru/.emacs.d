;;; enzuru-javascript.el --- JavaScript programming configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, javascript

;;; Commentary:

;; Configuration for JavaScript programming.

;;; Code:

;; Configuration


(defun enzuru-configure-mmm-mode ()
  (add-hook 'mmm-mode-hook
            (lambda ()
              (set-face-background 'mmm-default-submode-face nil))))

;; Packages

(use-package indium
  :ensure t
  :defer t)

(use-package js2-mode
  :ensure t
  :defer t
  :hook ((js2-mode . eglot-ensure))
  :custom
  (js2-basic-offset 2)
  (js2-strict-trailing-comma-warning nil)
  (js2-strict-missing-semi-warning nil)
  (js-indent-level 2))

(use-package mmm-mode
  :ensure t
  :defer t
  :config (enzuru-configure-mmm-mode))

(use-package rjsx-mode
  :ensure t
  :mode (("\\.js\\'" . rjsx-mode)))

(use-package vue-mode
  :ensure t
  :defer t
  :mode (("\\.vue\\'" . vue-mode)))

(provide 'enzuru-javascript)

;;; enzuru-javascript.el ends here
