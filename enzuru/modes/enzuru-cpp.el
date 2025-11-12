;;; enzuru-cpp.el --- C++ programming language support -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(defun enzuru-configure-c++-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.cpp$" . c++-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.hh$" . c++-ts-mode))
  (add-hook 'c++-ts-mode-hook 'eglot-ensure)
  ;;(define-key c++-ts-mode-map (kbd "C-c d") 'enzuru-man-open)
  )

(enzuru-configure-c++-ts-mode)

(provide 'enzuru-cpp)

;;; enzuru-cpp.el ends here
