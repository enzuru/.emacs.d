;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-enh-ruby-mode ()
  (add-to-list 'hs-special-modes-alist
               '(ruby-mode
                 "\\(class\\|def\\|do\\|if\\)" "\\(end\\)" "#"
                 (lambda (arg) (ruby-end-of-block)) nil))

  (add-hook 'enh-ruby-mode-hook
            (lambda ()
              (hs-minor-mode 1) ;; Enables folding
              (modify-syntax-entry ?: ".")))
  
  (setq enh-ruby-deep-indent-paren nil)
  (setq rspec-use-rake-when-possible nil)
  (setq compilation-scroll-output 'first-error)
  (setq ruby-insert-encoding-magic-comment nil)
  (rvm-use-default))

(defun enzuru-configure-inf-ruby ()
  (add-hook 'after-init-hook 'inf-ruby-switch-setup))

;; Packages

(use-package enh-ruby-mode
  :ensure t
  :mode (("\\.rb$" . enh-ruby-mode)
         ("\\.rake$" . enh-ruby-mode)
         ("Rakefile$" . enh-ruby-mode)
         ("\\.gemspec$" . enh-ruby-mode)
         ("\\.ru$" . enh-ruby-mode)
         ("Gemfile$" . enh-ruby-mode))
  :config (enzuru-configure-enh-ruby-mode))

(use-package inf-ruby
  :ensure t
  :config (enzuru-configure-inf-ruby))

(use-package robe
  :hook (enh-ruby-mode-hook . robe-mode)
  :ensure t)

(use-package ruby-refactor
  :hook (enh-ruby-mode-hook . ruby-refactor-mode-launch)
  :ensure t)

(use-package yard-mode
  :hook (enh-ruby-mode-hook . yard-mode)
  :ensure t)

(provide 'enzuru-ruby)
