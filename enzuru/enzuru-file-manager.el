(add-to-list 'load-path "~/.emacs.d/local/sunrise-commander")

(require 'sunrise)
(require 'sunrise-modeline)
(require 'sunrise-tree)

(add-to-list 'auto-mode-alist '("\\.srvm\\'" . sr-virtual-mode))
