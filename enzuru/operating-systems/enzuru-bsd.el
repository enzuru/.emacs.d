(load-library "enzuru-window-manager")

(setq locate-command "locate")
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq elpy-rpc-python-command "python3")
(setq locate-make-command-line
      (lambda (ss) (list locate-command "/home/enzuru" "-name" ss)))

(set-face-attribute 'default nil
                    :family "Terminus" :height 160 :weight 'normal)
(set-face-attribute 'variable-pitch nil
                    :family "Open Baskerville 0.0.75" :height 130 :weight 'normal)

(defun async-term ()
  "Open terminal"
  (interactive)
  (start-process "xterm" "xterm" "xterm"))

(find-file "~/org/index.org")
