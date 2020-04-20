(require 'semantic/sb)

(defun enzuru-c-mode-hook ()
  (setq c-default-style "bsd"
        c-basic-offset 4
        tab-width 8
        indent-tabs-mode t))

(add-hook 'c-mode-hook 'enzuru-c-mode-hook)

(global-ede-mode 1)
(semantic-mode 1)
