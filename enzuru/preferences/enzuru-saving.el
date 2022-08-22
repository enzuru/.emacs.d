;; -*- coding: utf-8; lexical-binding: t -*-

(setq make-backup-files nil)
(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'enzuru-saving)
