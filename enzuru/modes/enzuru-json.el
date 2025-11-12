;;; enzuru-json.el --- JSON configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(defun enzuru-configure-json-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.json$" . json-ts-mode)))

(enzuru-configure-json-ts-mode)

(provide 'enzuru-json)

;;; enzuru-json.el ends here
