; -*- geiser-scheme-implementation:chibi; -*-
(define (all-environment-exports environment prefix)
  (if environment
      (append (filter (lambda (identifier)
                        (if (string=? prefix "")
                            #t
                            (string-contains identifier prefix)))
                      (map symbol->string (env-exports environment)))
              (all-environment-exports (env-parent environment) prefix))
      '()))

(define (geiser:completions prefix . rest)
  rest
  (sort (all-environment-exports (current-environment) prefix)
        string-ci<?))

(define (write-to-string form)
  (let ((out (open-output-string)))
    (write form out)
    (get-output-string out)))

(define (geiser:write/ss-to-string form)
  (let ((out (open-output-string)))
    (write/ss form out)
    (get-output-string out)))

;;> Evaluate a \var{form} in the namespace of the \var{module}.
;;> The meaning of \var{rest} is unknown.
;;> Return the alist with the first field, \scheme{result}, holds
;;> the result of evaluation \scheme{(write)}'d and the second
;;> field, \scheme{output}, contains everyting that the evaluation
;;> would print to the standard output.
;;> In case of an exception, the message is formatted with
;;> \scheme{(chibi show)} and written to both variables in addition
;;> to whatever was already there.

(define (get-stack-trace)
  (let ((err-output (open-output-string)))
    (parameterize ((current-error-port err-output))
      (print-stack-trace)
      (get-output-string err-output))))

(define (geiser:eval module form . rest)
  rest
  (guard (err
	  (else
	   (show #t ; to standard output (to comint)
	    "Geiser-chibi falure in scheme code\n")
	   (show #t "Error: \n" err "\n")
	   (print-stack-trace)))
    (let* ((output (open-output-string))
	   (form-analyzed (analyze form))
	   (result (parameterize ((current-output-port output))
		     (call/cc (lambda (continuation)
				(with-exception-handler
				    (lambda (err)
				      (let ((stack-trace (get-stack-trace)))
					(show #t
					      "Output (exception): "
					      err
					      " \nStack trace:\n"
					      stack-trace)
					(continuation (write-to-string
						       (show #f
							     "Result (exception): "
							     err
							     "\nStack trace:\n"
							     stack-trace)))))
				  (lambda () (if module
				      (let ((mod (module-env (find-module module))))
					(eval form-analyzed mod))
				      (eval form-analyzed)))))))))
      (write ; to standard output (to comint)
       `((result ,(write-to-string result))
	 (output . ,(get-output-string output))))))
  (values))


(define (geiser:module-completions prefix . rest)
  ;; (available-modules) walks the directory tree and is too slow
  (let ((modules (map car *modules*)))
    (map write-to-string
         (delete-duplicates
          (filter (lambda (module)
                    (if (string=? "" prefix)
                        #t
                        (string-contains prefix (write-to-string module))))
                  modules)))))

(define (procedure-arglist id fun)
  (let ((arglist (lambda-params (procedure-analysis fun))))
    (if (pair? arglist)
        (let loop ((arglist arglist)
                   (optionals? #f)
                   (required '())
                   (optional '()))
          (cond ((null? arglist)
                 `(,id ("args" (("required" ,@(reverse required))
                                ("optional" ,@(reverse optional))
                                ("key")
                                ("module" ,(let ((mod (containing-module fun))) (if mod (car mod) #f)))))))
                ((symbol? arglist)
                 (loop '()
                       #t
                       required
                       (cons "..." (cons arglist optional))))
                (else
                 (loop
                  (cdr arglist)
                  optionals?
                  (if optionals? required (cons (car arglist) required))
                  (if optionals? (cons (car arglist) optional) optional)))))
        '())))

(define (geiser:operator-arglist id)
  (let ((binding (eval id)))
    (cond ((procedure? binding)
           (if (opcode? binding)
               '()
               (procedure-arglist id binding)))
          (else
           '()))))

(define (geiser:autodoc ids . rest)
  (and #f ( ;; disabled temporarily, because it didn't really work
  rest
  (cond ((null? ids) '())
        ((not (list? ids))
         (geiser:autodoc (list ids)))
        ((not (symbol? (car ids)))
         (geiser:autodoc (cdr ids)))
        (else
         (map (lambda (id)
                (geiser:operator-arglist id))
              ids))))))

(define (geiser:no-values)
  #f)

(define (geiser:newline)
  #f)



;;> A chibi implementation of the standard geiser's location-making
;;> subroutine. \var{file} is a string representing file name with path,
;;> \var{line} is the line number starting from 0 (scheme way).

(define (make-location file line)
  (list (cons "file"
	      (if (string? file)
		  (path-resolve
		   file
		   (current-directory))
		  '()))
        (cons "line" (if (number? line) (+ 1 line) '())))
)



;;> Finds symbol locations in source files. This version
;;> is very early preview and still has the following limitations:
;;> * It only works with exported symbols. (Even for current file).
;;> * Even with exported symbols it ignores the renamed ones.
;;> * It only accesses identifiers which have code positions
;;>   associated with them in runtime. I.e. it doesn't grep.

(define (geiser:symbol-location symbol-in-question . rest)
  (display "Modules exporting identifier ")
  (display symbol-in-question)
  (display "found:")
  (newline)
  (guard (err
	  ((error-object? err)
	   (display "Error in geiser:symbol-location:")
	   (display (error-object-message err))
	   (make-location '() '()))
	  (else
	   (display "Peculiar error in geiser:symbol-location:")
	   (display err)
	   (make-location '() '())))
    (let* ((l-modules-found (modules-exporting-identifier symbol-in-question))
	   (result (if (not (equal? l-modules-found '()))
		       (let* ((l-selected-module (caar l-modules-found))
			      (result (tree-walker
				       (module-ast
					(analyze-module
					 l-selected-module))
			     symbol-in-question)))
			 (display (map car l-modules-found))
			 (newline)
			 result)
		       (let ((result (cons '() '())))
			 (display "Not found.\n")
		result))))
      (make-location
       (car result)
       (- (cdr result) 1) ; Ehh... line numbering in 'make-location starts from 0
       ))))

(define (tree-walker node . symbol-in-question)
; The reason this function used  a (let), not a (begin) is that (begin)
; for some reason does not allow (display)s inside. It 
; works in xfce4-terminal, but not here. I decided not to
; debug it, since (let () ) "just worked". TODO.
  
  (if (pair? node)
	(let ((result
	       (tree-walker
		(car node)
		(car symbol-in-question)))
	      )
	  (if result
		result
		(tree-walker (cdr node) (car symbol-in-question))
	      )
	  )
      (let () ; we have leaf
	(if (set? node)
	    (if (equal? (ref-name (set-var node)) (car symbol-in-question))
		(let
		    ((thingy (set-value node)))
		  (cond ((lambda? thingy) (lambda->lcons thingy))
			;((macro?  thingy) (error "Macros not supported"))
			(else (set-node->lcons/dirty-trick node))))
		#f)
	    #f
	    ))))

(define (lambda->lcons thingy)
  (let* ((l-source (lambda-source thingy))
	 (l-location
	  (if (pair? l-source)
	      (cons
	       (car l-source)
	       (cdr l-source))
	      (let ()
		(display "Lambda with no source information.")
		(cons '() '())))))
    l-location))



;;> We resort to this dirty trick of write/ss parsing because we don't
;;> have the set-source accessor as a public method. If set-source
;;> still appears in Chibi > 0.8, it may still be useful for more
;;> obscure data types.

(define (set-node->lcons/dirty-trick node)
  (guard (err
	  (else
	   (error "set-source dirty trick failed!" )))
  (let* ((l-str-to-check (geiser:write/ss-to-string node))
	 (strl (string-length l-str-to-check))
	 (l-matches
	  (regexp-search
	   '(: "(\""
	       (-> filename (*? graphic) )
	       "\" . "
	       (-> lineno (+ num) )
	       ")}")
	   l-str-to-check ))
	 (l-filename
	  (regexp-match-submatch l-matches 'filename))
	 (l-lineno
	  (string->number
	   (regexp-match-submatch l-matches 'lineno)))
	 (l-location
	  (cons l-filename l-lineno)))
    l-location)))



;;> A function to find the file where the symbol
;;> \var{symbol-representing-module} is defined.

(define (geiser:module-location symbol-representing-module)
  (guard ( err
	   ((error-object? err)
	    (display "Error in module-location:\n")
	    (display err)
	    (newline)
	    (display (error-object-message err))
	    (make-location '() '()))
	   (else
	    (display "Peculiar error!\n")
	    (display err)
	    (newline)
	    (make-location '() '())))
    (let ((l-module (find-module symbol-representing-module)))
      (if (not (equal? l-module '()) )
	  (make-location
	   (find-module-file
	    (module-name->file
	     (module-name l-module))) 0 )
	  (make-location '() '())))))
