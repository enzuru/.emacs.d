;;; avk-daylight-theme.el --- DarkBlue+White theme from AVK

;; Copyright (C) 2015 Alex V. Koval

;; Author: Alex V. Koval <alex@koval.kharkov.ua>
;; Maintainer: Alex V. Koval <alex@koval.kharkov.ua>
;; Homepage: https://github.com/avkoval/avk-emacs-themes
;; Created: 14th June 2015
;; Version: 0.2
;; Keywords: theme

;;; Commentary:
;;
;; Alex V. Koval avk-daylight theme
;;
;; I needed something which would allow me working comfortably under direct sunlight.
;;
;; There are not so many high contrast themes out there. From my favourites:
;; - leuven
;; - plan9
;; - emacs default theme
;;
;; Some of those did not exist in the time I’ve created my own. I am heavy user of emacs, org-mode
;; and Python developer, so you can expect this theme to cover all the basic modes for this
;; kind of activity well.
;;

;;; Code:

(deftheme avk-daylight "White/Blue theme from AVK")

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'avk-daylight

   `(ac-candidate-face ((t (:foreground "magenta4" :background "lavender" :weight bold))))
   `(ac-selection-face ((t (:background "royalBlue4" :foreground "yellow2" :weight bold))))
   `(ahg-status-deleted-face ((default (:inherit font-lock-warning-face)) (nil nil)))
   `(ahg-status-modified-face ((t (:inherit diff-added))))
   `(ahg-status-unknown-face ((t (:foreground "gray31"))))
   `(anything-ff-directory ((t (:inherit dired-directory))))
   `(anything-header ((t (:inherit font-lock-function-name-face))))
   `(bm-face ((t (:background "OliveDrab3" :weight bold))))
   `(comint-highlight-input ((t (:inherit font-lock-keyword-face))))
   `(compilation-error ((t (:foreground "red3" :weight ultra-bold))))
   `(compilation-line-number ((t (:foreground "OrangeRed3" :weight bold))))
   `(cursor ((t (:background "#ff1493"))))
   `(custom-state ((t (:foreground "deep pink"))))
   `(custom-variable-tag ((((class color) (background dark)) (:inherit variable-pitch :foreground "DarkOrange" :weight bold)) (t (:foreground "magenta4" :weight bold))))
