(setq locate-command "find")
(setq ccls-executable "/var/lib/snapd/snap/bin/ccls")

(defun async-term ()
  "Open terminal"
  (interactive)
  (start-process "urxvtc" "urxvtc" "urxvtc"))
