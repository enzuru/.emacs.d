;;; zoutline.el --- Simple outline library. -*- lexical-binding: t -*-

;; Copyright (C) 2016 Oleh Krehel

;; Author: Oleh Krehel <ohwoeowho@gmail.com>
;; URL: https://github.com/abo-abo/zoutline
;; Package-Version: 20190520.1819
;; Version: 0.2.0
;; Keywords: outline

;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

(require 'outline)

(defun zo-up (arg)
  "Move ARG times up by outline."
  (interactive "p")
  (let ((i 0)
        out)
    (ignore-errors
      (while (<= (cl-incf i) arg)
        (outline-backward-same-level 1)
        t
        (setq out t)))
    out))

(defun zo-down (arg)
  "Move ARG times down by outline.
Return the amount of times moved.
Return nil if moved 0 times."
  (interactive "p")
  (unless (bolp)
    (outline-back-to-heading))
  (let ((pt 0)
        (i 0)
        (outline-ok t))
    (while (and outline-ok
                (<= (cl-incf i) arg)
                (> (point) pt))
      (setq pt (point))
      (condition-case nil
          (outline-forward-same-level 1)
        (error (setq outline-ok nil))))
    (cl-decf i)
    (unless (= 0 i)
      i)))

(defvar zo-lvl-re [nil
                   "\n\\* "
                   "\n\\*\\{2\\} "
                   "\n\\*\\{3\\} "
                   "\n\\*\\{4\\} "
                   "\n\\*\\{5\\} "
                   "\n\\*\\{6\\} "
                   "\n\\*\\{7\\} "])

(declare-function reveal-post-command "reveal")

(defun zo-down-visible (&optional arg)
  "Move ARG times down by outline."
  (interactive "p")
  (setq arg (or arg 1))
  (let ((lvl (funcall outline-level))
        res)
    (if (= lvl 1)
        (setq res (re-search-forward (aref zo-lvl-re lvl) nil t arg))
      (let ((end (save-excursion
                   (or (re-search-forward (aref zo-lvl-re (1- lvl)) nil t)
                       (point-max)))))
        (when (setq res (re-search-forward (aref zo-lvl-re lvl) end t arg))
          (reveal-post-command))))
    (when res
      (beginning-of-line)
      (point))))

(defun zo-left (arg)
  (outline-up-heading arg))

(defun zo-right-once ()
  (let ((pt (point))
        (lvl-1 (funcall outline-level))
        lvl-2)
    (if (and (outline-next-heading)
             (setq lvl-2 (funcall outline-level))
             (> lvl-2 lvl-1))
        1
      (goto-char pt)
      nil)))

(defun zo-right (arg)
  "Try to move right ARG times.
Return the actual amount of times moved.
Return nil if moved 0 times."
  (let ((i 0))
    (while (and (< i arg)
                (zo-right-once))
      (cl-incf i))
    (unless (= i 0)
      i)))

(defun zo-add-outline-title ()
  (save-excursion
    (outline-previous-visible-heading 1)
    (if (looking-at (concat outline-regexp " ?:$"))
        (match-string-no-properties 0)
      (let ((outline-comment
             (progn
               (string-match "\\(.*\\)\\(?:[\\](\\)\\|\\([\\]\\*\\+\\)" outline-regexp)
               (match-string-no-properties 1 outline-regexp))))
        (concat outline-comment (make-string (1+ (funcall outline-level)) ?*) " :")))))

(defun zo-insert-outline-below ()
  (interactive)
  "Add an unnamed notebook outline at point."
  (cond
    ((and (bolp) (eolp)))
    ((outline-next-visible-heading 1)
     (insert "\n\n")
     (backward-char 2))
    (t
     (goto-char (point-max))
     (unless (bolp)
       (insert "\n"))))
  (let ((start (point))
        (title (zo-add-outline-title)))
    (skip-chars-backward "\n")
    (delete-region (point) start)
    (insert "\n\n" title "\n")
    (let ((inhibit-message t))
      (save-buffer))))

(defun zo-end-of-subtree ()
  "Goto to the end of a subtree."
  (outline-back-to-heading t)
  (let ((first t)
        (level (funcall outline-level)))
    (while (and (not (eobp))
                (or first (> (funcall outline-level) level)))
      (setq first nil)
      (outline-next-heading)))
  (point))

(defun zo-bnd-subtree ()
  "Return a cons of heading end and subtree end."
  (save-excursion
    (condition-case nil
        (progn
          (outline-back-to-heading)
          (cons
           (save-excursion
             (outline-end-of-heading)
             (point))
           (save-excursion
             (zo-end-of-subtree)
             (when (bolp)
               (backward-char))
             (point))))
      (error
       (cons (point-min) (point-max))))))

(provide 'zoutline)

;;; zoutline.el ends here
