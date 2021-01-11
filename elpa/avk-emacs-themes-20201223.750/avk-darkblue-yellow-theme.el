;;; avk-darkblue-yellow-theme.el --- DarkBlue+White theme from AVK

;; Copyright (C) 2015 Alex V. Koval

;; Author: Alex V. Koval <alex@koval.kharkov.ua>
;; Maintainer: Alex V. Koval <alex@koval.kharkov.ua>
;; Homepage: https://github.com/avkoval/avk-emacs-themes
;; Created: 14th June 2015
;; Version: 0.2
;; Keywords: theme

;;; Commentary:
;;
;; Alex V. Koval avk-darkblue-yellow theme
;;
;; Dark contrast theme. Getting the right balance for dark theme contast was as challange
;; as most of popular themes mentioned low contrast (e.g. solarized family and some others)
;; and other were too contast (e.g. cyperpunk).
;;
;; Also, I wanted something on a dark blue background and were unable to find it.
;;
;; So far, I ended up creaating this themes, and using it almost on daily basis.
;; I can also recommend to look into alternatives as:
;;
;; - base16-circus
;; - base16-materia
;; - some other base16-* dark themes
;; - doom-* themes (doom-vibrant, doom-molokai)
;; - warm-night
;; - moe-dark
;;

;;; Code:


