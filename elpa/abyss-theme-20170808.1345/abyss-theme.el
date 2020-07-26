;;; abyss-theme.el --- A dark theme with contrasting colours.

;; Author: Matt Russell <matt@mgrbyte.co.uk>
;; Version: 0.7
;; Package-Version: 20170808.1345
;; Package-Commit: 18791c6e8d9cc2b4815c9f08627a2e94fc0eeb14
;; Filename: abyss-theme.el
;; Package-Requires: ((emacs "24"))
;; Keywords: theme, dark, contrasting colours
;; URL: https://github.com/mgrbyte/emacs-abyss-theme
;; License: GPL-3+

;;; Commentary:

;; A dark theme with contrasting colours for Emacs24 based on the
;; ``Lush`` theme by Andre Richter, using the same colours palette
;; as the the built-in `dichromacy' theme; intended to be suitable
;; for red/green colour blind users.

;;; Code:

(deftheme abyss
  "Dark background and contrasting colours.")

(let* ((abyss/orange "#e69f00")
       (abyss/skyblue "#56b4e9")
       (abyss/bluegreen "#009e73")
       (abyss/yellow "#f8ec59")
       (abyss/vanilla-cream "#fcfbe3")
       (abyss/blue "#0072b2")
       (abyss/vermillion "#d55e00")
       (abyss/redpurple "#cc79a7")
       (abyss/scarlet "#FF1A00")
       (abyss/bluegray "#848ea9")
       (abyss/background "#050000")
       (abyss/background2 "#0d1000")
       (abyss/foreground "#bbe0f0")
       (abyss/hl-line "#00f000")
       (abyss/magenta "#ff00ff")
       (abyss/hilite "#dd5542")
       (abyss/white "#ffffff")
       (abyss/green "#00ff00"))
  (custom-theme-set-faces
   `abyss
   `(bold ((t (:bold t))))
   `(bold-italic ((t (:bold t))))
   `(border-glyph ((t (nil))))
   `(default
      ((t (:foreground ,abyss/foreground :background ,abyss/background))))
   `(fringe ((t (:background ,abyss/background2))))
   `(buffers-tab
     ((t (:foreground ,abyss/foreground :background ,abyss/background))))
   `(font-lock-builtin-face ((t (:foreground ,abyss/vanilla-cream))));
   `(font-lock-comment-delimiter-face ((t (:foreground ,abyss/vermillion :italic t))))
   `(font-lock-comment-face ((t (:foreground ,abyss/vermillion :italic t))))
   `(font-lock-constant-face ((t (:foreground ,abyss/redpurple))))
   `(font-lock-doc-face ((t (:foreground ,abyss/orange))))
   `(font-lock-doc-string-face ((t (:foreground ,abyss/vermillion))))
   `(font-lock-string-face ((t (:foreground ,abyss/magenta))))
   `(font-lock-function-name-face ((t (:foreground ,abyss/skyblue))))
   `(font-lock-keyword-face ((t (:foreground ,abyss/yellow))))
   `(font-lock-preprocessor-face ((t (:foreground ,abyss/blue))))
   `(font-lock-type-face ((t (:foreground ,abyss/skyblue))))
   `(font-lock-variable-name-face ((t (:foreground ,abyss/green ))))
   `(font-lock-negation-char-face ((t (:foreground ,abyss/redpurple))))
   `(font-lock-warning-face ((t (:foreground ,abyss/scarlet :bold t))))
   `(gui-element
        ((t (:foreground ,abyss/background2 :background ,abyss/foreground))))
   `(mode-line
     ((t (:foreground ,abyss/background2 :background ,abyss/skyblue :box nil))))
   `(mode-line-highlight
     ((t (:foreground ,abyss/vanilla-cream :box nil))))
   `(mode-line-inactive
     ((t (:foreground ,abyss/redpurple :background ,abyss/background2 :box nil))))
   `(text-cursor
        ((t (:foreground ,abyss/foreground :background ,abyss/background))))
   `(region
     ((t (:foreground ,abyss/background :background ,abyss/redpurple))))
   `(italic ((t (nil))))
   `(left-margin ((t (nil))))
   `(toolbar ((t (nil))))
   `(whitespace-tab ((t (:background ,abyss/background))))
   `(whitespace-line ((t (:foreground ,abyss/white :background ,abyss/hilite))))
   `(magit-item-highlight ((t (:inherit region)))))
  `(underline ((nil (:underline nil)))))

;;;###autoload
(when load-file-name
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory (file-name-directory load-file-name))))

;;;###autoload
(defun abyss-theme()
  "Load abyss-theme."
  (interactive)
  (load-theme 'abyss t))

(provide-theme 'abyss)
;;; abyss-theme.el ends here
