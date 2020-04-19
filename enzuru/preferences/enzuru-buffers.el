(require 'uniquify)
(require 'saveplace)

(savehist-mode 1)

(setq switch-to-buffer-in-dedicated-window 'pop)
(setq kill-buffer-query-functions nil)
(setq uniquify-buffer-name-style 'post-forward)
(setq-default save-place t)

(defun volatile-kill-buffer ()
  "Kill current buffer unconditionally."
   (interactive)
   (let ((buffer-modified-p nil))
     (kill-buffer (current-buffer))))
