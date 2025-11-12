;;; enzuru-typescript.el --- TypeScript programming configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-tide ()
  (tide-setup)
  (tide-hl-identifier-mode +1))


;; Packages

(use-package tide
  :ensure t
  :hook ((typescript-ts-mode . enzuru-configure-tide)))

(use-package typescript-ts-mode
  :defer t
  :mode (("\\.ts$" . typescript-ts-mode))
  :hook ((typescript-ts-mode . eglot-ensure))
  :custom
  (typescript-indent-level 2))

(provide 'enzuru-typescript)

;;; enzuru-typescript.el ends here
