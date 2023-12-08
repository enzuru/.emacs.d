;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company-anaconda ()
  (cl-pushnew 'company-anaconda company-backends))

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
  :bind (:map python-ts-mode-map (("C-x C-d" . anaconda-mode-show-doc)
                               ("C-x C-w" . anaconda-mode-find-definitions))))

(use-package company-anaconda
  :ensure t
  :hook ((python-ts-mode . enzuru-configure-company-anaconda)))

(enzuru-configure-python-ts-mode)

(provide 'enzuru-python)
