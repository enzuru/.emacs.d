(rvm-use-default)

(setq enh-ruby-deep-indent-paren nil)
(setq rspec-use-rake-when-possible nil)
(setq compilation-scroll-output 'first-error)
(setq ruby-insert-encoding-magic-comment nil)

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enhh-ruby-mode))
(add-to-list 'hs-special-modes-alist
            '(ruby-mode
              "\\(class\\|def\\|do\\|if\\)" "\\(end\\)" "#"
              (lambda (arg) (ruby-end-of-block)) nil))

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'ruby-refactor-mode-launch)
(add-hook 'enh-ruby-mode-hook 'yard-mode)
(add-hook 'enh-ruby-mode-hook 'eldoc-mode)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (hs-minor-mode 1) ;; Enables folding
            (modify-syntax-entry ?: "."))) ;; Adds ":" to the word definition
