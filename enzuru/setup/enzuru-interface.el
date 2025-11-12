;;; enzuru-interface.el --- Interface configuration for GUI and terminal modes -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(if window-system
    (require 'enzuru-gui)
  (progn (require 'enzuru-zenburn)
         (xterm-mouse-mode t)))

(provide 'enzuru-interface)

;;; enzuru-interface.el ends here
