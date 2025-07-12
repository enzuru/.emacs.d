;;; enzuru-wiki.el --- Wiki editing configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: convenience, wiki, mediawiki

;;; Commentary:

;; This module configures wiki editing tools including MediaWiki support.

;;; Code:

;; Packages

(use-package mediawiki
  :ensure t
  :defer t)

(provide 'enzuru-wiki)

;;; enzuru-wiki.el ends here
