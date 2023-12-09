;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-configure-c++-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.cpp$" . c++-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.hh$" . c++-ts-mode))
  (add-hook 'c++-ts-mode-hook 'eglot-ensure)
  (define-key c++-ts-mode-map (kbd "C-x C-d") 'enzuru-man-open))

(enzuru-configure-c++-ts-mode)

(provide 'enzuru-cpp)
