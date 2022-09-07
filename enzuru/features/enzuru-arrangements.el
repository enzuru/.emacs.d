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

(defun enzuru-arrange-tabs ()
  (interactive)

  (enzuru-setup-tab "hacking" "*dashboard*")
  (enzuru-setup-tab "music" "*EMMS Playlist*")
  (enzuru-setup-tab "mail" "*notmuch-hello*")
  (enzuru-setup-tab "news" "##baseball" "#us-market-news" "#trading")
  (enzuru-setup-tab "chat" "#darkscience" "*irc-darkscience*")
  (enzuru-setup-tab "feminism" "##feminism")
  (enzuru-setup-tab "security" "#openbsd" "#tor" "#bitcoin" "#ircv3")
  (enzuru-setup-tab "role-playing" "#DarkMyst" "#rpg-hub" "#imarel" "#imarel_ooc")
  (enzuru-setup-tab "demoscene" "#demoscene" "#c-64")
  (enzuru-setup-tab "gnu" "#gnu" "#gnu-linux-libre" "#guix" "#guile")
  (enzuru-setup-tab "emacs" "#emacs" "#exwm" "#lispgames" "#gnustep")
  (enzuru-setup-tab "lisp" "#lisp" "#commonlisp" "#scheme" "#clojure")
  (enzuru-setup-tab "9fans" "#cat-v" "##9fans")
  (enzuru-setup-tab "gaming" "*Input for guest@SquareSoft*" "*guest@SquareSoft*")
  (enzuru-setup-tab "gemini" "*elpher*")

  (tab-bar-close-tab-by-name "tmp")
  (tab-bar-select-tab-by-name "hacking"))

(defun enzuru-run-apps ()
  (interactive)
  ;; Music
  ;; (emms-play-directory "/sftp:enzuru@enzu.ru:/home/enzuru/music/Nala Sinephro - Space 1.8")
  ;; IRC
  (znc-all)
  ;; Email
  (notmuch)
  ;; Gemini
  (elpher)
  ;;  MUD
  (mu-open
   ["SquareSoft" "uossmud.sandwich.net" 9000 "guest" "guest"]))

(defun enzuru-arrange-social ()
  (interactive)
  (tab-bar-rename-tab "tmp")
  (enzuru-run-apps)
  (run-at-time "10 sec" nil 'enzuru-arrange-tabs))

(provide 'enzuru-arrangements)
