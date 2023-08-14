;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company-anaconda ()
  (if (not (member 'company-anaconda company-backends))
      (push 'company-anaconda company-backends)))

(defun enzuru-configure-python-compile-command ()
  (add-hook 'python-mode-hook
            (lambda ()
              (set (make-local-variable 'compile-command)
                   (concat "python3 " (buffer-name))))))

;; Packages

(use-package anaconda-mode
  :ensure t
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode))
  :bind (:map python-mode-map (("C-x C-d" . anaconda-mode-show-doc)
                               ("C-x C-w" . anaconda-mode-find-definitions))))

(use-package company-anaconda
  :ensure t
  :hook ((python-mode . enzuru-configure-company-anaconda)))

(enzuru-configure-python-compile-command)

(provide 'enzuru-python)
