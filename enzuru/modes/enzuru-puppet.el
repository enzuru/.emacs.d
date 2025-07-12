;;; enzuru-puppet.el --- Puppet configuration -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025

;; Author: enzuru
;; Version: 1.0
;; Package-Requires: ((emacs "30"))
;; Keywords: languages, puppet

;;; Commentary:

;; Configuration for Puppet.

;;; Code:

;; Packages

(use-package puppet-mode
  :ensure t
  :mode (("\\.pp$" . puppet-mode)))

(provide 'enzuru-puppet)

;;; enzuru-puppet.el ends here
