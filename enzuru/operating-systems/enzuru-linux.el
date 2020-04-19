(setq locate-command "find")

(defun async-term ()
  "Open terminal"
  (interactive)
  (start-process "urxvtc" "urxvtc" "urxvtc"))
