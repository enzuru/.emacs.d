(add-hook 'objc-mode-hook #'lsp)

(defun buffer-contains-substring (string)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (search-forward string nil t))))

(defun cocoa-open-documentation ()
  (interactive)
  (let ((foundation-url (concat "https://developer.apple.com/documentation/foundation/" (downcase (thing-at-point 'word))))
        (appkit-url (concat "https://developer.apple.com/documentation/appkit/" (downcase (thing-at-point 'word)))))
    (let ((previous-buffer (current-buffer))
          (web-result (url-retrieve-synchronously foundation-url)))
      (switch-to-buffer web-result)
      (if (buffer-contains-substring "404 Not Found")
          (browse-url appkit-url)
        (browse-url foundation-url))
      (switch-to-buffer previous-buffer))))

(add-hook 'objc-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-d") 'cocoa-open-documentation)
            (local-set-key (kbd "C-x C-r") 'lsp-ui-peek-find-references)
            (local-set-key (kbd "C-x C-w") 'lsp-ui-peek-find-definitions)))
