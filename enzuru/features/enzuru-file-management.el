;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

;; (use-package sunrise
;;   :load-path "local/sunrise-commander"
;;   :bind (("M-o" . 'sunrise-synchronize-panes)
;;          ("C-x C-f" . 'sunrise-cd))
;;   :mode (("\\.srvm\\'" . sr-virtual-mode)))

(straight-use-package
 '(sunrise-commander
   :type git
   :host github
   :repo "sunrise-commander/sunrise-commander"
   :fork (:repo "enzuru/sunrise-commander" :branch "attempting-to-stabilize")))

(load-library "sunrise")
(global-set-key (kbd "C-x C-f") 'sunrise-cd)

(provide 'enzuru-file-management)
