;;; enzuru-saving.el --- File saving preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(setq make-backup-files nil)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)

(provide 'enzuru-saving)

;;; enzuru-saving.el ends here
