(require 'eshell)
(require 'em-smart)
(require 'shell)

(when (file-name-nondirectory (getenv "SHELL")) "fish"
   (setq path-separator " ")

(setq shell-switcher-mode t))
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
(setq multi-term-scroll-show-maximum-output t)