;   `(default ((t (:stipple nil :background "gray96" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal ))))
   `(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal ))))
   `(diff-added ((t (:foreground "black" :background "DarkSeaGreen1"))))
   `(diff-removed ((t (:foreground "maroon" :background "misty rose"))))
   `(dired-directory ((t (:inherit font-lock-function-name-face))))
   `(dired-header ((t (:foreground "blue3" :weight bold :height 1.1 :family "verdana"))))
   `(dired-marked ((t (:inherit (secondary-selection)))))
   `(dired-symlink ((t (:inherit font-lock-string-face))))
   `(django-tag-face ((t (:background "LightSteelBlue1"))) t)
   `(django-variable-face ((t (:foreground "medium blue"))) t)
   `(dropdown-list-face ((t (:inherit default :background "gray89" :foreground "black"))))
   `(dropdown-list-selection-face ((t (:inherit dropdown-list :background "#6d1717"))))
   `(ecb-analyse-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face :background "DarkSlateBlue" :foreground "white"))))
   `(ecb-source-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face :background "DeepSkyBlue" :foreground "white"))))
   `(ecb-tag-header-face ((((class color) (background dark)) (:background "SeaGreen1" :foreground "black"))))
   `(flycheck-error ((t (:background "PaleVioletRed1" :underline (:color "Red1" :style wave)))))
   `(flymake-errline ((t (:foreground "tomato" :inverse-video t))))
   `(flymake-infoline ((t (:background "gray87"))))
   `(flymake-warnline ((t  (:underline (:color "dark orange" :style wave)))))
   `(font-lock-comment-face ((t (:foreground "gray55"))))
   `(font-lock-function-name-face ((t (:foreground nil :background "khaki2" :box (:line-width 2 :color "gray94" :style released-button) :weight normal))))
   `(font-lock-keyword-face ((t (:foreground "maroon" :weight bold))))
   `(font-lock-string-face ((t (:foreground "dark blue" :slant italic))))
   `(font-lock-warning-face ((t (:foreground "dark orange"))))
   `(helm-buffer-saved-out ((t (:foreground "red"))))
   `(helm-ff-directory ((t (:inherit dired-directory))))
   `(helm-ff-executable ((t (:foreground "red4" :weight bold))))
   `(helm-ff-invalid-symlink ((t (:inherit dired-symlink :strike-through "red"))))
   `(helm-ff-symlink ((t (:inherit dired-symlink))))
   `(helm-selection ((t (:inherit hl-line :background "SlateGray1"))))   
   `(helm-source-header ((t (:inherit font-lock-function-name-face))))
   `(helm-visible-mark ((t (:foreground "lavender" :background "chartreuse4"))))
   `(highlight ((t (:background "green yellow"))))
   `(highlight-changes ((((min-colors 88) (class color)) (:background "#00254a"))))
   `(highlight-changes-delete ((((min-colors 88) (class color)) (:background "#8b6969"))))
   `(hl-line ((t (:background "SlateGray1" :inherit nil))))
   `(ido-first-match ((t (:foreground "medium blue" :weight bold))))
   `(ido-indicator ((t (:foreground "red2" :width condensed))))
   `(ido-only-match ((t (:foreground "forest green" :weight bold))))
   `(ido-subdir ((((min-colors 88) (class color)) (:weight bold :foreground nil))))
   `(isearch ((t (:background "dark orange" :foreground "black"))))
   `(jabber-chat-prompt-foreign ((t (:inherit custom-face-tag))))
   `(jabber-chat-prompt-local ((t (:inherit org-level-4))))
   `(jabber-roster-user-online ((t (:inherit font-lock-string-face))))
   `(lazy-highlight ((t (:background "chartreuse"))))
   `(linum ((t (:height 0.9  :background "gray92" :foreground "#4d4d7d" :underline nil :slant italic :weight normal))))
   `(line-number ((t (:height 0.9 :background "gray88" :foreground "black" :underline nil :slant italic :weight normal))))
   `(line-number-current-line ((t (:height 0.9 :background "#fffb9a" :foreground "black" :underline nil :slant italic :weight normal))))
   `(match ((nil (:inherit region :underline t))))
   `(message-cited-text ((((class color) (background light)) (:foreground "dark magenta")) (((class color) (background dark)) (:foreground "SandyBrown"))))
   `(message-header-name ((((class color) (background dark)) (:foreground "DarkGrey")) (((background light)) (:inherit font-lock-function-name-face))))
   `(message-header-other ((((class color) (background dark)) (:foreground "LightPink2"))))
   `(message-header-subject ((((class color) (background dark)) (:foreground "yellow2"))))
   `(message-separator ((((class color) (background dark)) (:foreground "thistle"))))
   `(minibuffer-prompt ((t (:foreground "dark cyan" :weight bold))))
   `(mode-line ((t (:background "#d0e5cc" :foreground "black" :inverse-video nil :slant normal :weight normal :box (:line-width -1 :color nil :style released-button)))))
   `(mode-line-inactive ((t (:weight light :box (:line-width -1 :color "grey75" :style nil)  :foreground "black" :background "SlateGray2" :inherit  (mode-line)))))
   `(mode-line-read-only-face ((t (:foreground "Firebrick" :weight bold))))
   `(mode-line-filename-face ((t (:foreground "dark green" :weight bold))))
   `(mode-line-folder-face ((t  (:foreground "gray30"))))
   `(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "#123a4d"))))
   `(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "#2e2e51"))))
   `(notmuch-hello-logo-background ((t (:background "#2f4f4f"))))
   `(notmuch-message-summary-face ((t (:inherit font-lock-function-name-face))))
   `(notmuch-search-count ((t (:inherit default :foreground "yellow3"))))
   `(notmuch-search-date ((t (:inherit default :foreground "SpringGreen4"))))
   `(notmuch-search-subject ((t (:foreground "dark turquoise"))))
   `(notmuch-search-unread-face ((t (:weight bold))))
   `(org-agenda-clocking ((t (:background "lavender" :foreground "medium violet red" :weight bold))) t)
   `(org-agenda-date ((t (:foreground "dark green"))) t)
   `(org-agenda-date-today ((t (:foreground "dark green" :height 1.6 :slant normal :weight bold))) t)
   `(org-agenda-date-weekend ((t (:inherit org-agenda-date :background "lemon chiffon" :weight bold))) t)
   `(org-agenda-done ((t (:foreground "dark gray" :strike-through "coral"))))
   `(org-archived ((t (:foreground "LemonChiffon4"))))
   `(org-column ((t (:inherit default))))
   `(org-column-title ((t (:foreground "dark magenta" :background "gray85" :underline t :weight bold :inherit default))))
   `(org-date ((t (:background "#fdfdfd" :foreground "slate blue" :underline t))))
   `(org-done ((t (:foreground "cornsilk4" :strike-through t :weight normal))))
   `(org-habit-alert-face ((((background dark)) (:background "gold" :foreground "red3"))))
   `(org-habit-overdue-future-face((t (:foreground "light cyan"))))
   `(org-headline-done ((((class color) (min-colors 16) (background dark) (supports :strike-through t :foreground "gray71")) nil) (((class color) (min-colors 16) (background light)) (:foreground "dim gray" :strike-through t))))
   `(org-hide ((t (:foreground "gray96"))))
   `(outline-1 ((t (:foreground "medium blue" :inherit nil))))
   `(org-level-1 ((t (:height 1.3 :foreground "slate blue"))))
   `(org-level-2 ((((class color) (min-colors 16) (background light dark)) (:foreground "dark violet" :height 1.2))))
   `(org-level-3 ((t (:height 1.1 :foreground "dark red"))))
   `(org-level-4 ((t (:foreground "dark slate blue"))))
   `(org-link ((t (:foreground "dark blue" :underline t :weight normal))))
   `(org-mode-line-clock ((t (:inherit modeline :foreground "dark blue" :slant oblique :height 1.1))) t)
   `(org-scheduled ((t (:foreground "dark magenta" :slant italic))))
   `(org-scheduled-previously ((t (:foreground "firebrick3"))))
   `(org-scheduled-today ((t (:foreground "dark blue" :slant italic))))
   `(org-agenda-structure ((t (:foreground "VioletRed4" :height 1.2 :slant italic))))
   `(org-checkbox ((t (:inherit font-lock-function-name-face))))
   `(org-tag ((t (:foreground "gray70" :weight bold))))
   `(org-todo ((t (:weight bold :box (:line-width 2 :color "grey75" :style nil) :height 1.1 :foreground "dark green" :background "azure2"))))
   `(org-upcoming-deadline ((((class color) (min-colors 88) (background dark)) (:foreground "indian red"))))
   `(org-warning ((t (:foreground "hot pink" :weight bold))))
   `(outline-2 ((t (:foreground "saddle brown"))))
   `(outline-3 ((t (:foreground "brown"))))
   `(outline-6 ((t (:foreground "royal blue"))))
   `(outline-7 ((t (:foreground "darkgoldenrod3"))))
   `(py-XXX-tag-face ((t (:background "deep sky blue" :foreground "black" :slant italic))) t)
   `(py-builtins-face ((t (:inherit font-lock-keyword-face :weight normal))) t)
   `(py-class-name-face ((t (:foreground "DeepSkyBlue3" :weight bold))) t)
   `(py-decorators-face ((t (:foreground "cyan4"))) t)
   `(py-exception-name-face ((t (:foreground "medium orchid" :slant italic))) t)
   `(py-pseudo-keyword-face ((t (:foreground "dark magenta"))) t)
   `(region ((t (:background "OliveDrab1" :foreground "black"))))
   `(rst-level-1-face ((t (:background "SlateBlue4"))) t)
   `(rst-level-2-face ((t (:background "grey20"))) t)
   `(secondary-selection ((t (:background "forest green" :foreground "white"))))
   `(sh-quoted-exec ((t (:foreground "turquoise4" :weight bold))))
   `(shadow ((t (:foreground "RosyBrown4"))))
   `(show-paren-match ((t (:background "DeepSkyBlue1" :foreground "white"))))
   `(show-paren-mismatch ((t (:background "red" :foreground "white"))))
   `(smerge-refined-change ((t (:background "moccasin"))))
   `(tabbar-default ((t (:inherit variable-pitch :background "gray75" :foreground "MidNightBlue" :family "verdana"))))
   `(tabbar-selected ((t (:inherit tabbar-default :foreground "red4" :family "verdana"))))
   `(tooltip ((((class color)) (:inherit variable-pitch :background "IndianRed1" :foreground "black"))))
   `(trailing-whitespace ((t (:background "#dae8ff"))))
   `(which-func ((((class color) (min-colors 88) (background dark)) (:foreground "dark red"))))
   `(whitespace-empty ((t (:background "thistle1"))))
   `(whitespace-line ((t (:background nil :foreground "OrangeRed4"))))
   `(whitespace-space ((((class color) (background dark)) (:foreground "gray40"))))
   `(whitespace-tab ((t (:background "gray96"))))
   `(error ((t (:foreground "red"))))
   `(whitespace-trailing ((t (:background "gray81" :weight bold))))
   `(widget-button ((t (:foreground "dark blue" :weight bold :underline (:color "gray75" :style line)))))
   `(fringe ((t (:background "#add8e6"))))
   `(highlight-indentation-face ((t (:background "gray94"))))
))

(provide-theme 'avk-daylight)


;;;###autoload
(when (and load-file-name (boundp 'custom-theme-load-path))
 (add-to-list
      'custom-theme-load-path
      (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'avk-daylight)
;;; avk-daylight-theme.el ends here
