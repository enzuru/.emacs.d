(load-library "enzuru-enthusiast")

(setq locate-command "locate")

(setq locate-make-command-line
      (lambda (ss) (list locate-command "/home/enzuru" "-name" ss)))

(set-face-attribute 'default nil
                    :family "Terminus" :height 160 :weight 'normal)

(set-face-attribute 'variable-pitch nil
                    :family "Open Baskerville 0.0.75" :height 130 :weight 'normal)

(defun async-term ()
  "Open terminal"
  (interactive)
  (start-process "urxvtc" "urxvtc" "urxvtc"))

(require 'exwm-config)
(exwm-config-default)

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'exwm-systemtray)
(exwm-systemtray-enable)

(setq elpy-rpc-python-command "python3")

(find-file "~/org/index.org")
