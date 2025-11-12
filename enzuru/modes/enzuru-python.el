;;; enzuru-python.el --- Python programming configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-python-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.py$" . python-ts-mode))
  (add-hook 'python-ts-mode-hook
            (lambda ()
              (set (make-local-variable 'compile-command)
                   (concat "python3 " (buffer-name))))))

;; Packages

(use-package anaconda-mode
  :ensure t
  :hook ((python-ts-mode . anaconda-mode)
         (python-ts-mode . anaconda-eldoc-mode)
         (python-ts-mode . eglot-ensure))
  :bind (:map python-ts-mode-map (("C-c d" . anaconda-mode-show-doc))))

(enzuru-configure-python-ts-mode)

(provide 'enzuru-python)

;;; enzuru-python.el ends here
