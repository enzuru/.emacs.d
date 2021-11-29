;; -*- coding: utf-8; lexical-binding: t -*-

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(package-refresh-contents)

(package-install 'use-package)

(provide 'enzuru-packages)
