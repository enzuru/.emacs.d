(defun uname ()
  (interactive)
  (intern (string-trim (shell-command-to-string "/usr/bin/uname"))))
