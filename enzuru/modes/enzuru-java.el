;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(use-package flymake-gradle
  :ensure t
  :hook ((java-mode-hook . flymake-gradle-add-hook)
         (kotlin-mode-hook . flymake-gradle-add-hook)))

(provide 'enzuru-java)
