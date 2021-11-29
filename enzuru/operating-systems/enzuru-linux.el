;; -*- coding: utf-8; lexical-binding: t -*-

(if window-system
    (require 'enzuru-window-management))

(require 'enzuru-guix)

(setq locate-command "locate -d /home/enzuru/locatedb.n")
(setq ccls-executable "ccls")
(setq browse-url-browser-function 'browse-url-firefox)
(setq inferior-lisp-program "sbcl")
(setq multi-term-program "fish")

(defun enzuru-async-term ()
  "Open terminal"
  (interactive)
  (start-process "urxvtc" "urxvtc" "urxvtc" "-fn" "xft:Iosevka:style=Regular:size=15"))

(global-set-key (kbd "C-c x") 'enzuru-async-term)

(with-eval-after-load 'geiser-guile
  (add-to-list 'geiser-guile-load-path "~/src/guix"))

(find-file "~/notes/index.org")
(split-window-right)
(switch-to-buffer "index.org")

(provide 'enzuru-linux)
