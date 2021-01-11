;;; pianobar.el --- thin wrapper for Pianobar, a Pandora Radio client
;; Package-Version: 20201002.1756
;; Package-Commit: d708417608df4f09ee565fddaad03dfe181829a8

;; Copyright (c) 2011, Aaron Griffith
;; This file is licensed under the GNU GPL -- see below.

;; Author: Aaron Griffith <aargri@gmail.com>
;; Homepage: http://github.com/agrif/pianobar.el

;;; Commentary:

;; Pianobar is a command-line client for Pandora <http://pandora.com>,
;; written by Lars-Dominik Braun (and others), which can be found at
;; <http://6xq.net/html/00/17.html>.
;;
;; There is a README that should have come with this file that
;; contains more detailed information than what's here. If you can't
;; find it, you can find it on GitHub at <http://github.com/agrif/pianobar.el>.
;;
;; Suggestions, improvements, and bug reports are welcome. This is a
;; *very* early version, so expect there to be many!

;;; Installation:

;; Installation instructions:
;;
;; 1. Put this file in your emacs load path OR add the following to
;;    your .emacs file (modifying the path appropriately):
;;
;;    (add-to-list 'load-path "/home/agrif/emacsinclude")
;;
;; 2. Add the following to your .emacs file to load this file
;;    automatically when M-x pianobar is run:
;;
;;    (autoload 'pianobar "pianobar" nil t)
;;
;; 3. (Optional) Customize pianobar! See the README for information on
;;     what variables are available to set.
;;

;;; License:

;; This file is released under the GNU GPL.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:
;;;; Variables

(require 'comint)
(require 'subr-x)

(defvar pianobar-buffer
  "*pianobar*"
  "The buffer name that pianobar will run in.")

(defvar pianobar-command
  "pianobar"
  "The command to run pianobar.")

(defvar pianobar-config nil
  "If not nil, pianobar will load the Pandora username and password from config without prompting.")

(defvar pianobar-username nil
  "The Pandora username to use, or nil to prompt.")

(defvar pianobar-password nil
  "The Pandora password to use, or nil to prompt.")

(defvar pianobar-station nil
  "The pianobar radio station to automatically select,
or nil to let you select.")

(defvar pianobar-run-in-background nil
  "If not nil, don't bring up the pianobar window after launch.")

(defvar pianobar-mode-hook nil
  "A list for storing pianobar-mode hooks.")

(defface pianobar-mode-prompt-face
  '((t :foreground "blue"))
  "Face to use to highlight prompts.")

(defface pianobar-mode-input-face
  '((t :weight bold))
  "Face to use to highlight user input.")

(defface pianobar-mode-info-face
  '((t :foreground "green"))
  "Face to use to highlight informative messages.")

(defface pianobar-mode-time-face
  '((t :inherit pianobar-mode-info-face :weight bold))
  "Face to use to highlight current song time. (due to bugs, this will only highlight non-current times.)")

(defvar pianobar-mode-font-lock-defaults
  '(("\\[\\?\\] \\(.*: \\)\\(.*\\)" (1 'pianobar-mode-prompt-face t) (2 'pianobar-mode-input-face t))
    ("|> \\(.*\\)" 1 'pianobar-mode-info-face t)
    ("# +\\(-[0-9]+:[0-9]+/[0-9]+:[0-9]+\\)\\(.*\\)" (1 'pianobar-mode-time-face t) (2 'pianobar-mode-input-face t)))
  "The default syntax-highlighting rules for pianobar-mode.")

(defvar pianobar-prompt-regex
  "\\[\\?\\] .*: $"
  "A regex for matching a pianobar prompt.")

(defvar pianobar-current-station nil
  "The current pianobar station, or nil.")

(defvar pianobar-current-song nil
  "The current pianobar song title, or nil.")

(defvar pianobar-current-album nil
  "The current pianobar album title, or nil.")

(defvar pianobar-current-artist nil
  "The current pianobar artist, or nil.")

(defvar pianobar-info-extract-rules
  '(("|> +Station \"\\(.+\\)\" +([0-9]*)$" (1 . pianobar-current-station))
    ("|> +\"\\(.*\\)\" by \"\\(.*\\)\" on \"\\(.*\\)\""
     (1 . pianobar-current-song) (2 . pianobar-current-artist) (3 . pianobar-current-album)))
  "A list of cells of the form (regex . matchrules), where
matchrules is a list of cells of the form (group#
. symbol). After matching the regexp on new input from pianobar,
the groups matched will be stored in the associated symbol.")

(defvar pianobar-mode-map
  (let ((map (nconc (make-keymap) comint-mode-map)))
    (substitute-key-definition 'self-insert-command 'pianobar-self-insert-command map global-map)
    (define-key map (kbd "C-c C-c") #'pianobar-sigint)
    map))

(defvar pianobar-is-prompting nil
  "Whether pianobar is currently prompting, or not.
Set this with (pianobar-set-is-prompting ...).")

(defvar pianobar-modeline-object
  '(t pianobar-status)
  "Global mode-line object for pianobar.")

(defvar pianobar-status nil
  "String (or mode-line construct) used in global pianobar mode line.")

(defvar pianobar-enable-modeline t
  "Set to nil to hide updates in the modeline.")

(defalias 'pianobar-global-modeline 'pianobar-enable-modeline
  "`pianobar-global-modeline' never worked properly, so it was removed
in favor of pianobar-enable-modeline.")

(make-obsolete 'pianobar-global-modeline 'pianobar-enable-modeline "2017-11-17")

;;;; Helper Functions

(defun pianobar-set-is-prompting (prompting)
  "Set whether pianobar is currently prompting for a string, or not."
  (with-current-buffer pianobar-buffer
    (set (make-local-variable 'pianobar-is-prompting) prompting)
    (setq buffer-read-only (not prompting))))

(defun pianobar-update-modeline ()
  "Update the pianobar modeline with current information."
  (if (and pianobar-enable-modeline
           (comint-check-proc pianobar-buffer))
      (setq pianobar-status `("  " ,(pianobar-make-modeline) "  "))
    (setq pianobar-status nil))
  (force-mode-line-update))

(defun pianobar-make-modeline ()
  "Return the new modeline for pianobar-status. Override for custom modeline."
  (if (and pianobar-current-song pianobar-current-artist)
      '("" pianobar-current-song " / " pianobar-current-artist)
    nil))

(defun pianobar-preoutput-filter (str)
  "Preoutput filter for pianobar-mode. Cleans up unhandled ANSI escapes."
  ;; clean the string up first -- remove unhandled escape codes
  ;; sort of a hack fix for change introduced into pianobar at commit
  ;; eadc96008ca6fa0a335ab35daaff0cfd24546cf9 on December 27, 2010
  (replace-regexp-in-string "\033\\[2K" "" str))

(defun pianobar-output-filter (str)
  "Output filter for pianobar-mode."
  (pianobar-set-is-prompting (string-match pianobar-prompt-regex str))

  (dolist (rule pianobar-info-extract-rules)
    (if (string-match (car rule) str)
        (dolist (symbol-map (cdr rule))
          (set (cdr symbol-map) (match-string (car symbol-map) str)))))

  (pianobar-update-modeline))

(defun pianobar-send-command (char &optional set-active)
  "Send a command character to pianobar, if it's running.
Returns t on success, nil on error."
  (if (not (comint-check-proc pianobar-buffer))
      (progn (message "Pianobar is not running.") nil)
    (if pianobar-is-prompting
        (progn (message "Pianobar is expecting input -- command not sent.") nil)
      (comint-send-string pianobar-buffer (char-to-string char))
      (if set-active
          (set-window-buffer (selected-window) pianobar-buffer))
      t)))

(defun pianobar-self-insert-command (N)
  "Custom key-press handler for pianobar mode."
  (interactive "p")
  (if pianobar-is-prompting
      (self-insert-command N)
    (pianobar-send-command last-input-event)))

;;;; Interactive Functions

(defun pianobar-love-current-song ()
  "Tell pianobar you love the current song."
  (interactive)
  (if (and pianobar-current-song (pianobar-send-command ?+))
      (message (concat "Pianobar: Love'd " pianobar-current-song))))

(defun pianobar-ban-current-song ()
  "Tell pianobar to ban the current song."
  (interactive)
  (if (and pianobar-current-song
           (pianobar-send-command ?-))
      (message (concat "Pianobar: Banned " pianobar-current-song))))

(defun pianobar-shelve-current-song ()
  "Tell pianobar to shelve  the current song for a month (tired)."
  (interactive)
  (if (and pianobar-current-song (pianobar-send-command ?t))
	  (message (concat "Pianobar: Shelved " pianobar-current-song))))

(defun pianobar-volume-up ()
  "Tell pianobar increase the volume."
  (interactive)
  ;; volume up is )
  (pianobar-send-command ?\) ))

(defun pianobar-volume-down ()
  "Tell pianobar to lower the volume."
  (interactive)
  ;; volume up is )
  (pianobar-send-command ?\( ))

(defun pianobar-next-song ()
  "Tell pianobar to skip to the next song."
  (interactive)
  (pianobar-send-command ?n))

(defun pianobar-play-or-pause ()
  "Toggle pianobar's paused state."
  (interactive)
  (pianobar-send-command ?p))

(defun pianobar-change-station ()
  "Bring up pianobar's station select menu."
  (interactive)
  (pianobar-send-command ?s t))

(defun pianobar-sigint ()
  "Send SIGINT to pianobar process."
  (interactive)
  (when (comint-check-proc pianobar-buffer)
    (interrupt-process pianobar-buffer)))

(define-derived-mode pianobar-mode comint-mode "pianobar"
  "Major mode for interacting with pianobar.
\\{pianobar-mode-map}"

  (set (make-local-variable 'font-lock-defaults)
       '(pianobar-mode-font-lock-defaults t))

  (set (make-local-variable 'comint-process-echoes) t)
  (pianobar-set-is-prompting nil)

  (add-hook 'comint-output-filter-functions 'pianobar-output-filter nil t)
  (add-hook 'comint-preoutput-filter-functions 'pianobar-preoutput-filter nil t))

;;;; Main Definition

;;;###autoload
(defun pianobar ()
  (interactive)
  ;; if we're already running, calling pianobar again will
  ;; just make the pianobar buffer the visible one
  (if (comint-check-proc pianobar-buffer)
      (set-window-buffer (selected-window) pianobar-buffer)

    (let ((buffer (get-buffer-create pianobar-buffer)))
      (with-current-buffer buffer
        (make-comint-in-buffer "pianobar" buffer pianobar-command)
        (unless pianobar-config
          (comint-send-string buffer (concat (or pianobar-username (read-from-minibuffer "Pandora username: ")) "\n"))
          (comint-send-string buffer (concat (or pianobar-password (read-passwd "Pandora password: ")) "\n")))
        (if (stringp pianobar-station)
            (comint-send-string buffer (concat pianobar-station "\n")))
        (buffer-disable-undo)
        (pianobar-mode))

      (cond ((boundp 'mode-line-modes)
             (add-to-list 'mode-line-modes pianobar-modeline-object t))
            ((boundp 'global-mode-string)
             (add-to-list 'global-mode-string pianobar-modeline-object t)))

      (if (not pianobar-run-in-background)
          (set-window-buffer (selected-window) buffer)))))

(defun pianobar-quit ()
  "Quit the currently running pianobar buffer, and clean up state."
  (interactive)
  (when (get-buffer pianobar-buffer)
    (when-let ((process (get-buffer-process pianobar-buffer)))
      (set-process-query-on-exit-flag process nil))
    (kill-buffer pianobar-buffer))
  (pianobar-update-modeline))

(provide 'pianobar)

;;; pianobar.el ends here
