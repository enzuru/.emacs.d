;;; enzuru-keys.el --- Global key bindings configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-volatile-kill-buffer ()
  "Kill current buffer unconditionally."
  (interactive)
  (let ((buffer-modified-p nil))
    (kill-buffer (current-buffer))))

(defun enzuru-set-global-keys ()
  (global-set-key (kbd "C-c i") 'describe-symbol)
  (global-set-key (kbd "C-c o") 'compile)
  (global-set-key (kbd "C-c k") 'enzuru-volatile-kill-buffer)
  (global-set-key (kbd "C-c r") 'replace-string)
  (global-set-key (kbd "C-c t") 'tab-bar-select-tab-by-name)
  (global-set-key (kbd "C-c <left>") 'previous-buffer)
  (global-set-key (kbd "C-c <right>") 'next-buffer)
  (global-set-key (kbd "C-c <up>") 'beginning-of-buffer)
  (global-set-key (kbd "C-c <down>") 'end-of-buffer))

;; (enzuru-set-global-keys)
;; (add-hook 'elpaca-after-init-hook 'enzuru-set-global-keys)
;; (add-hook 'after-init-hook 'enzuru-set-global-keys)
;; (add-hook 'elpaca-after-init-hook 'enzuru-configure-completing-read-sly)
(run-at-time "5 sec" nil 'enzuru-set-global-keys)
;;(add-hook 'after-init-hook 'enzuru-configure-completing-read-sly)
;;(add-hook 'elpaca-after-init-hook 'which-key-mode)

(provide 'enzuru-keys)

;;; enzuru-keys.el ends here
