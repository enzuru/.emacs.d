(require 'find-file)

(add-to-list 'magic-mode-alist
             `(,(lambda ()
                  (and (string= (file-name-extension buffer-file-name) "h")
                       (re-search-forward "@\\<interface\\>"
                                          magic-mode-regexp-match-limit t)))
               . objc-mode))


(nconc (cadr (assoc "\\.h\\'" cc-other-file-alist)) '(".m" ".mm"))

(defadvice ff-get-file-name (around ff-get-file-name-framework
                                    (search-dir
                                     fname-stub
                                     &optional suffix-list))
  "Search for Mac framework headers as well as POSIX headers."
  (or
   (if (string-match "\\(.*?\\)/\\(.*\\)" fname-stub)
       (let* ((framework (match-string 1 fname-stub))
              (header (match-string 2 fname-stub))
              (fname-stub (concat framework ".framework/Headers/" header)))
         ad-do-it))
   ad-do-it))

(ad-enable-advice 'ff-get-file-name 'around 'ff-get-file-name-framework)
(ad-activate 'ff-get-file-name)

(setq cc-search-directories (list "."
                                  "../include"
                                  "/usr/include"
                                  "/usr/local/include/*"
                                  "/System/Library/Frameworks"
                                  "/Library/Frameworks"))

(setq company-clang-arguments (list "-I/Developer/Headers"
                                    "-I/usr/NextSpace/include"
                                    "-fobjc-nonfragile-abi"
                                    "-F/usr/NextSpace/Frameworks"))
