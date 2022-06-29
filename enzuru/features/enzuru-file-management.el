;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package sunrise
  :load-path "local/sunrise-commander"
  :bind (("M-o" . 'sunrise-synchronize-panes)
         ("C-x C-f" . 'sunrise-cd))
  :mode (("\\.srvm\\'" . sr-virtual-mode)))

(provide 'enzuru-file-management)
