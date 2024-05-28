;; -*- coding: utf-8; lexical-binding: t -*-

(require 'straight)

;; Functions

(defun enzuru-configure-guix ()
  (add-hook 'scheme-mode-hook 'guix-devel-mode))

(defun enzuru-upgrade ()
  (interactive)
  (straight-pull-all)
  (straight-freeze-versions)
  (async-shell-command "~/bin/guix-upgrade" "*guix-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/stumpwm && git pull" "*stumpwm-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/clx-truetype && git pull" "*truetype-upgrade*")
  (async-shell-command "cd ~/quicklisp/local-projects/zpb-ttf && git pull" "*zpb-ttf-upgrade*")
  (async-shell-command "cd ~/.stumpwm.d/modules && git pull" "*stumpwm-modules-upgrade*")
  (enzuru-setup-tab "upgrading"
                    "*stumpwm-upgrade*" "*truetype-upgrade*" "*guix-upgrade*"  "*Messages*"
                    "*stumpwm-modules-upgrade*" "*zpb-ttf-upgrade*"))

(defun enzuru-reboot ()
  (shell-command "sudo reboot"))

(geiser-custom--defcustom geiser-guix-manual-lookup-other-window nil
  "Non-nil means pop up the Info buffer in another window."
  :type 'boolean)

(geiser-custom--defcustom geiser-guix-manual-lookup-nodes
    '("Guix" "guix")
  "List of info nodes that, when present, are used for manual lookups."
  :type '(repeat string))

(defun geiser-guix--info-spec ()
  "Return info specification for given NODES."
  (let* ((nrx "^[       ]+-+ [^:]+:[    ]*")
         (drx "\\b")
         (res (when (Info-find-file "guix" t)
                `(("(guix)Index" nil ,nrx ,drx)))))
    (dolist (node geiser-guix-manual-lookup-nodes res)
      (when (Info-find-file node t)
        (mapc (lambda (idx)
                (add-to-list 'res
                             (list (format "(%s)%s" node idx) nil nrx drx)))
              '("Programming Index"))))))

(info-lookup-add-help :topic 'symbol
                      :mode 'guix-devel-mode
                      :ignore-case nil
                      :regexp "[^()`',\"        \n]+"
                      :doc-spec (geiser-guix--info-spec))

(defun geiser-guix--info-lookup (id)
  (cond ((null id) (info "guix"))
        ((ignore-errors (info-lookup-symbol (format "%s" id) 'guix-devel-mode) t))
        ((and (listp id) (geiser-guix--info-lookup (car (last id)))))
        (t (geiser-guix--info-lookup (when (listp id) (butlast id))))))

(defun geiser-guix-info-lookup ()
  (interactive)
  (let ((id (read-string "Symbol: ")))
    (geiser-guix--info-lookup id)))

(defun geiser-guix-info-lookup-symbol-at-point ()
  (interactive)
  (let ((id (symbol-at-point)))
    (geiser-guix--info-lookup id)))

;; (defun geiser-guix-doc-symbol-at-point (&optional arg)
;;   "Get docstring for symbol at point.
;; With prefix argument, ask for symbol (with completion)."
;;   (interactive "P")
;;   (let ((symbol (or (and (not arg) (geiser--symbol-at-point))
;;                     (geiser-completion--read-symbol
;;                      "Symbol: " (geiser--symbol-at-point)))))
;;     (when symbol (geiser-doc-symbol symbol))))

(defun geiser-guix--manual-look-up (id _mod)
  "Look for ID in the Guix manuals."
  (let ((info-lookup-other-window-flag geiser-guix-manual-lookup-other-window))
    (geiser-guix--info-lookup id)
    (when geiser-guix-manual-lookup-other-window
      (switch-to-buffer-other-window "*info*"))))

;; Packages

(use-package guix
  :ensure t)

(enzuru-configure-guix)

(provide 'enzuru-guix)
