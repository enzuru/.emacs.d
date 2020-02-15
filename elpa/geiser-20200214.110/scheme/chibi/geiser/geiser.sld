; -*- geiser-scheme-implementation:chibi; -*-
(define-library (geiser)
  (export geiser:completions
          geiser:eval
          geiser:autodoc
          geiser:module-completions
          geiser:no-values
	  geiser:symbol-location ; implement this interface in [[file://./geiser.scm#geiser:symbol-location]] in order to make proper cross-referencing working.
	  geiser:module-location
          geiser:newline)
  (import
    (scheme small)
    (chibi modules)
    (chibi)
    (chibi filesystem)
    (chibi pathname)
    (meta)
    (chibi ast)
    (chibi string)
    (srfi 1)
    (srfi 95)
    (srfi 38)
    (chibi show)
    (srfi 115))
  (include "geiser.scm"))
