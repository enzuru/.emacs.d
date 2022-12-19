;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company-anaconda ()
  (eval-after-load "company"
    (push 'company-anaconda company-backends))
  (add-hook 'python-mode-hook
            (lambda ()
              (set (make-local-variable 'compile-command)
                   (concat "python3 " (buffer-name))))))

;; Packages

(use-package anaconda-mode
  :ensure t)

(use-package company-anaconda
  :ensure t
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode))
  :bind (:map python-mode-map (("C-x C-d" . anaconda-mode-show-doc)
                               ("C-x C-w" . anaconda-mode-find-definitions))))

(use-package jedi
  :ensure t
  :defer t
  :hook ((python-mode . jedi-mode)
         (python-mode . eglot-ensure)))

(provide 'enzuru-python)
