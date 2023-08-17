;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-company ()
  (setq company-idle-delay 0
        company-tooltip-align-annotations t)
  (add-hook 'after-init-hook 'global-company-mode))

(defun enzuru-configure-company-lsp ()
  (add-to-list 'company-lsp company-backends))

(defun enzuru-initialize-emacs ()
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)
  (setq minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  (setq enable-recursive-minibuffers t))

(defun enzuru-initialize-orderless ()
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(defun enzuru-initialize-consult ()
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref))

(defun enzuru-configure-consult ()
  (consult-customize consult-theme :preview-key '(:debounce 0.2 any)
                     consult-ripgrep consult-git-grep consult-grep
                     consult-bookmark consult-recent-file consult-xref
                     consult--source-bookmark consult--source-file-register
                     consult--source-recent-file consult--source-project-recent-file
                     :preview-key '(:debounce 0.4 any))
  (setq consult-narrow-key "<"))

(defun enzuru-initialize-embark ()
  (setq prefix-help-command #'embark-prefix-help-command)
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target))

(defun enzuru-configure-embark ()
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*" nil
                 (window-parameters (mode-line-format . none)))))

;; Packages

(use-package company
  :ensure t
  :diminish company-mode
  :config (enzuru-configure-company))

(use-package flymake-collection
  :ensure t)

(use-package vertico
  :init (vertico-mode))

(use-package savehist
  :init (savehist-mode))

(use-package emacs
  :init (enzuru-initialize-emacs))

(use-package orderless
  :init (enzuru-initialize-orderless))

;; Example configuration for Consult
(use-package consult
  :bind (("C-s" . consult-line)
         ("C-y" . consult-yank-pop)
         ("C-c M-x" . consult-mode-command)
         ("C-x C-m" . execute-extended-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ("C-x l" . consult-locate)
         ("C-x M-:" . consult-complex-command)
         ("C-x b" . consult-buffer)
         ("C-x C-b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-x r b" . consult-bookmark)
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)
         ("C-M-#" . consult-register)
         ("M-y" . consult-yank-pop)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g o" . consult-outline)
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)
         ("M-s e" . consult-isearch-history)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         :map minibuffer-local-map
         ("M-s" . consult-history)
         ("M-r" . consult-history))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init (enzuru-initialize-consult)
  :config (enzuru-configure-consult))

(use-package consult-ag
  :ensure t
  :bind (("C-x C-c" . consult-ag)))

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h b" . embark-bindings)
         ("C-h B" . embark-bindings))
  :init (enzuru-initialize-embark)
  :config (enzuru-configure-embark))

(use-package embark-consult
  :ensure t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(provide 'enzuru-completion)
