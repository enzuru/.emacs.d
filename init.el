;; Paths & packages

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/enzuru/")
(load-library "enzuru-packages")
(add-to-list 'load-path "~/.emacs.d/elpa/xelb-0.17/")
(add-to-list 'load-path "~/.emacs.d/elpa/exwm-0.22.1/")

;; Features

(load-library "enzuru-file-manager")
(load-library "enzuru-help")
(load-library "enzuru-hyperlinking")
(load-library "enzuru-mail")
(load-library "enzuru-project-management")
(load-library "enzuru-scheduler")
(load-library "enzuru-server")
(load-library "enzuru-shell")
(load-library "enzuru-syntax-checking")
(load-library "enzuru-remote")
(load-library "enzuru-version-control")
(load-library "enzuru-writing")

;; Languages & major modes

(load-library "enzuru-assembly")
(load-library "enzuru-c")
(load-library "enzuru-coffeescript")
(load-library "enzuru-css")
(load-library "enzuru-emacs-lisp")
(load-library "enzuru-feature")
(load-library "enzuru-fountain")
(load-library "enzuru-haskell")
(load-library "enzuru-java")
(load-library "enzuru-javascript")
(load-library "enzuru-json")
(load-library "enzuru-kotlin")
(load-library "enzuru-markdown")
(load-library "enzuru-objective-c")
(load-library "enzuru-org")
(load-library "enzuru-php")
(load-library "enzuru-puppet")
(load-library "enzuru-python")
(load-library "enzuru-ruby")
(load-library "enzuru-rust")
(load-library "enzuru-scheme")
(load-library "enzuru-swift")
(load-library "enzuru-web")
(load-library "enzuru-xml")
(load-library "enzuru-yaml")

;; Preferences

(load-library "enzuru-bars")
(load-library "enzuru-bell")
(load-library "enzuru-buffers")
(load-library "enzuru-compilation")
(load-library "enzuru-colors")
(load-library "enzuru-frames")
(load-library "enzuru-fonts")
(load-library "enzuru-highlight")
(load-library "enzuru-indentation")
(load-library "enzuru-margin")
(load-library "enzuru-modeline")
(load-library "enzuru-recent-files")
(load-library "enzuru-saving")
(load-library "enzuru-scrolling")
(load-library "enzuru-startup")
(load-library "enzuru-tabs")

;; Final setup

(load-library "enzuru-cleanup")
(load-library "enzuru-keys")
(load-library "enzuru-shutdown")
(load-library "enzuru-skin")

;; Hostname specific

(when (string= (system-name) "spirit")
  (load-library "enzuru-spirit"))
(when (string= (system-name) "solitude")
  (load-library "enzuru-solitude"))

;; Operating system specific

(if (eq system-type 'gnu/linux)
    (load-library "enzuru-linux"))
(if (eq system-type 'darwin)
    (load-library "enzuru-mac"))
(if (eq system-type 'berkeley-unix)
    (load-library "enzuru-bsd"))
(if (eq system-type 'windows-nt)
    (load-library "enzuru-windows"))

;; Custom variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "6ce5839b440284fca58bf2aa3e70335c7028701a19b54e556b78485ed153d309" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(package-selected-packages
   (quote
    (pianobar go-mode expand-region which-key soap-client debbugs avy kubernetes fish-mode fish-completion groovy-mode importmagic pylint blacken flycheck devdocs google-this company-anaconda anaconda-mode company-terraform vue-mode vue-html-mode nyan-mode color-theme-sanityinc-tomorrow dumb-jump emms gotham-theme airline-themes molokai-theme exotica-theme moody pass wanderlust counsel swiper rjsx-mode let-alist cl-generic exwm racer olivetti yafolding intero fancy-battery flycheck-swift3 flycheck-kotlin kotlin-mode yard-mode yaml-mode web-mode vline undo-tree sws-mode swift-mode string-inflection sml-modeline smartparens smart-tabs-mode smart-mode-line-powerline-theme slime shell-switcher scss-mode scala-mode2 sass-mode rvm ruby-tools ruby-refactor ruby-hash-syntax rspec-mode robe rainbow-delimiters purple-haze-theme puppet-mode projectile-rails project-mode prodigy php-mode paredit openwith multi-term markup-faces markdown-mode markchars magit js2-mode isearch-symbol-at-point htmlize highlight-symbol hexrgb haskell-mode guile-scheme goto-chg geiser fountain-mode fill-column-indicator feature-mode exec-path-from-shell ensime enh-ruby-mode elscreen elnode elfeed-web diminish db-pg coffee-mode ag))))

;; Custom faces

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(company-scrollbar-bg ((t (:background "#13812b594bdd"))))
 '(company-scrollbar-fg ((t (:background "#0e451fb63780"))))
 '(company-tooltip ((t (:inherit default :background "#0b2118bb2b48"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
 '(sp-show-pair-match-face ((t (:inherit show-paren-match :background "gray20")))))
