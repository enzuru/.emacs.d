(defpackage #:slynk-quicklisp
  (:use :cl #:slynk-api)
  (:export
   #:quickload
   #:available-system-names))
(in-package #:slynk-quicklisp)

(defslyfun quickload (system-name)
  "Basically the same as QL:QUICKLOAD"
  (ql:quickload system-name)
  (mapcar #'ql-dist:version (ql-dist:enabled-dists)))

(defslyfun available-system-names ()
  (cl:mapcar 'ql-dist:name (ql:system-list)))

(provide 'slynk-quicklisp)
