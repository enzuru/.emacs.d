;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company ()
  (setq company-idle-delay 0
        company-tooltip-align-annotations t)
  (add-hook 'after-init-hook 'global-company-mode))

(defun enzuru-configure-company-lsp ()
  (push 'company-lsp company-backends))

(defun enzuru-configure-ivy ()
  (setq ivy-display-style 'fancy
        ivy-use-virtual-buffers t
        enable-recursive-minibuffers t
        ivy-wrap t
        completing-read-function 'ivy-completing-read))

(defun enzuru-configure-ivy-xref ()
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(defun enzuru-configure-swiper ()
  (defun swiper-all-buffer-p (buffer)
    (with-current-buffer buffer
      (not (eq major-mode 'minibuffer-inactive-mode)))))

;; Packages

(use-package company
  :ensure t
  :diminish company-mode
  :config (enzuru-configure-company))

(use-package counsel
  :ensure t
  :diminish counsel-mode
  :bind (("C-h b" . counsel-descbinds)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-x f" . counsel-find-file)
         ("C-x l" . counsel-locate)
         ("C-y" . counsel-yank-pop)
         ("C-x C-m" . counsel-M-x)
         ("C-x C-c" . counsel-ag)
         ("C-x C-z" . swiper-all)))

(use-package flymake-collection
  :ensure t)

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind (("C-x b" . 'ivy-switch-buffer)
         ("C-x C-b" . 'ivy-switch-buffer))
  :config (enzuru-configure-ivy))

(use-package ivy-xref
  :ensure t
  :config (enzuru-configure-ivy-xref))

(use-package swiper
  :ensure t
  :config (enzuru-configure-swiper)
  :bind (("C-s" . 'swiper-isearch)))

(provide 'enzuru-completion)
