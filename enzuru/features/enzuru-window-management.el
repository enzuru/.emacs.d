;; -*- coding: utf-8; lexical-binding: t -*-

(straight-use-package '(xelb :type git :host github :repo "ch11ng/xelb"))
(straight-use-package '(exwm :type git :host github :repo "ch11ng/exwm"))

(require 'xcb)
(require 'exwm-config)
(require 'exwm-systemtray)

(add-hook 'exwm-update-class-hook
          (lambda ()
            (exwm-workspace-rename-buffer exwm-class-name)))

(setq exwm-input-global-keys
      `(
        ;; 's-r': Reset (to line-mode).
        ([?\s-r] . exwm-reset)
        ;; 's-w': Switch workspace.
        ([?\s-w] . exwm-workspace-switch)
        ;; 's-&': Launch application.
        ([?\s-&] . (lambda (command)
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command command nil command)))
        ;; 's-N': Switch to certain workspace.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))

(setq exwm-input-simulation-keys
      '(
        ;; movement
        ([?\C-f] . [prior])
        ([?\C-v] . [next])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\C-d] . [delete])
        ;; tabs
        ([?\C-t] . [?\C-t])
        ([?\C-w] . [?\C-w])
        ;; cut/paste.
        ([?\M-w] . [?\C-c])
        ([?\C-y] . [?\C-v])
        ([?\C-k] . [S-end delete])
        ;; search
        ([?\C-s] . [?\C-f])))

(define-key exwm-mode-map (kbd "C-b") 'ivy-switch-buffer)
(define-key exwm-mode-map (kbd "S-<up>") 'windmove-up)
(define-key exwm-mode-map (kbd "S-<left>") 'windmove-left)
(define-key exwm-mode-map (kbd "S-<right>") 'windmove-right)
(define-key exwm-mode-map (kbd "S-<down>") 'windmove-down)

(exwm-enable)
(exwm-config-ido)

(provide 'enzuru-window-management)
