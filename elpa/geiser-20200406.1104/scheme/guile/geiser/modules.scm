;;; modules.scm -- module metadata

;; Copyright (C) 2009, 2010, 2011, 2018 Jose Antonio Ortega Ruiz

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the Modified BSD License. You should
;; have received a copy of the license along with this program. If
;; not, see <http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5>.

;; Start date: Mon Mar 02, 2009 02:00

(define-module (geiser modules)
  #:export (symbol-module
            program-module
            module-name?
            module-path
            find-module
            all-modules
            submodules
            module-location)
  #:use-module (geiser utils)
  #:use-module (system vm program)
  #:use-module (system vm debug)
  #:use-module (ice-9 regex)
  #:use-module (ice-9 session)
  #:use-module (srfi srfi-1))

;; Return hash table mapping filename to list of modules defined in that
;; file. H/t andy wingo.
(define (fill-file->module-mapping! ret)
  (define (record-module m)
    (let ((f (module-filename m)))
      (hash-set! ret f (cons m (hash-ref ret f '())))))
  (define (visit-module m)
    (record-module m)
    (hash-for-each (lambda (k v) (visit-module v))
                   (module-submodules m)))
  (visit-module (resolve-module '() #f))
  ret)

(define file->modules (fill-file->module-mapping! (make-hash-table)))

(define (program-file p)
  (let ((src (program-source p 0)))
    (and (pair? src) (cadr src))))

(define (program-module p)
  (let* ((f (program-file p))
         (mods (or (hash-ref file->modules f)
                   (hash-ref (fill-file->module-mapping! file->modules) f))))
    (and (pair? mods) (not (null? mods)) (car mods))))

(define (module-name? module-name)
  (and (list? module-name)
       (not (null? module-name))
       (every symbol? module-name)))

(define (symbol-module sym . all)
  (and sym
       (catch 'module-name
         (lambda ()
           (apropos-fold (lambda (module name var init)
                           (if (eq? name sym)
                               (throw 'module-name (module-name module))
                               init))
                         #f
                         (regexp-quote (symbol->string sym))
                         (if (or (null? all) (not (car all)))
                             (apropos-fold-accessible (current-module))
                             apropos-fold-all)))
         (lambda (key . args)
           (and (eq? key 'module-name) (car args))))))

(define (module-location name)
  (make-location (module-path name) #f))

(define (find-module mod-name)
  (and (module-name? mod-name)
       (resolve-module mod-name #f #:ensure #f)))

(define (module-path module-name)
  (and (module-name? module-name)
       (or ((@@ (ice-9 session) module-filename) module-name)
           (module-filename (resolve-module module-name #f)))))

(define (submodules mod)
  (hash-map->list (lambda (k v) v) (module-submodules mod)))

(define (root-modules)
  (submodules (resolve-module '() #f)))

(define (all-modules)
  (define (maybe-name m)
    (and (module-kind m) (format #f "~A" (module-name m))))
  (let* ((guile (resolve-module '(guile)))
         (roots (remove (lambda (m) (eq? m guile)) (root-modules)))
         (children (append-map all-child-modules roots)))
    (cons "(guile)" (filter-map maybe-name children))))

(define* (all-child-modules mod #:optional (seen '()))
  (let ((cs (filter (lambda (m) (not (member m seen))) (submodules mod))))
    (fold (lambda (m all) (append (all-child-modules m all) all))
          (list mod)
          cs)))
