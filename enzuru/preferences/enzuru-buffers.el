;; -*- coding: utf-8; lexical-binding: t -*-

;; Variables

(savehist-mode 1)
(save-place-mode 1)

;; Functions

(defun enzuru-volatile-kill-buffer ()
  "Kill current buffer unconditionally."
  (interactive)
  (let ((buffer-modified-p nil))
    (kill-buffer (current-buffer))))

;; Configuration

(defun enzuru-configure-uniquify ()
  (setq switch-to-buffer-in-dedicated-window 'pop
        kill-buffer-query-functions nil
        uniquify-buffer-name-style 'post-forward))

(enzuru-configure-uniquify)

(provide 'enzuru-buffers)
