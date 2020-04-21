(setq locate-command "find")
(setq ccls-executable "/var/lib/snapd/snap/bin/ccls")
(setq browse-url-browser-function 'browse-url-firefox)

(defun async-term ()
  "Open terminal"
  (interactive)
  (start-process "urxvtc" "urxvtc" "urxvtc"))
