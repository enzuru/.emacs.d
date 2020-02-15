(declare (usual-integrations))

(with-working-directory-pathname
    (directory-pathname (current-load-pathname))
  (lambda ()
    (load "compile.scm")
    (load-package-set "geiser"
                      `())))

(add-subsystem-identification! "Geiser" '(0 1))

