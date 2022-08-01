;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-flycheck-aspell ()
  (add-to-list 'flycheck-checkers 'markdown-aspell-dynamic)
  (add-to-list 'flycheck-checkers 'mail-aspell-dynamic))

;; Packages

;; (use-package olivetti
;;   :ensure t)

(use-package flycheck-aspell
  :ensure t
  :config (enzuru-configure-flycheck-aspell))

(use-package fountain-mode
  :ensure t
  :hook ((fountain-mode . variable-pitch-mode)
         (fountain-mode . olivetti-mode)
         (fountain-mode . auto-complete-mode)))

(provide 'enzuru-writing)
