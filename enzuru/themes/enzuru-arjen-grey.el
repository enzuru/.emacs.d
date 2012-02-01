;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-arjen-grey ()
  (load-theme 'arjen-grey t)

  (set-face-background 'hl-line "#000000")
  (set-face-background 'mode-line-inactive "#2A2F38")

  (custom-theme-set-variables
   'arjen-grey
   '(main-line-color1 "#191919")
   '(main-line-color2 "#111111")
   '(fringe-mode 6 nil (fringe))
   '(hl-line ((t (:inherit highlight :background "#4B0082")))))

  (sml/apply-theme 'respectful))

;; Packages

(use-package arjen-grey-theme
  :load-path "local/arjen-grey-theme"
  :config (enzuru-configure-arjen-grey))

(provide 'enzuru-arjen-grey)
