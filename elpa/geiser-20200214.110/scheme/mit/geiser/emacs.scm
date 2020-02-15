;;;; package: (runtime geiser)
(declare (usual-integrations))

(load-option 'format)

(define (all-completions prefix environment)
  (let (;; (prefix
        ;;  (if (environment-lookup environment 'PARAM:PARSER-CANONICALIZE-SYMBOLS?)
        ;;      (string-downcase prefix)
        ;;      prefix))
        (completions '()))
    (for-each-interned-symbol
     (lambda (symbol)
       ;; was string-prefix?, now defaults to case-insensitive
       ;; (MIT/GNU Scheme's default)
       (if (and (string-prefix-ci? prefix (symbol-name symbol))
                (environment-bound? environment symbol))
           (set! completions (cons (symbol-name symbol) completions)))
       unspecific))
    completions))

(define (operator-arglist symbol env)
  (let ((type (environment-reference-type env symbol)))
    (let ((ans (if (eq? type 'normal)
                   (let ((binding (environment-lookup env symbol)))
                     (if (and binding
                              (procedure? binding))
                         (cons symbol (read-from-string
                                       (string-trim (with-output-to-string
                                                      (lambda () (pa binding))))))
                         #f))
                   #f ;; macros
                   )))
      ans)))

(define (geiser:operator-arglist symbol env)
  (let* ((arglist (operator-arglist symbol env))
         (operator symbol))
    (if arglist
        (let loop ((arglist (cdr arglist))
                   (optionals? #f)
                   (required '())
                   (optional '()))
          (cond ((null? arglist)
                 `(,operator ("args" (("required" ,@(reverse required))
                                      ("optional" ,@(reverse optional))
                                      ("key")
                                      ;; ("module" ,module)
                                      ))))
                ((symbol? arglist)
                 (loop '()
                       #t
                       required
                       (cons "..." (cons arglist optional))))
                ((eq? (car arglist) #!optional)
                 (loop (cdr arglist)
                       #t
                       required
                       optional))
                (else
                 (loop
                  (cdr arglist)
                  optionals?
                  (if optionals? required (cons (car arglist) required))
                  (if optionals? (cons (car arglist) optional) optional)))))
        '())))


(define (read-from-string str)
  (with-input-from-string str
    read))

(define (all-packages)
  (let loop ((package (name->package '()))) ;;  system-global-package
    (cons package
          (append-map loop (package/children package)))))

(define anonymous-package-prefix
  "environment-")

(define (env->pstring env)
  (let ((package (environment->package env)))
    (if package
        (write-to-string (package/name package))
        (string anonymous-package-prefix (object-hash env)))))

(define geiser-repl (nearest-repl))

(define (set-geiser-repl-prompt! env)
  (set-repl/prompt! geiser-repl (format #f
                                        "~s =>"
                                        (package/name (environment->package env))))
  env)

(define geiser-env #f)

(define (get-symbol-definition-location object)
  (let ((file (cond ((and (entity? object)
                          (procedure? object))
                     (receive (a b)
                         (compiled-entry/filename-and-index (entity-procedure object))
                       b
                       a))
                    ((compiled-procedure? object)
                     (receive (a b)
                         (compiled-entry/filename-and-index object)
                       b
                       a))
                    (else
                     '()))))
    (fix-mit-source-dir
     (if (and (string? file)
              (string-suffix? ".inf" file))
         (string-append (substring file 0 (- (string-length file) 3)) "scm")
         file))))

(define (fix-mit-source-dir filename)
  (let ((default-location "/usr/lib/mit-scheme-x86-64/"))
    (if (and geiser:mit-scheme-source-directory
             (not (string-null? geiser:mit-scheme-source-directory)))
        (if (string-prefix? default-location filename)
            (string-append geiser:mit-scheme-source-directory
                           (substring filename
                                      (string-length default-location)
                                      (string-length filename)))
            filename)
        filename)))

(define geiser:mit-scheme-source-directory #f)

;;;; ***************************************************************************

(define (geiser:eval module form . rest)
  rest
  (let* ((output (open-output-string))
         (environment (package/environment (find-package (if module
                                                             module
                                                             '(user))
                                                         #t)))
         (result (with-output-to-port output
                   (lambda ()
                     (eval form environment)))))
    (write `((result ,(write-to-string result))
             (output . ,(get-output-string output))))))

(define (geiser:autodoc ids . rest)
  rest
  (cond ((null? ids) '())
        ((not (list? ids))
         (geiser:autodoc (list ids)))
        ((not (symbol? (car ids)))
         (geiser:autodoc (cdr ids)))
        (else
         (let ((details (map (lambda (id)
                               (geiser:operator-arglist id (->environment '(user)))
                               ) ids)))
           details))))

(define (geiser:module-completions prefix . rest)
  rest
  (filter (lambda (pstring)
            (substring? prefix (write-to-string pstring)))
          (map (lambda (package)
                 (env->pstring (package/environment package)))
               (all-packages))))

(define (geiser:completions prefix . rest)
  rest
  (sort (all-completions prefix (->environment '(user)))
        string<?))

(define (geiser:ge environment)
  (let ((env (package/environment (find-package environment #t))))
    (set-geiser-repl-prompt! env)
    (set! geiser-env env))
  (ge environment))

(define (geiser:load-file filename)
  (load filename))

(define (geiser:module-exports module)
  (let* ((pkg (find-package module #t))
         (children (map package/name (package/children pkg)))
         (env (package/environment pkg)))
    (let loop ((vars '())
               (procs '())
               (syntax '())
               (bindings (environment-bindings env)))
      (if (null? bindings)
          `(("vars" . ,vars)
            ("procs" . ,procs)
            ("syntax" . ,syntax)
            ("modules" . ,(map list children)))
          (let* ((binding (car bindings))
                 (name (car binding))
                 (value (if (null? (cdr binding)) 'unassigned (cadr binding)))
                 (ref-type (environment-reference-type env name)))
            (cond ((eq? 'macro ref-type)
                   (loop vars
                         procs
                         (cons `(,name ("signature")) syntax)
                         (cdr bindings)))
                  ((procedure? value)
                   (loop vars
                         (cons
                          `(,name ("signature" . ,(geiser:operator-arglist name env)))
                          procs)
                         syntax
                         (cdr bindings)))
                  (else
                   (loop (cons `(,name) vars)
                         procs
                         syntax
                         (cdr bindings)))))))))

(define (geiser:symbol-documentation symbol)
  (if (environment-bound? geiser-env symbol)
      (let ((ref-type (environment-reference-type geiser-env symbol))
            (value (environment-safe-lookup geiser-env symbol)))
        (case ref-type
          ((macro)
           `(("signature" ,symbol ("args"))
             ("docstring" . "Macro")))
          ((unassigned)
           `(("signature" ,symbol ("args"))
             ("docstring" . "Value: Unassigned~%")))
          ((normal)
           (if (procedure? value)
               (let ((signature (geiser:operator-arglist symbol geiser-env)))
                 `(("signature" . ,signature)
                   ("docstring" . ,(format #f
                                           "Procedure:~%~a~%"
                                           (with-output-to-string (lambda () (pp value)))))))
               `(("signature" ,symbol ("args"))
                 ("docstring" . ,(format #f
                                         "Value:~%~a~%"
                                         (with-output-to-string (lambda () (pp value))))))
               ))
          (else
           `(("signature" ,symbol ("args"))
             ("docstring" . "Unknown thing...")))))
      '()))

(define (geiser:symbol-location symbol)
  (if (environment-bound? geiser-env symbol)
      (let ((ref-type (environment-reference-type geiser-env symbol))
            (value (environment-safe-lookup geiser-env symbol)))
        (if (eq? ref-type 'normal)
            (let ((file (get-symbol-definition-location value)))
              `(("name" . ,symbol)
                ("file" . ,file)
                ("line")))
            '()))
      `(("name" . ,symbol)
        ("file")
        ("line"))))

(define (geiser:module-location symbol)
  `(("name" . ,symbol)
    ("file")
    ("line")))


(define (geiser:newline)
  #f)

(define (geiser:no-values)
  #f)

(define (geiser:set-mit-scheme-source-directory dir)
  (set! geiser:mit-scheme-source-directory dir))

(define (geiser:callers symbol)
  symbol
  #f)

(define (geiser:callees symbol)
  symbol
  #f)

(set-geiser-repl-prompt! (package/environment (find-package '(user))))
