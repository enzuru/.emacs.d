;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-setup-tab (name one &rest args)
  (interactive)
  (tab-bar-new-tab)
  (tab-bar-rename-tab name)

  (let ((amount (+ 1 (length args)))
        (two (nth 0 args))
        (three (nth 1 args))
        (four (nth 2 args)))

    (if (> amount 0)
        (progn
          (switch-to-buffer one)))

    (if (> amount 1)
        (progn
          (split-window-horizontally)
          (other-window 1)
          (switch-to-buffer two)))

    (if (> amount 2)
        (progn
          (split-window-vertically)
          (other-window 1)
          (switch-to-buffer three)))

    (if (> amount 3)
        (progn
          (other-window 1)
          (split-window-vertically)
          (switch-to-buffer four)))))

(defun enzuru-arrange-social-tabs ()
  (interactive)

  (enzuru-setup-tab "Hacking" "*dashboard*")
  (enzuru-setup-tab "Mail" "*notmuch-hello*")
  (enzuru-setup-tab "News" "##baseball" "#us-market-news" "#trading")
  (enzuru-setup-tab "Activism" "##feminism")
  (enzuru-setup-tab "Security" "#openbsd" "#tor" "#bitcoin" "#ircv3")
  (enzuru-setup-tab "Role-playing" "#DarkMyst" "#rpg-hub")
  (enzuru-setup-tab "Demoscene" "#demoscene" "#c-64")
  (enzuru-setup-tab "Anime" "#news" "#chat" "#truth" "#rice")
  (enzuru-setup-tab "Alternative" "#square" "#rpg-hub")
  (enzuru-setup-tab "GNU" "#gnu" "#gnu-linux-libre" "#guix" "#guile")
  (enzuru-setup-tab "Emacs" "#emacs" "#exwm" "#lispgames" "#gnustep")
  (enzuru-setup-tab "Lisp" "#lisp" "#commonlisp" "#scheme" "#clojure")
  (enzuru-setup-tab "Plan 9" "#cat-v" "##9fans")

  (tab-bar-close-tab-by-name "tmp")
  (tab-bar-select-tab-by-name "Hacking"))

(defun enzuru-arrange-social ()
  (interactive)
  (tab-bar-rename-tab "tmp")
  (notmuch)
  (znc-all)
  (run-at-time "10 sec" nil 'enzuru-arrange-social-tabs))

(provide 'enzuru-arrangements)
