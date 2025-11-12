;;; enzuru-syntax-checking.el --- Syntax checking configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-configure-flymake ()
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

;; Packages

(use-package flymake
  :ensure t
  :diminish (flymake-mode)
  :bind (("C-x n" . flymake-goto-next-error)
         ("C-x p" . flymake-goto-prev-error))
  :hook ((prog-mode . flymake-mode))
  :config (enzuru-configure-flymake))

(use-package flymake-collection
  :ensure t)

(use-package flyover
  :ensure (:host github :repo "konrad1977/flyover")
  :hook ((flymake-mode . flyover-mode))
  :diminish (flyover-mode)
  :custom
  (flyover-background-lightness 25)
  (flyover-levels '(error warning info))
  (flyover-use-theme-colors t))

(provide 'enzuru-syntax-checking)

;;; enzuru-syntax-checking.el ends here
