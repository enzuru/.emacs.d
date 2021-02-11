;;; counsel-tramp.el --- Tramp ivy interface for ssh, docker, vagrant -*- lexical-binding: t; -*-

;; Copyright (C) 2017-2019 by Masashı Mıyaura

;; Author: Masashı Mıyaura
;; URL: https://github.com/masasam/emacs-counsel-tramp
;; Package-Version: 20190616.122
;; Package-Commit: 719b38ba2242cc1c6d1d79cab106c8c8b1afa775
;; Version: 0.7.5
;; Package-Requires: ((emacs "24.3") (counsel "0.10"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; counsel-tramp provides interfaces of Tramp
;; You can also use tramp with counsel interface as root
;; If you use it with docker-tramp, you can also use docker with counsel interface
;; If you use it with vagrant-tramp, you can also use vagrant with counsel interface

;;; Code:

(require 'counsel)
(require 'tramp)
(require 'cl-lib)

(defgroup counsel-tramp nil
  "Tramp with ivy interface for ssh, docker, vagrant"
  :group 'counsel)

(defcustom counsel-tramp-default-method "ssh"
  "Default method when use tramp multi hop."
  :group 'counsel-tramp
  :type 'string)

(defcustom counsel-tramp-docker-user nil
  "If you want to use login user name when `docker-tramp' used, set variable."
  :group 'counsel-tramp
  :type 'string)

(defcustom counsel-tramp-localhost-directory "/"
  "Initial directory when connecting with /sudo:root@localhost:."
  :group 'counsel-tramp
  :type 'string)

(defcustom counsel-tramp-control-master nil
  "If you want to put out a candidate for completion from ssh controlmaster, please set to t."
  :group 'counsel-tramp
  :type 'string)

(defcustom counsel-tramp-control-master-path "~/.ssh/"
  "Path where ssh controlmaster exists."
  :group 'counsel-tramp
  :type 'string)

(defcustom counsel-tramp-control-master-prefix "master-"
  "Prefix of ssh controlmaster."
  :group 'counsel-tramp
  :type 'string)

(defcustom counsel-tramp-pre-command-hook nil
  "Hook run before `counsel-tramp'.
The hook is called with one argument that is non-nil."
  :type 'hook)

(defcustom counsel-tramp-post-command-hook nil
  "Hook run after `counsel-tramp'.
The hook is called with one argument that is non-nil."
  :type 'hook)

(defcustom counsel-tramp-quit-hook nil
  "Hook run when `counsel-tramp-quit'.
The hook is called with one argument that is non-nil."
  :type 'hook)

(defcustom counsel-tramp-custom-connections '()
  "A list to manually add extra connections.
E.g.: '(\"/ssh:domain|sudo:user@localhost:/\")."
  :type 'string)

(defun counsel-tramp-quit ()
  "Quit counsel-tramp.
Kill all remote buffers."
  (interactive)
  (run-hooks 'counsel-tramp-quit-hook)
  (tramp-cleanup-all-buffers))

(defun counsel-tramp--candidates (&optional file)
  "Collect candidates for counsel-tramp from FILE."
  (let ((source (split-string
                 (with-temp-buffer
                   (insert-file-contents (or file "~/.ssh/config"))
                   (buffer-string))
                 "\n"))
        (hosts (if file '() counsel-tramp-custom-connections)))
    (dolist (host source)
      (when (string-match "[H\\|h]ost +\\(.+?\\)$" host)
	(setq host (match-string 1 host))
	(if (string-match "[ \t\n\r]+\\'" host)
	    (replace-match "" t t host))
	(if (string-match "\\`[ \t\n\r]+" host)
	    (replace-match "" t t host))
        (unless (string= host "*")
	  (if (string-match "[ ]+" host)
	      (let ((result (split-string host " ")))
		(while result
		  (push
		   (concat "/" tramp-default-method ":" (car result) ":")
		   hosts)
		  (push
		   (concat "/" counsel-tramp-default-method ":" (car result) "|sudo:root@" (car result) ":/")
		   hosts)
		  (pop result)))
	    (push
	     (concat "/" tramp-default-method ":" host ":")
	     hosts)
	    (push
	     (concat "/" counsel-tramp-default-method ":" host "|sudo:root@" host ":/")
	     hosts))))
      (when (string-match "Include +\\(.+\\)$" host)
        (setq include-file (match-string 1 host))
        (when (not (file-name-absolute-p include-file))
          (setq include-file (concat (file-name-as-directory "~/.ssh") include-file)))
        (when (file-exists-p include-file)
          (setq hosts (append hosts (counsel-tramp--candidates include-file))))))
    (when counsel-tramp-control-master
      (let ((files (counsel-tramp--directory-files
		    (expand-file-name
		     counsel-tramp-control-master-path)
		    counsel-tramp-control-master-prefix))
	    (hostuser nil)
	    (hostname nil)
	    (port nil))
	(dolist (controlmaster files)
	  (let ((file (file-name-nondirectory controlmaster)))
	    (when (string-match
		   (concat counsel-tramp-control-master-prefix "\\(.+?\\)@\\(.+?\\):\\(.+?\\)$")
		   file)
	      (setq hostuser (match-string 1 file))
	      (setq hostname (match-string 2 file))
	      (setq port (match-string 3 file))
	      (push
	       (concat "/" tramp-default-method ":" hostuser "@" hostname "#" port ":")
	       hosts)
	      (push
	       (concat "/" counsel-tramp-default-method ":" hostuser "@" hostname "#" port "|sudo:root@" hostname ":/")
	       hosts))))))
    (when (require 'docker-tramp nil t)
      (cl-loop for line in (cdr (ignore-errors (apply #'process-lines "docker" (list "ps"))))
	       for info = (reverse (split-string line "[[:space:]]+" t))
	       collect (progn (push
			       (concat "/docker:" (car info) ":/")
			       hosts)
			      (when counsel-tramp-docker-user
				(if (listp counsel-tramp-docker-user)
				    (let ((docker-user counsel-tramp-docker-user))
				      (while docker-user
					(push
					 (concat "/docker:" (car docker-user) "@" (car info) ":/")
					 hosts)
					(pop docker-user)))
				  (push
				   (concat "/docker:" counsel-tramp-docker-user "@" (car info) ":/")
				   hosts))))))
    (when (require 'vagrant-tramp nil t)
      (cl-loop for box-name in (cl-map 'list 'cadr (vagrant-tramp--completions))
	       do (progn
		    (push (concat "/vagrant:" box-name ":/") hosts)
		    (push (concat "/vagrant:" box-name "|sudo:" box-name ":/") hosts))))
    (push (concat "/sudo:root@localhost:" counsel-tramp-localhost-directory) hosts)
    (reverse hosts)))

(defun counsel-tramp--directory-files (dir regexp)
  "Return list of all files under DIR that have file names matching REGEXP."
  (let ((result nil)
	(files nil)
	(tramp-mode (and tramp-mode (file-remote-p (expand-file-name dir)))))
    (dolist (file (sort (file-name-all-completions "" dir)
			'string<))
      (unless (member file '("./" "../"))
	(if (not (counsel-tramp--directory-name-p file))
	    (when (string-match regexp file)
	      (push (expand-file-name file dir) files)))))
    (nconc result (nreverse files))))

(defsubst counsel-tramp--directory-name-p (name)
  "Return non-nil if NAME ends with a directory separator character."
  (let ((len (length name))
        (lastc ?.))
    (if (> len 0)
        (setq lastc (aref name (1- len))))
    (or (= lastc ?/)
        (and (memq system-type '(windows-nt ms-dos))
             (= lastc ?\\)))))

;;;###autoload
(defun counsel-tramp ()
  "Open your ~/.ssh/config with counsel interface.
You can connect your server with tramp"
  (interactive)
  (unless (file-exists-p "~/.ssh/config")
    (error "There is no ~/.ssh/config"))
  (when (require 'docker-tramp nil t)
    (unless (executable-find "docker")
      (error "'docker' is not installed")))
  (when (require 'vagrant-tramp nil t)
    (unless (executable-find "vagrant")
      (error "'vagrant' is not installed")))
  (run-hooks 'counsel-tramp-pre-command-hook)
  (counsel-find-file (ivy-read "Tramp: " (counsel-tramp--candidates)))
  (run-hooks 'counsel-tramp-post-command-hook))

(provide 'counsel-tramp)

;;; counsel-tramp.el ends here
