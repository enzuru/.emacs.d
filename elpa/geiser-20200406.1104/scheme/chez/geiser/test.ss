(import (geiser)
        (chezscheme))

(define-syntax assert-equal
  (syntax-rules ()
    ((_ a b)
     (if (equal? a b)
         #t
         (begin
           (display (format "failed assertion `~a' == `~a'" a b))
           (assert (equal? a b)))))))

(define-syntax get-result
  (syntax-rules ()
    ((_ form)
     (with-output-to-string
       (lambda ()
         (geiser:eval #f form))))))

(define-syntax do-test
  (syntax-rules ()
    ((_ form result)
     (assert
      (equal?
       (get-result form)
       result)))))

(define-syntax do-test-macroexpand
  (syntax-rules ()
    ((_ form result)
     (assert
      (equal? (geiser:macroexpand form)
              result)))))

(define-syntax test-or
  (syntax-rules ()
    ((_ x) x)
    ((_ x xs ...)
     (if x
         x
         (test-or xs ...)))))

(do-test-macroexpand
 '(test-or 1)
 '1)

(do-test-macroexpand
 '(test-or 1 2)
 '(if 1 1 2))

;; (something-doesnot-exist)
;;=> Error: Exception: variable something-doesnot-exist is not bound
(do-test
 '(something-doesnot-exist)
 "((result \"\") (output . \"\") (error (key . \"Exception: variable something-doesnot-exist is not bound\")))\n"
 )

;; (make-violation)
;;=> #<condition &violation>
(do-test
 '(make-violation)
 "((result \"#<condition &violation>\\n\") (output . \"\"))\n")

;; (values 1 2 3)
;;==> (1 2 3)
(do-test
 '(values 1 2 3)
 "((result \"(1 2 3)\\n\") (output . \"\"))\n")

;; 1
;;=> 1
(do-test '1 "((result \"1\\n\") (output . \"\"))\n")


;; '(case-lambda
;;    [(x1 x2) (+ x1 x2)]
;;    [(x1 x2 x3) (+ (+ x1 x2) x3)]
;;    [(x1 x2 . rest)
;;     ((letrec ([loop (lambda (x1 x2 rest)
;;                    (let ([x (+ x1 x2)])
;;                      (if (null? rest)
;;                          x
;;                          (loop x (car rest) (cdr rest)))))])
;;        loop)
;;      x1
;;      x2
;;      rest)]
;;    [(x1) (+ x1)]
;;    [() (+)])
#|=> (case-lambda
  [(x1 x2) (+ x1 x2)]
  [(x1 x2 x3) (+ (+ x1 x2) x3)]
  [(x1 x2 . rest)
   ((letrec ([loop (lambda (x1 x2 rest)
                     (let ([x (+ x1 x2)])
                       (if (null? rest)
                           x
                           (loop x (car rest) (cdr rest)))))])
      loop)
     x1
     x2
     rest)]
  [(x1) (+ x1)]
  [() (+)])
  |#
(do-test (quote '(case-lambda
  [(x1 x2) (+ x1 x2)]
  [(x1 x2 x3) (+ (+ x1 x2) x3)]
  [(x1 x2 . rest)
   ((letrec ([loop (lambda (x1 x2 rest)
                     (let ([x (+ x1 x2)])
                       (if (null? rest)
                           x
                           (loop x (car rest) (cdr rest)))))])
      loop)
     x1
     x2
     rest)]
  [(x1) (+ x1)]
  [() (+)])) "((result \"(case-lambda\\n  [(x1 x2) (+ x1 x2)]\\n  [(x1 x2 x3) (+ (+ x1 x2) x3)]\\n  [(x1 x2 . rest)\\n   ((letrec ([loop (lambda (x1 x2 rest)\\n                     (let ([x (+ x1 x2)])\\n                       (if (null? rest)\\n                           x\\n                           (loop x (car rest) (cdr rest)))))])\\n      loop)\\n     x1\\n     x2\\n     rest)]\\n  [(x1) (+ x1)]\\n  [() (+)])\\n\") (output . \"\"))\n")
