;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-buffer-contains-substring (string)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (search-forward string nil t))))

(defun enzuru-cocoa-open-documentation ()
  (interactive)
  (let ((foundation-url (concat "https://developer.apple.com/documentation/foundation/" (downcase (thing-at-point 'word))))
        (appkit-url (concat "https://developer.apple.com/documentation/appkit/" (downcase (thing-at-point 'word)))))
    (let ((previous-buffer (current-buffer))
          (web-result (url-retrieve-synchronously foundation-url)))
      (switch-to-buffer web-result)
      (if (enzuru-buffer-contains-substring "404 Not Found")
          (browse-url appkit-url)
        (browse-url foundation-url))
      (switch-to-buffer previous-buffer))))

;; (add-hook 'objc-mode-hook (lambda () ("C-x C-d" . 'enzuru-cocoa-open-documentation)))

;; Packages

(use-package flycheck-objc-clang
  :defer t
  :ensure t
  :hook ((objc-mode . eglot-ensure)))

(provide 'enzuru-objective-c)
