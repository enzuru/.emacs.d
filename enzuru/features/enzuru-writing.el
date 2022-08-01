;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

;; (use-package olivetti
;;   :ensure t)

(use-package flycheck-aspell
  :ensure t)

(use-package fountain-mode
  :ensure t
  :hook ((fountain-mode . variable-pitch-mode)
         (fountain-mode . olivetti-mode)
         (fountain-mode . auto-complete-mode)))

(provide 'enzuru-writing)
