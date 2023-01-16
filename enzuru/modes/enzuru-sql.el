;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package flymake-sqlfluff
  :ensure t
  :hook ((sql-mode . flymake-sqlfluff-load)))

(provide 'enzuru-sql)
