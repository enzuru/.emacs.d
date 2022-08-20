;; -*- coding: utf-8; lexical-binding: t -*-

;; Text management

(global-set-key (kbd "C-q") 'copy-region-as-kill)

;; Arrow keys for movement and buffer management

(global-set-key (kbd "C-<up>") 'backward-paragraph)              ;; C-<up>(buffer)
(global-set-key (kbd "C-<down>") 'forward-paragraph)             ;; C-<down>(buffer)
(global-set-key (kbd "C-x <up>") 'beginning-of-buffer)           ;; C-x(tremely)<up>
(global-set-key (kbd "C-x <down>") 'end-of-buffer)               ;; C-x(tremely)(bottom)
(global-set-key (kbd "C-x <left>") 'previous-buffer)             ;; C-x <left>(buffer)
(global-set-key (kbd "C-x <right>") 'next-buffer)                ;; C-x <right>(buffer)

;; Execute: C-x(ecute) letter

(global-set-key (kbd "C-x c") 'compile)
(global-set-key (kbd "C-x k") 'enzuru-volatile-kill-buffer)      ;; C-x(ecute) k(ill)
(global-set-key (kbd "C-x s") 'replace-string)                   ;; C-x(ecute) s(tring replacement)
(global-set-key (kbd "C-x g") 'org-agenda)                       ;; C-x(ecute) a(g)enda

;; Execute under point: C-x(ecute) C-letter

(global-set-key (kbd "C-x C-r") 'eval-region)                    ;; C-x(ecute) C-r(egion)
(global-set-key (kbd "C-x C-w") 'xref-find-definitions)          ;; C-x(ecute) C-w(here is this code)

;; Buffer browsing & management: ergonomic & simple but not memorable

(global-set-key (kbd "<C-tab>") 'other-window)                   ;; psuedo tab-like functionality

(provide 'enzuru-keys)
