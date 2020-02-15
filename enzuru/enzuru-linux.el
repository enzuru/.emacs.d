(setq locate-command "find")

(load-library "enzuru-window-management")

(defun async-term ()
  "Open terminal"
  (interactive)
  (start-process "urxvtc" "urxvtc" "urxvtc"))
