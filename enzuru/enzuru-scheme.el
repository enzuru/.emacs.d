(setq geiser-active-implementations '(chicken))
(add-to-list 'auto-mode-alist '("\.scm$" . scheme-mode))
(add-to-list 'auto-mode-alist '("\.scm$" . geiser-mode))

(add-hook 'scheme-mode-hook (lambda () (lispy-mode 1)))
