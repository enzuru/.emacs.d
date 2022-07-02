;; Custom variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("46b2d7d5ab1ee639f81bde99fcd69eb6b53c09f7e54051a591288650c29135b0" "f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" "dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" "bd82c92996136fdacbb4ae672785506b8d1d1d511df90a502674a51808ecc89f" "d1af5ef9b24d25f50f00d455bd51c1d586ede1949c5d2863bef763c60ddf703a" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "6ce5839b440284fca58bf2aa3e70335c7028701a19b54e556b78485ed153d309" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(dismal elisp-benchmarks emacs-lisp flycheck-clojure cider kubernetes-tramp elisp-lint use-package ppp "swiper" "swiper" rainbow-blocks nov notmuch lsp-java xref ivy-xref flim apel hackernews guix geiser-guile flycheck-guile typescript-mode almost-mono-themes omtose-phellack-theme solarized-theme zenburn-theme monokai-alt-theme monokai-theme dracula-theme avk-emacs-themes atom-one-dark-theme afternoon-theme abyss-theme seoul256-theme sly-repl-ansi-color sly-quicklisp sly lsp-ivy lsp-ui ccls company-lsp lsp-mode company-quickhelp-terminal dashboard dockerfile-mode docker-compose-mode docker hyperbole flycheck-objc-clang lispy pianobar go-mode expand-region which-key soap-client debbugs avy kubernetes fish-mode fish-completion groovy-mode importmagic pylint blacken flycheck devdocs google-this company-anaconda anaconda-mode company-terraform vue-mode vue-html-mode nyan-mode color-theme-sanityinc-tomorrow dumb-jump gotham-theme molokai-theme exotica-theme pass counsel swiper rjsx-mode let-alist cl-generic racer olivetti intero fancy-battery flycheck-swift3 flycheck-kotlin kotlin-mode yard-mode yaml-mode web-mode undo-tree sws-mode swift-mode string-inflection sml-modeline smart-tabs-mode smart-mode-line-powerline-theme shell-switcher scss-mode sass-mode rvm ruby-tools ruby-refactor ruby-hash-syntax rspec-mode robe rainbow-delimiters purple-haze-theme puppet-mode projectile-rails project-mode prodigy php-mode openwith multi-term markdown-mode magit js2-mode isearch-symbol-at-point htmlize highlight-symbol haskell-mode guile-scheme geiser fountain-mode feature-mode exec-path-from-shell enh-ruby-mode elscreen elnode diminish db-pg ag))
 '(safe-local-variable-values
   '((eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'")
     (eval let
           ((root-dir-unexpanded
             (locate-dominating-file default-directory ".dir-locals.el")))
           (when root-dir-unexpanded
             (let*
                 ((root-dir
                   (expand-file-name root-dir-unexpanded))
                  (root-dir*
                   (directory-file-name root-dir)))
               (unless
                   (boundp 'geiser-guile-load-path)
                 (defvar geiser-guile-load-path 'nil))
               (make-local-variable 'geiser-guile-load-path)
               (require 'cl-lib)
               (cl-pushnew root-dir* geiser-guile-load-path :test #'string-equal))))
     (eval setq-local guix-directory
           (locate-dominating-file default-directory ".dir-locals.el")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
