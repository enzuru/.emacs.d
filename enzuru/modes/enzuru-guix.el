;;; enzuru-guix.el --- GNU Guix package manager integration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Functions

(defun enzuru-upgrade ()
  (interactive)
  (elpaca-pull-all)
  (elpaca-write-lock-file elpaca-lock-file)
  (async-shell-command "~/bin/guix-upgrade" "*guix-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/stumpwm && git pull" "*stumpwm-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/clx-truetype && git pull" "*truetype-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/zpb-ttf && git pull" "*zpb-ttf-upgrade*")
  (async-shell-command "cd ~/.stumpwm.d/modules && git pull" "*stumpwm-modules-upgrade*")
  (enzuru-setup-tab "upgrading"
                    "*stumpwm-upgrade*" "*truetype-upgrade*" "*guix-upgrade*"  "*Messages*"
                    "*stumpwm-modules-upgrade*" "*zpb-ttf-upgrade*"))

(defun enzuru-reboot ()
  (interactive)
  (async-shell-command "sudo reboot"))

(provide 'enzuru-guix)

;;; enzuru-guix.el ends here
