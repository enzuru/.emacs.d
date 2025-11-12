;;; enzuru-completion.el --- Completion framework configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-configure-cape ()
  (defun enzuru-setup-human-language-completion ()
    (setq-local completion-at-point-functions
                (list #'cape-dict
                      #'cape-dabbrev
                      #'cape-file
                      #'cape-history
                      #'cape-keyword))
    "Setup completion for human language buffers with cape-dict first.")

  (defun enzuru-setup-programming-completion ()
    "Setup completion for programming buffers."
    (setq-local completion-at-point-functions
                (list #'cape-dabbrev
                      #'cape-file
                      #'cape-elisp-block
                      #'cape-history
                      #'cape-keyword
                      #'cape-dict
                      #'cape-elisp-symbol)))

  ;; Set up hooks for human language modes
  (add-hook 'text-mode-hook #'enzuru-setup-human-language-completion)
  (add-hook 'markdown-mode-hook #'enzuru-setup-human-language-completion)
  (add-hook 'org-mode-hook #'enzuru-setup-human-language-completion)
  (add-hook 'latex-mode-hook #'enzuru-setup-human-language-completion)
  (add-hook 'tex-mode-hook #'enzuru-setup-human-language-completion)

  ;; Set up hooks for programming modes
  (add-hook 'prog-mode-hook #'enzuru-setup-programming-completion)

  ;; Default global setup (for modes not covered by hooks)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol))

;; Packages

(use-package cape
  :ensure t
  :config (enzuru-configure-cape)
  :custom (cape-dict-file (list
                           (concat user-emacs-directory "dict/english.txt")
                           (concat user-emacs-directory "dict/portuguese.txt"))))

(use-package consult
  :ensure t
  :bind (("C-s" . consult-line)
         ("C-c y" . consult-yank-pop)
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ([remap Info-search] . consult-info)
         ("C-c l" . consult-locate)
         ("C-x M-:" . consult-complex-command)
         ("C-c b" . consult-buffer)
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
  :custom
  (register-preview-delay 0.5)
  (register-preview-function #'consult-register-format)
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-definitions-function #'consult-xref)
  (consult-narrow-key "<")
  :init
  (advice-add #'register-preview :override #'consult-register-window)
  :config
  (consult-customize consult-theme :preview-key '(:debounce 0.2 any)
                     consult-ripgrep consult-git-grep consult-grep
                     consult-bookmark consult-recent-file consult-xref
                     consult--source-bookmark consult--source-file-register
                     consult--source-recent-file consult--source-project-recent-file
                     :preview-key '(:debounce 0.4 any)))

(use-package consult-ag
  :ensure t
  :bind (("C-c a" . consult-git-grep)))

(use-package corfu
  :ensure t
  :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t) ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  (corfu-quit-no-match 'separator)
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin
  :init (global-corfu-mode)
  :config (corfu-popupinfo-mode 1))

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h b" . embark-bindings)
         ("C-h B" . embark-bindings))
  :custom
  (prefix-help-command #'embark-prefix-help-command)
  :init
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*" nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

;; (use-package eldoc
;;   :ensure t)

(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(defun crm-indicator (args)
  (cons (format "[CRM%s] %s"
                (replace-regexp-in-string
                 "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'"
                 crm-separator)
                (car args))
        (cdr args)))

(advice-add #'completing-read-multiple :filter-args #'crm-indicator)
(setq minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
(setq enable-recursive-minibuffers t)
(setq completion-cycle-threshold 3)
(setq tab-always-indent 'complete)

(savehist-mode)

(provide 'enzuru-completion)

;;; enzuru-completion.el ends here
