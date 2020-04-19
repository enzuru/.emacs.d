(add-to-list 'auto-mode-alist '("\.twig$" . web-mode))
(add-to-list 'auto-mode-alist '("\.erb$" . web-mode))

(defun enzuru-web-mode-hook ()
  "Hooks for Web mode."  
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 4))

(add-hook 'web-mode-hook  'enzuru-web-mode-hook)
