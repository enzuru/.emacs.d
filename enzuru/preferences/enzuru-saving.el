;;; enzuru-saving.el --- File saving preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(setq make-backup-files nil)
(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'enzuru-saving)

;;; enzuru-saving.el ends here
