;;; enzuru-epub.el --- EPUB ebook reading support -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: multimedia, epub, ebooks, reading

;;; Commentary:

;; This module configures EPUB ebook reading support using Nov.el
;; for reading EPUB files within Emacs.

;;; Code:

;; Packages

(use-package nov
  :ensure t
  :defer t
  :mode (("\\.epub\\'" . nov-mode)))

(provide 'enzuru-epub)

;;; enzuru-epub.el ends here