(deftheme avk-darkblue-yellow "DarkBlue background + yellow font foreground theme from AVK")

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'avk-darkblue-yellow

   `(ac-candidate-face ((t (:background "gray23" :foreground "yellow2" :weight bold))))
   `(ac-selection-face ((t (:background "royalBlue4" :foreground "yellow2" :weight bold))))
   `(ahg-status-deleted-face ((default (:inherit font-lock-warning-face)) (nil nil)))
   `(ahg-status-modified-face ((default (:foreground "forest green" :inherit nil)) (nil nil)))
   `(ahg-status-unknown-face ((default (:foreground "yellow3")) (nil nil)))
   `(ahg-invisible-face ((default (:foreground "gray23")) (nil nil)))
   `(anything-ff-directory ((t (:inherit dired-directory))))
   `(anything-header ((t (:inherit font-lock-function-name-face))))
   `(comint-highlight-input ((t (:foreground "LightSkyBlue1" :weight bold))))
   `(compilation-error ((t (:inherit font-lock-warning-face))))
   `(compilation-line-number ((t (:foreground "orange red" :weight bold))))
   `(cursor ((t (:background "green"))))
   `(custom-variable-tag ((((class color) (background dark)) (:inherit variable-pitch :foreground "DarkOrange" :weight bold))))
   `(default ((t (:stipple nil :background "#191935" :foreground "wheat3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal ))))
   `(diff-added ((t (:foreground "lawn green"))))
   `(diff-removed ((t (:foreground "light coral"))))
   `(dired-directory ((t (:inherit font-lock-function-name-face))))
   `(dired-header ((t (:inherit font-lock-type-face :weight bold :height 1.2 :family "verdana"))))
   `(dired-mark ((t (:inherit font-lock-constant-face :foreground "VioletRed4"))))
   `(dired-marked ((t (:background "VioletRed4" :underline "green"))))
   `(django-tag-face ((t (:background "#092e20" :box (:line-width 1 :color "grey22")))) t)
   `(django-variable-face ((t (:foreground "#479dcc"))) t)
   `(dropdown-list-face ((t (:inherit default :background "gray89" :foreground "black"))))
   `(dropdown-list-selection-face ((t (:inherit dropdown-list :background "#6d1717"))))
   `(ecb-analyse-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face :background "DarkSlateBlue" :foreground "white"))))
   `(ecb-default-highlight-face ((((class color) (background dark)) (:background "DarkSlateBlue" :foreground "white"))))
   `(ecb-source-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face :background "DeepSkyBlue" :foreground "white"))))
   `(ecb-tag-header-face ((((class color) (background dark)) (:background "SeaGreen1" :foreground "black"))))
   `(flymake-errline ((((class color)) (:background "#9d061f"))))
   `(flymake-infoline ((t (:background "gray20"))))
   `(flymake-warnline ((t (:background "#3f3f3f"))))
   `(flycheck-error ((t (:background "brown4"))))
   `(flycheck-fringe-error ((t (:inherit (flycheck-error)))))
   `(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "green"))))
   `(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 16)) nil)))
   `(font-lock-comment-face ((t (:foreground "honeydew4" :slant italic :weight normal))))
   `(font-lock-function-name-face ((t (:background "#530047" :foreground "gray77" :box (:line-width 2 :color "black" :style pressed-button) :weight bold))))
   `(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "PaleVioletRed3" :weight bold))))
   `(font-lock-string-face ((t (:foreground "forest green"))))
   `(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "PaleVioletRed3" :weight bold))))
   `(helm-buffer-saved-out ((t (:foreground "red"))))
   `(helm-delete-async-message ((t (:foreground "yellow"))))
   `(helm-ff-backup-file ((t (:inherit dired-ignored))))
   `(helm-ff-denied ((t (:foreground "#ff0086" :background "#505050"))))
   `(helm-ff-directory ((t (:inherit dired-directory))))
   `(helm-ff-dirs ((t (:inherit font-lock-function-name-face))))
   `(helm-ff-dotted-directory ((t (:inherit dired-ignored))))
   `(helm-ff-dotted-symlink-directory ((t (:foreground "#fd8900" :background "#505050"))))
   `(helm-ff-executable ((t (:foreground "#00c918"))))
   `(helm-ff-file ((t (:inherit default))))
   `(helm-ff-file-extension ((t (:foreground "#505050"))))
   `(helm-ff-invalid-symlink ((t (:inherit dired-warning))))
   `(helm-ff-pipe ((t (:foreground "#aba800" :background "#505050"))))
   `(helm-ff-rsync-progress ((t (:inherit font-lock-warning-face))))
   `(helm-ff-socket ((t (:foreground "#ad00a1"))))
   `(helm-ff-suid ((t (:foreground "#ff0086"))))
   `(helm-ff-symlink ((t (:inherit dired-symlink))))
   `(helm-ff-truename ((t (:inherit font-lock-string-face))))
   `(helm-history-deleted ((t (:inherit helm-ff-invalid-symlink))))
   `(helm-history-remote ((t (:foreground "Indianred1"))))
   `(helm-selection ((t (:inherit region))))
   `(helm-source-header ((t (:inherit font-lock-function-name-face))))
   `(helm-visible-mark ((t (:background "dark green"))))
   `(highlight ((t (:background "gray30"))))
   `(highlight-changes ((((min-colors 88) (class color)) (:background "#00254a"))))
   `(highlight-changes-delete ((((min-colors 88) (class color)) (:background "#8b6969"))))
   `(hl-line ((t (:background "#0b3540"))))
   `(ido-first-match ((t (:background "#193980" :foreground "gray66" :weight bold))))
   `(ido-only-match ((t (:background "#15572c" :foreground "gray75" :weight bold))))
   `(ido-subdir ((((min-colors 88) (class color)) (:weight bold :foreground nil))))
   `(isearch ((t (:background "orange" :foreground "black"))))
   `(jabber-chat-prompt-foreign ((t (:inherit custom-face-tag))))
   `(jabber-chat-prompt-local ((t (:inherit org-level-4))))
   `(jabber-roster-user-online ((t (:inherit font-lock-string-face))))
   `(lazy-highlight ((((class color) (min-colors 88) (background dark)) (:background "darkgreen" :foreground "black"))))
   `(linum ((t (:foreground "DeepSkyBlue3" :height 0.9 :background "#16103a" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :weight normal))))
   `(line-number ((t (:foreground "DeepSkyBlue3" :height 0.9 :background "#16103a" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :weight normal))))
   `(line-number-current-line ((t (:inherit line-number :inverse-video t :foreground "gray40"))))
   `(match ((((class color) (min-colors 88) (background dark)) (:background "SlateBlue4" :foreground "white"))))
   `(message-cited-text ((((class color) (background dark)) (:foreground "SandyBrown"))))
   `(message-header-name ((((class color) (background dark)) (:foreground "DarkGrey"))))
   `(message-header-other ((((class color) (background dark)) (:foreground "LightPink2"))))
   `(message-header-subject ((((class color) (background dark)) (:foreground "yellow2"))))
   `(message-separator ((((class color) (background dark)) (:foreground "thistle"))))
   `(minibuffer-prompt ((((background dark)) (:foreground "gold2" :weight bold))))
;   `(mode-line-80col-face ((t  (:inherit 'mode-line-position-face :foreground "black" :background "#eab700"))))
;   `(mode-line-read-only-face ((t  (:foreground "blue4" :weight bold))))

   `(mode-line ((t (:box (:line-width 2 :color "#315068" :style released-button) :inverse-video nil :foreground "gray90" :background "#315068"))))
   `(mode-line-inactive ((t (:weight light :box (:line-width 1 :color "#27313f" :style nil) :inverse-video nil :foreground "gray60" :background "#27313f" :inherit (mode-line)))))
   `(mode-line-read-only-face ((t (:foreground "cyan3"))))
   `(mode-line-modified-face ((t (:foreground "white smoke" :background "#007400"))))
   `(mode-line-folder-face ((t (:foreground "gray60"))))
   `(mode-line-filename-face ((t (:foreground "#eab700" :weight bold))))
   `(mode-line-position-face ((t (:family "Menlo" ))))
   `(mode-line-mode-face ((t (:foreground "gray80"))))
   `(mode-line-minor-mode-face ((t (:foreground "gray40"))))
   `(mode-line-process-face ((t :(foreground "LimeGreen"))))
   `(mode-line-80col-face ((t (mode-line-position-face :foreground "black" :background "#eab700"))))


   `(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "#123a4d"))))
   `(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "#2e2e51"))))
   `(notmuch-hello-logo-background ((t (:background "#2f4f4f"))))
   `(notmuch-message-summary-face ((t (:inherit font-lock-function-name-face))))
   `(notmuch-search-count ((t (:inherit default :foreground "yellow3"))))
   `(notmuch-search-date ((t (:inherit default :foreground "SpringGreen4"))))
   `(notmuch-search-subject ((t (:foreground "dark turquoise"))))
   `(notmuch-search-unread-face ((t (:weight bold))))
   `(org-agenda-clocking ((t (:inherit secondary-selection))) t)
   `(org-agenda-done ((t (:foreground "dark gray" :strike-through "dark slate blue"))))
   `(org-agenda-structure ((t (:height 1.4 :foreground "light sky blue"))))
   `(org-archived ((t (:foreground "LemonChiffon4"))))
   `(org-checkbox ((t (:inherit font-lock-function-name-face))))
   `(org-column ((t (:weight normal :slant normal :inherit default))))
   `(org-column-title ((t (:background "dark green" :underline t :weight bold))))
   `(org-date ((t (:foreground "dark orange" :underline t :weight bold))))
   `(org-done ((t (:foreground "cornsilk4" :strike-through t :weight normal))))
   `(org-habit-alert-face ((((background dark)) (:background "gold" :foreground "red3"))))
   `(org-habit-overdue-face ((t (:strike-through t :foreground "firebrick"))))
   `(org-habit-overdue-future-face ((t (:foreground "darkred" :underline (:color foreground-color :style wave)))))
   `(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "dim gray" :strike-through t))))
   `(org-hide ((((background dark)) (:foreground "darkslategrey"))))
   `(org-level-2 ((((class color) (min-colors 16) (background dark)) (:foreground "RosyBrown2"))))
   `(org-level-4 ((((class color) (min-colors 88) (background dark)) (:foreground "darkgoldenrod3"))))
   `(org-link ((t (:foreground "DarkGoldenrod1" :underline "IndianRed3" :weight bold))))
   `(org-mode-line-clock ((t (:inherit modeline))) t)
   `(org-scheduled ((t (:foreground "thistle4" :slant italic))))
   `(org-scheduled-previously ((t (:foreground "indian red"))))
   `(org-scheduled-today ((t (:foreground "SeaGreen3" :slant italic))))
   `(org-todo ((t (:foreground "forest green" :weight bold :box (:line-width 1 :color "dark green" :style nil) :foreground "forest green"))))
   `(org-upcoming-deadline ((t (:foreground "hot pink"))))
   `(org-quote ((t (:slant italic :background "#002a4d"))))
   `(outline-1 ((t (:foreground "LightSteelBlue2" :inherit nil :height 1.3))))
   `(outline-3 ((t (:foreground "yellow"))))
   `(outline-7 ((t (:foreground "chartreuse"))))
   `(py-XXX-tag-face ((t (:background "medium violet red" :foreground "white"))) t)
   `(py-builtins-face ((t (:foreground "medium sea green"))) t)
   `(py-class-name-face ((t (:foreground "deep sky blue"))) t)
   `(py-decorators-face ((t (:foreground "cyan4"))) t)
   `(py-pseudo-keyword-face ((t (:foreground "RosyBrown3"))) t)
   `(region ((t (:background "#5b1737" :foreground "white"))))
   `(rst-level-1-face ((t (:background "SlateBlue4"))) t)
   `(rst-level-2-face ((t (:background "grey20"))) t)
   `(secondary-selection ((t (:background "forest green" :foreground "white"))))
   `(shadow ((((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey40"))))
   `(show-paren-match ((t (:foreground "deep sky blue" :inverse-video t))))
   `(smerge-refined-change ((t (:background "midnight blue"))))
   `(tabbar-default ((t (:inherit variable-pitch :background "gray75" :foreground "MidNightBlue" :family "verdana"))))
   `(tabbar-selected ((t (:inherit tabbar-default :foreground "red4" :family "verdana"))))
   `(tooltip ((((class color)) (:inherit variable-pitch :background "IndianRed1" :foreground "black"))))
   `(trailing-whitespace ((t (:background "#182749"))))
   `(which-func ((((class color) (min-colors 88) (background dark)) (:foreground "dark red"))))
   `(whitespace-empty ((t (:background "gray33"))))
   `(whitespace-line ((t (:foreground "DarkOrange1"))))
   `(whitespace-space ((((class color) (background dark)) (:foreground "gray40"))))
   `(whitespace-tab ((t (:background "#03222f"))))
   `(widget-button ((t (:foreground "yellow2"))))
   `(fringe ((t (:background "#0f1a39" :foreground "yellow"))))

   `(ediff-current-diff-A ((t (:background "pale green" :foreground "firebrick"))))
   `(ediff-current-diff-Ancestor ((t (:background "VioletRed" :foreground "Black"))))
   `(ediff-current-diff-B ((t (:background "Yellow" :foreground "DarkOrchid"))))
   `(ediff-current-diff-C ((t (:background "Pink" :foreground "Navy"))))
   `(ediff-even-diff-A ((t (:background "light grey" :foreground "Black"))))
   `(ediff-even-diff-Ancestor ((t (:background "Grey" :foreground "White"))))
   `(ediff-even-diff-B ((t (:background "Grey" :foreground "White"))))
   `(ediff-even-diff-C ((t (:background "light grey" :foreground "Black"))))
   `(ediff-fine-diff-A ((t (:background "sky blue" :foreground "Navy"))))
   `(ediff-fine-diff-Ancestor ((t (:background "Green" :foreground "Black"))))
   `(ediff-fine-diff-B ((t (:background "cyan" :foreground "Black"))))
   `(ediff-fine-diff-C ((t (:background "Turquoise" :foreground "Black"))))
   `(ediff-odd-diff-A ((t (:background "Grey" :foreground "White"))))
   `(ediff-odd-diff-Ancestor ((t (:background "gray40" :foreground "cyan3"))))
   `(ediff-odd-diff-B ((t (:background "light grey" :foreground "Black"))))
   `(ediff-odd-diff-C ((t (:background "Grey" :foreground "White"))))
   `(highlight-indentation-face ((t (:background "#202335"))))
   `(ledger-occur-xact-face ((t (:background "gray5"))))
   )
  )

;;;###autoload
(when (and load-file-name (boundp 'custom-theme-load-path))
 (add-to-list
      'custom-theme-load-path
      (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'avk-darkblue-yellow)
;;; avk-darkblue-yellow-theme.el ends here
