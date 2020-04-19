(require 'package)

(add-to-list 'package-archives
             '("gnu" .
               "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("melpa" .
               "https://melpa.org/packages/"))

(package-initialize)
