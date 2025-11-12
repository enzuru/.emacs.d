;;; enzuru-yaml.el --- YAML configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration


;; Packages

(use-package yaml-mode
  :ensure t
  :defer t
  :custom
  (yaml-indent-offset 2))

(provide 'enzuru-yaml)

;;; enzuru-yaml.el ends here
