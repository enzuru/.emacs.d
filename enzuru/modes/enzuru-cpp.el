;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-c++-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.cpp$" . c++-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.hh$" . c++-ts-mode))
  (add-hook 'c++-ts-mode-hook 'eglot-ensure))

(enzuru-configure-c++-ts-mode)

(provide 'enzuru-cpp)
