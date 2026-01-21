;;; enzuru-haskell.el --- Haskell programming configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configure

(defun enzuru-configure-haskell-ts-mode ()
  (add-hook 'haskell-ts-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-ts-mode-hook 'turn-on-haskeull-indent)
  (put 'downcase-region 'disabled nil))

;; Packages

(use-package haskell-mode
  :ensure t
  :defer t
  :hook ((haskell-mode . eglot-ensure))
  :mode (("\\.hs$" . haskell-mode)
         ("\\.lhs$" . haskell-mode)))

;; (use-package haskell-ts-mode
;;   :ensure t
;;   :defer t
;;   :config (enzuru-configure-haskell-ts-mode)
;;   :hook ((haskell-ts-mode . eglot-ensure)))

(provide 'enzuru-haskell)

;;; enzuru-haskell.el ends here
