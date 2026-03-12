;;; enzuru-compile.el --- Compilation configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(advice-add 'compile :filter-args
  (lambda (args)
    (list (car args) t)))

(provide 'enzuru-compile)

;;; enzuru-compile.el ends here
