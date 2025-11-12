;;; enzuru-scrolling.el --- Scrolling preferences configuration -*- coding: utf-8; lexical-binding: t -*-

;;; Code:

(setq scroll-step 1
      compilation-scroll-output t
      mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't)

(pixel-scroll-precision-mode)

(provide 'enzuru-scrolling)

;;; enzuru-scrolling.el ends here
