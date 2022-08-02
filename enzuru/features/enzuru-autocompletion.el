;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company ()
  (setq company-idle-delay 0)
  (add-hook 'after-init-hook 'global-company-mode))

(defun enzuru-configure-company-lsp ()
  (push 'company-lsp company-backends))

(defun enzuru-configure-ivy ()
  (setq ivy-display-style 'fancy
        ivy-use-virtual-buffers t
        enable-recursive-minibuffers t
        ivy-wrap t))

(defun enzuru-configure-ivy-xref ()
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

;; Packages

(use-package ccls
  :ensure t)

(use-package company
  :ensure t
  :config (enzuru-configure-company))

;; (use-package company-lsp
;;   :ensure t
;;   :config (enzuru-configure-company-lsp))

(use-package counsel
  :ensure t
  :bind (("C-h b" . counsel-descbinds)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-x f" . counsel-find-file)
         ("C-x l" . counsel-locate)
         ("C-y" . counsel-yank-pop)
         ("C-x C-m" . counsel-M-x)
         ("C-x C-c" . counsel-ag)))

(use-package lsp-mode
  :ensure t
  :hook ((c-mode . lsp)
         (java-mode . lsp)
         (objc-mode . lsp)))

(use-package lsp-ivy
  :ensure t)

(use-package lsp-ui
  :bind (:map java-mode-map
              ("C-x C-r" . lsp-ui-peek-find-references)
              ("C-x C-w" . lsp-ui-peek-find-definitions)
              :map objc-mode-map
              ("C-x C-r" . lsp-ui-peek-find-references)
              ("C-x C-w" . lsp-ui-peek-find-definitions))
  :ensure t)

(use-package ivy
  :ensure t
  :bind ((("C-x b" . 'ivy-switch-buffer))
         (("C-x C-b" . 'ivy-switch-buffer)))
  :config (enzuru-configure-ivy))

(use-package ivy-xref
  :ensure t
  :config (enzuru-configure-ivy-xref))

(use-package swiper
  :ensure t
  :bind ((("C-s" . 'swiper-isearch))))

(provide 'enzuru-autocompletion)
