;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-blacken ()
  (add-hook 'before-save-hook 'blacken-buffer))

(defun enzuru-configure-company-anaconda ()
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))
  (add-hook 'python-mode-hook
            (lambda ()
              (set (make-local-variable 'compile-command)
                   (concat "python3 " (buffer-name))))))

(defun enzuru-configure-importmagic ()
  (add-hook 'before-save-hook 'importmagic-fix-imports))

(defun enzuru-configure-pyimport ()
  (add-hook 'before-save-hook 'pyimport-remove-unused))

(defun enzuru-configure-pyimpsort ()
  (add-hook 'before-save-hook 'pyimpsort-buffer))

;; Packages

(use-package anaconda-mode
  :ensure t)

(use-package blacken
  :ensure t
  :config (enzuru-configure-blacken))

(use-package company-anaconda
  :ensure t
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode))
  :bind (("C-x C-d" . 'anaconda-mode-show-doc)
         ("C-x C-w" . 'anaconda-mode-find-definitions)))

(use-package importmagic
  :ensure t
  :hook ((python-mode . importmagic-mode))
  :config (enzuru-configure-importmagic))

(use-package pyimport
  :ensure t
  :config (enzuru-configure-pyimport))

(use-package pyimpsort
  :ensure t
  :config (enzuru-configure-pyimpsort))

(provide 'enzuru-python)
