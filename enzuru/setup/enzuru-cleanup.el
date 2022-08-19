;; -*- coding: utf-8; lexical-binding: t -*-

(require 'midnight)
(midnight-delay-set 'midnight-delay "4:30am")

;;  Configuration

(defun enzuru-configure-diminish ()
  (diminish 'abbrev-mode)
  (diminish 'auto-revert-mode)
  (diminish 'eldoc-mode)
  
  (eval-after-load "hideshow" '(diminish 'hs-minor-mode)))

;; Packages

(use-package diminish
  :ensure t
  :config (enzuru-configure-diminish))

(provide 'enzuru-cleanup)
