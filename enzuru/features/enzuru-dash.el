;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package dash-at-point
  :ensure t
  :bind (("C-c d" . dash-at-point)
         ("C-c e" . dash-at-point-with-docset)))

(provide 'enzuru-dash)
