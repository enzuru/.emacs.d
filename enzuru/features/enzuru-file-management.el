;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

;; (use-package sunrise
;;   :load-path "local/sunrise-commander"
;;   :bind (("M-o" . 'sunrise-synchronize-panes)
;;          ("C-x C-f" . 'sunrise-cd))
;;   :mode (("\\.srvm\\'" . sr-virtual-mode)))

(add-to-list 'load-path "~/.emacs.d/local/sunrise-commander")
(load-library "sunrise")
(global-set-key (kbd "C-x C-f") 'sunrise-cd)

(provide 'enzuru-file-management)
