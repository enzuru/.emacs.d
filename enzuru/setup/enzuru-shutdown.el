;; -*- coding: utf-8; lexical-binding: t -*-

(add-hook 'term-exec-hook
          (lambda () (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)))

(provide 'enzuru-shutdown)
