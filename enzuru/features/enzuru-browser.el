;;; enzuru-browser.el --- Web browsing configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

;; Configuration

(defun enzuru-search ()
  (interactive)
  (eww-browse-url (concat "https://search.marginalia.nu/search?profile=yolo&js=no-js&query=" (read-string "Search: "))))

(setq browse-url-browser-function 'eww-browse-url)
(global-set-key (kbd "") 'enzuru-search)

(provide 'enzuru-browser)

;;; enzuru-browser.el ends here
