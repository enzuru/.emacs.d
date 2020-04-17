;;; mime-shr.el --- mime-view content filter using shr for html

;; Copyright (C) 2012 Kazuhiro Ito

;; Author: Kazuhiro Ito <kzhr@d1.dion.ne.jp>
;; Keywords: HTML, MIME, multimedia, mail, news

;; This file is part of SEMI (Suite of Emacs MIME Interfaces).

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(eval-and-compile
  (require 'shr nil t))

(require 'mime)

(defcustom mime-shr-blocked-images "."
  "Images of which URLs match this regexp are blocked.  Nil means the value of shr-blocked-images is used."
  :group 'mime-view
  :type '(choice regexp (const nil)))

(defvar mime-shr-root-entity nil)
(make-variable-buffer-local 'mime-shr-root-entity)

(defun mime-shr-preview-text/html (entity situation)
  (let ((dom (with-temp-buffer
	       (mime-insert-text-content entity)
	       (libxml-parse-html-region (point-min) (point-max))))
	(shr-content-function 'mime-shr-cid-retrieve)
	(shr-blocked-images (or mime-shr-blocked-images
				shr-blocked-images)))
    (setq mime-shr-root-entity (mime-find-root-entity entity))
    (save-restriction
      ;; shr-insert-document may insert document before current point.
      ;; Cf. https://github.com/wanderlust/semi/issues/11
      (narrow-to-region (point-max) (point-max))
      (shr-insert-document dom)))
  ;; Workaround to delete garbage overlay.
  (let ((overlays (overlays-in (point-min) (point-max))))
    (while overlays
      (when (eq (overlay-start (car overlays))
		(overlay-end (car overlays)))
	(delete-overlay (car overlays)))
      (setq overlays (cdr overlays)))))


(defun mime-shr-cid-retrieve (url)
  (let ((entity (mime-find-entity-from-content-id
		 (mime-uri-parse-cid (concat "cid:" url))
		 mime-shr-root-entity)))
    (when entity
      (mime-entity-content entity))))

;;; @ end
;;;

(provide 'mime-shr)

;;; mime-shr.el ends here
