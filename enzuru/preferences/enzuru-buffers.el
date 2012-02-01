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

(defun enzuru-kill-if-sunrise (buffer)
  (if (cl-search "Sunrise" (buffer-name buffer))
      (kill-buffer buffer)))

(defun enzuru-kill-sunrise-buffers ()
  (interactive)
  (mapc
   'kill-if-sunrise
   (buffer-list)))

;; Configuration

(defun enzuru-configure-uniquify ()
  (setq switch-to-buffer-in-dedicated-window 'pop)
  (setq kill-buffer-query-functions nil)
  (setq uniquify-buffer-name-style 'post-forward))

(enzuru-configure-uniquify)

(provide 'enzuru-buffers)
