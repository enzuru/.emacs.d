;; -*- coding: utf-8; lexical-binding: t -*-

;;  Configuration

(defun enzuru-configure-diminish ()
  (diminish 'abbrev-mode)
  (diminish 'auto-revert-mode)
  (diminish 'company-mode)
  (diminish 'counsel-mode)
  (diminish 'eldoc-mode)
  (diminish 'flycheck-mode)
  (diminish 'import)
  (diminish 'importmagic-mode)
  (diminish 'ivy-mode)
  (diminish 'magit-auto-revert-mode)
  (diminish 'paredit-mode)
  (diminish 'projectile-mode)
  (diminish 'ruby-refactor-mode)
  (diminish 'ruby-tools-mode)
  (diminish 'smartparens-mode)
  (diminish 'which-key-mode)
  (diminish 'undo-tree-mode)
  (diminish 'yard-mode)

  (eval-after-load "company" '(diminish 'company-mode))
  (eval-after-load "counsel" '(diminish 'counsel-mode))
  (eval-after-load "filladapt" '(diminish 'filladapt-mode))
  (eval-after-load "hideshow" '(diminish 'hs-minor-mode))
  (eval-after-load "importmagic" '(diminish 'importmagic-mode))
  (eval-after-load "ivy" '(diminish 'ivy-mode))
  (eval-after-load "paredit" '(diminish 'paredit-mode))
  (eval-after-load "robe" '(diminish 'robe-mode))
  (eval-after-load "smartparens" '(diminish 'smartparens-mode)))

;; Packages

(use-package diminish
  :ensure t
  :config (enzuru-configure-diminish))

(provide 'enzuru-cleanup)
