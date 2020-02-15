;; -*- geiser-scheme-implementation: 'chicken

;; Copyright (C) 2018 Daniel J Leslie

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the Modified BSD License. You should
;; have received a copy of the license along with this program. If
;; not, see <http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5>.

(module geiser
  (geiser-eval
   geiser-no-values
   geiser-newline
   geiser-start-server
   geiser-completions
   geiser-autodoc
   geiser-object-signature
   geiser-symbol-location
   geiser-symbol-documentation
   geiser-find-file
   geiser-add-to-load-path
   geiser-load-file
   geiser-compile-file
   geiser-compile
   geiser-module-exports
   geiser-module-path
   geiser-module-location
   geiser-module-completions
   geiser-macroexpand
   geiser-chicken-use-debug-log
   geiser-chicken-load-paths)

  (import
    scheme
    apropos
    srfi-1
    srfi-18
    (chicken base)
    (chicken tcp)
    (chicken file)
    (chicken file posix)
    (chicken format)
    (chicken condition)
    (chicken port)
    (chicken string)
    (chicken repl)
    (chicken syntax))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Utilities
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define geiser-chicken-use-debug-log (make-parameter #f))

  (define empty-symbol (string->symbol ""))

  (define (symbol-information-list partial-string)
    (map (lambda (lst)
	   (let* ((module (if (eq? empty-symbol (caar lst)) #f (caar lst)))
		  (name (cdar lst)))
	     (append (list name module) (cdr lst))))
	 (apropos-information-list partial-string #:macros? #t)))
  
  (define debug-log (make-parameter #f))
  (define (write-to-log form)
    (when (geiser-chicken-use-debug-log)
      (when (not (debug-log))
	(debug-log (file-open "geiser.log" (+ open/wronly open/append open/text open/creat)))
	(set-file-position! (debug-log) 0 seek/end))
      (file-write (debug-log) (with-all-output-to-string (lambda () (write form) (newline))))
      (file-write (debug-log) "\n")))

  (define (string-has-prefix? s prefix)
    (cond
     ((= 0 (string-length prefix)) #t)
     ((= 0 (string-length s)) #f)
     ((eq? (string-ref s 0) (string-ref prefix 0))
      (string-has-prefix? (substring s 1) (substring prefix 1)))
     (else #f)))
  
  ;; This really should be a chicken library function
  (define (write-exception exn)
    (define (write-call-entry call)
      (let ((type (vector-ref call 0))
            (line (vector-ref call 1)))
        (cond
         ((equal? type "<syntax>")
          (display (string-append type " ")) (write line) (newline))
         ((equal? type "<eval>")
          (display (string-append type "   ")) (write line) (newline)))))

    (display (format "Error: (~s) ~s: ~s"
                     ((condition-property-accessor 'exn 'location) exn)
                     ((condition-property-accessor 'exn 'message) exn)
                     ((condition-property-accessor 'exn 'arguments) exn)))
    (newline)
    (display "Call history: ") (newline)
    (map write-call-entry ((condition-property-accessor 'exn 'call-chain) exn))
    (newline))

  ;; And this should be a chicken library function as well
  (define (with-all-output-to-string thunk)
    (with-output-to-string
      (lambda ()
        (with-error-output-to-port
         (current-output-port)
         thunk))))

  (define (maybe-call func val)
    (if val (func val) #f))

  ;; Wraps output from geiser functions
  (define (call-with-result thunk)
    (let* ((result (if #f #f))
           (output (if #f #f)))

      (set! output
            (handle-exceptions exn
             (with-all-output-to-string
              (lambda () (write-exception exn)))
             (with-all-output-to-string
              (lambda ()
                (call-with-values thunk (lambda v (set! result v)))))))

      (set! result
        (cond
         ((list? result)
          (map (lambda (v) (with-output-to-string (lambda () (write v)))) result))
         ((eq? result (if #f #t))
          (list output))
         (else
          (list (with-output-to-string (lambda () (write result)))))))

      (let ((out-form
             `((result ,@result)
               (output . ,output))))
        (write out-form)
	(write-to-log '[[RESPONSE]])
        (write-to-log out-form))

      (newline)))
  
  (define (eval* str)
    (cond
     ((string? str)
      (handle-exceptions exn
	  (with-all-output-to-string (write-exception exn))
	(eval
	 (with-input-from-string str
	   (lambda () (read))))))
     ((symbol? str)
      (handle-exceptions exn
	  (with-all-output-to-string (write-exception exn))
	(eval str)))
     (else (eval* (->string str)))))
  
  (define (fmt node)
    (let* ((mod (cadr node))
	   (sym (car node))
	   (rest (cddr node))
	   (type (if (or (list? rest) (pair? rest)) (car rest) rest)))
      (cond
       ((equal? 'macro type)
	`(,sym ("args" (("required" <macro>)
			("optional" ...)
			("key")))
	       ,(if (and mod)
		    (cons "module" mod)
		    (list "module"))))
       ((or (equal? 'variable type)
	    (equal? 'constant type))
	`(,sym ("value" . ,(eval* sym))))
       (else
	(let ((reqs '())
	      (opts '())
	      (keys '())
	      (args (if (or (list? rest) (pair? rest)) (cdr rest) '())))

	  (define (collect-args args #!key (reqs? #t) (opts? #f) (keys? #f))
	    (when (not (null? args))
	      (cond
	       ((or (pair? args) (list? args))
		(cond
		 ((eq? '#!key (car args))
		  (collect-args (cdr args) reqs?: #f opts?: #f keys?: #t))
		 ((eq? '#!optional (car args))
		  (collect-args (cdr args) reqs?: #f opts?: #t keys?: #f))
		 (else
		  (begin
		    (cond
		     (reqs?
		      (set! reqs (append reqs (list (car args)))))
		     (opts?
		      (set! opts (append opts (list (cons (caar args) (cdar args))))))
		     (keys?
		      (set! keys (append keys (list (cons (caar args) (cdar args)))))))
		    (collect-args (cdr args))))))
	       (else
		(set! opts (list args '...))))))

	  (collect-args args)

	  `(,sym ("args" (("required" ,@reqs)
			  ("optional" ,@opts)
			  ("key" ,@keys)))
		 ,(if (and mod)
		      (cons "module" mod)
		      (list "module"))))))))

  ;; Builds a signature list from an identifier
  (define (find-signatures sym)
    (let ((result (symbol-information-list sym)))
      (map fmt result)))
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Geiser core functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (geiser-eval module form . rest)
    (when (and module (not (symbol? module)))
      (error "Module should be a symbol"))
    
    ;; All calls start at toplevel
    (let* ((thunk (lambda () (eval form))))
      (write-to-log form)
      (call-with-result thunk)))

  ;; Load a file

  (define (geiser-load-file file)
    (let* ((file (if (symbol? file) (symbol->string file) file))
           (found-file (geiser-find-file file)))
      (call-with-result
       (lambda ()
         (when found-file
           (load found-file))))))

  ;; The no-values identity

  (define (geiser-no-values)
    (values))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Invoke a newline

  (define (geiser-newline . rest)
    (newline))

  ;; Spawn a server for remote repl access

  (define (geiser-start-server . rest)
    (let* ((listener (tcp-listen 0))
           (port (tcp-listener-port listener)))
      (define (remote-repl)
        (receive (in out) (tcp-accept listener)
          (current-input-port in)
          (current-output-port out)
          (current-error-port out)

          (repl)))

      (thread-start! (make-thread remote-repl))

      (write-to-log `(geiser-start-server . ,rest))
      (write-to-log `(port ,port))

      (write `(port ,port))
      (newline)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completions, Autodoc and Signature
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (current-environment-completions prefix)
    (let ((size (string-length prefix)))
      (filter
       (lambda (candidate) (substring=? prefix candidate 0 0 size))
       (map (o symbol->string car) (##sys#current-environment)))))

  (define (apropos-completions prefix)
    (let ((candidates (apropos-list `(: bos ,prefix) #:macros? #t)))
      (remove
       (lambda (candidate) (substring-index "#" candidate))
       (map symbol->string candidates))))

  (define (geiser-completions prefix . rest)
    (append (apropos-completions prefix)
            (current-environment-completions prefix)))

  (define (geiser-module-completions prefix . rest)
    '())
  
  (define (geiser-autodoc ids . rest)
    (cond
     ((null? ids) #f)
     ((symbol? ids)
      (find-signatures ids))
     ((list? ids)
      (let ((first (find-signatures (car ids))))
	(if first first (geiser-autodoc (cdr ids)))))
     (else #f)))
  
  (define (geiser-object-signature name object . rest)
    (let* ((sig (geiser-autodoc `(,name))))
      (if (null? sig) '() (car sig))))

    ;; TODO: Divine some way to support this functionality

  (define (geiser-symbol-location symbol . rest)
    '(("file") ("line")))

  (define (geiser-symbol-documentation symbol . rest)
    (let* ((sig (find-signatures symbol)))
      `(("signature" ,@(car sig))
        ("docstring" . ""))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File and Buffer Operations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define geiser-chicken-load-paths (make-parameter '("" ".")))

  (define (geiser-find-file file . rest)
    (when file
      (let ((paths (geiser-chicken-load-paths)))
	(define (try-find file paths)
	  (cond
	   ((null? paths) #f)
	   ((file-exists? (string-append (car paths) file))
	    (string-append (car paths) file))
	   (else (try-find file (cdr paths)))))
	(try-find file paths))))

  (define (geiser-add-to-load-path directory . rest)
    (let* ((directory (if (symbol? directory)
                          (symbol->string directory)
                          directory))
           (directory (if (not (equal? #\/ (string-ref directory (- (string-length directory)))))
                          (string-append directory "/")
                          directory)))
      (call-with-result
       (lambda ()
         (when (directory-exists? directory)
           (geiser-chicken-load-paths (cons directory (geiser-chicken-load-paths))))))))

  (define (geiser-compile-file file . rest)
    #f)

    ;; TODO: Support compiling regions

  (define (geiser-compile form module . rest)
    (error "Chicken does not support compiling regions"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Should return:
  ;; '(("modules" . sub-modules) ("procs" . procedures) ("syntax" . macros) ("vars" . variables))
  (define (geiser-module-exports module-name . rest)
    '())

  ;; Returns the path for the file in which an egg or module was defined

  (define (geiser-module-path module-name . rest)
    #f)

  ;; Returns:
  ;; `(("file" . ,(module-path name)) ("line"))

  (define (geiser-module-location name . rest)
    #f)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (geiser-macroexpand form . rest)
    (with-output-to-string
      (lambda ()
        (write (expand form)))))

;; End module
  )
