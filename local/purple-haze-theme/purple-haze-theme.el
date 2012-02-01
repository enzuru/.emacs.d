;;; purple-haze-theme.el --- an overtly purple color theme for Emacs24.
;;
;;; Author: Jason Milkins <jasonm23@gmail.com>
;;; Url: https://github.com/jasonm23/emacs-purple-haze-theme
;;; Version: 20130930.0036
;;; Package-Requires: ((emacs "24.0"))

;;; Changelog:
;; 20130930.0036 : Bug fix
;;
;; 20130906.1159 : Fix commentary block
;;
;; 20130905.2211 : Fix rainbow mode invoke
;;
;; 20130905.2200 : Updated headers - fixed borkage
;;
;; 20130905.2140 : Add support for flymake, git-gutter, diff, magit and
;;            compilation mode (implicitly *grep* buffers) Updated
;;            iSearch/Lazy Highlight/Match, also added error and warn
;;            as explicit face themes. Rainbow Delimiters also
;;            updated.
;;
;; 0.0.7    : switch on rainbow-mode when editing
;;
;; 0.0.6    : changed powerline/main-line colors
;;
;; 0.0.5    : add support for powerline and main-line
;;
;; 0.0.4    : auto add to custom load path on init
;;
;; 0.0.3    : initial public version

;;; Licence:
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, version 3 of the License.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.
;;
;; This file is not a part of Emacs

;;; Commentary:
;; Purple haze is an overtly purple theme, with support for flymake,
;; git-gutter, magit, diff, cua, isearch, font-lock and a little more.
;; Listening to All along the watchtower is not mandatory, although
;; the Jimi Hendrix version is recommended.

(deftheme purple-haze
  "purple-haze-theme By: Jason Milkins - emacsfodder.github.com")

(custom-theme-set-variables
 'purple-haze
 '(main-line-color1 "#191919")
 '(main-line-color2 "#111111")
 '(powerline-color1 "#191919")
 '(powerline-color2 "#111111")
 '(fringe-mode 6 nil (fringe))
 '(linum-format " %7d ")
 )

(custom-theme-set-faces
 'purple-haze

 '(default
    (
     (((class color) (min-colors 88))       (:foreground "#fff" :background "#000"))
     (t (:foreground "#fff" :background "#120F14"))
     )
    )

 '(fixed-pitch
   ((t (:family "Monospace"))))

 '(variable-pitch
   ((t (:family "Sans Serif"))))

 '(escape-glyph ;; Things like ^[ or other control chars.
   ((t (:foreground "#d96e26" :background "#211d3c"))))

 ;; Line Numbers (linum-mode)
 '(linum
   (
    (((class color) (min-colors 88))  (:background "#000000" :foreground "#403047"))
    (t (:background "#151019" :foreground "#403047" :box nil :height 100))))

 ;; Margin Fringes
 '(fringe
   (
   (((class color) (min-colors 88))  (:background "#111111" :foreground "#506080"))
   (t ( :background "#201520" :Foreground "#506080" ))))

 ;; Mode-line / status line
 '(mode-line
   (
    (((class color) (min-colors 88))  (:background "#222222" :foreground "#8c86e4"))
    (t (:background "#2b283d" :box nil :foreground "#8c86e4" :height 85))))

 '(mode-line-inactive
   (
    (((class color) (min-colors 88))  (:background "#111111" :foreground "#000000"))
    (t (:weight light :box nil :background "#202339" :foreground "#000000" :inherit (mode-line)))))

 '(mode-line-emphasis ((t (:weight bold))))

 '(mode-line-highlight ((t (:box nil (t (:inherit (highlight)))))))

 '(mode-line-buffer-id ((t (:weight bold :box nil))))

 ;; Cursor
 '(cursor ((t (:foreground "#ffffff" :background "#d96e26"))))

 '(error ((t (:foreground "#cc3333" ))))
 '(warning ((t (:foreground "#d96e26"))))

'(flymake-errline
   ((t (:underline "#cc3333" :foreground nil :background nil ))))
'(flymake-infoline
   ((t (:underline "DarkGreen" :foreground nil :background nil))))
'(flymake-warnline
   ((t (:underline "#FF6600" :foreground nil :background nil))))

'(git-gutter:added
  ((t (:foreground "#609f60" :bold t))))
'(git-gutter:modified
  ((t (:foreground "#E09aF0" :bold t))))
'(git-gutter:deleted
  ((t (:foreground "#cc3333" :bold t))))

'(magit-item-highlight ((t (:foreground "white" :background "#514b6c"))))

'(cua-rectangle ((t (:background "#514b6c"))))

'(diff-added                                ((t (:background "#132013"))))
'(diff-removed                              ((t (:background "#290a0a"))))
'(diff-file-header                          ((t (:background "#362145"))))
'(diff-context                              ((t (:foreground "#E0E4CC"))))
'(diff-hunk-header                          ((t (:background "#242130"))))

'(compilation-info  ((t (:foreground "#a09aF0"))))

 ;; Minibuffer
 '(minibuffer-prompt
   ((t (:weight bold :foreground "#606a92"))))

 '(minibuffer-message
   ((t (:foreground "#ffffff"))))

 ;; Region
 '(region
   ((t (:background "#1F102f"))))

 ;; Secondary region
 '(secondary-selection
   ((((class color) (min-colors 88) (background dark)) (:background "#444083"))))

 ;; font-lock - syntax
 '(font-lock-builtin-face              ((t (:foreground "#606590"))))
 '(font-lock-comment-face              ((t (:foreground "#505f89"))))
 '(font-lock-comment-delimiter-face    ((t (:foreground "#7078a2" ))))
 '(font-lock-doc-face                  ((t (:inherit (font-lock-string-face)))))
 '(font-lock-function-name-face        ((t (:foreground "#8083be"))))
 '(font-lock-keyword-face              ((t (:foreground "#aa8da7"))))
 '(font-lock-negation-char-face        ((t nil)))
 '(font-lock-preprocessor-face         ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face               ((t (:foreground "#a0adee"))))
 '(font-lock-constant-face             ((t (:foreground "#9a99e7"))))
 '(font-lock-type-face                 ((t (:foreground "#5f5e8a"))))
 '(font-lock-variable-name-face        ((t (:foreground "#8e8eb8"))))
 '(font-lock-warning-face              ((t (:weight bold :foreground "#FF0000"))))

 ;; Hightlight
 '(highlight
   ((((class color) (min-colors 88) (background light)) (:background "#503453"))
    (((class color) (min-colors 88) (background dark)) (:background "#503450"))))

 '(shadow
   ((((class color grayscale) (min-colors 88) (background light)) (:foreground "#999999"))
    (((class color grayscale) (min-colors 88) (background dark)) (:foreground "#999999"))))

 '(trailing-whitespace
   ((((class color) (background light)) (:background "#ff0000"))
    (((class color) (background dark)) (:background "#ff0000")) (t (:inverse-video t))))

 '(link (
         (((class color) (min-colors 88) (background light)) (:underline t :foreground "#f0b7f0"))
         (((class color) (background light)) (:underline t :foreground "#a044a0"))
         (((class color) (min-colors 88) (background dark))  (:underline t :foreground "#a069aa"))
         (((class color) (background dark))  (:underline t :foreground "#a069aa")) (t (:inherit (underline)))))

 '(link-visited ((default (:inherit (link)))
                 (((class color) (background light)) (:inherit (link)))
                 (((class color) (background dark)) (:inherit (link)))))

 '(button ((t (:inherit (link)))))

 '(tooltip ((t (:foreground "#FFFFFF"  :background "#5f5e8a" ))))

 '(isearch
   ((((class color) (min-colors 88) (background light)) (:foreground "white" :background "#5533AA"))
    (((class color) (min-colors 88) (background dark)) (:foreground "white" :background "#5533AA"))
    (t (:inverse-video t))))

 '(isearch-fail
   ((((class color) (min-colors 88) (background light)) (:foreground "#000000" :background "#ffaaaa"))
    (((class color) (min-colors 88) (background dark)) (:foreground "#000000" :background "#880000"))
    (((class color grayscale)) (:foreground "#888888"))
    (t (:inverse-video t))))

 '(lazy-highlight
   ((((class color) (min-colors 88) (background light)) (:foreground "white" :background "#331144"))
    (((class color) (min-colors 88) (background dark)) (:foreground "#CCCCCC" :background "#331144"))))

 '(match
   ((((class color) (min-colors 88) (background light)) (:foreground "black" :background "#5c2e7a"))
    (((class color) (min-colors 88) (background dark)) (:foreground "white"  :background "#5c2e7a"))
    (((type tty) (class mono)) (:inverse-video t))
    (t (:background "#888888"))))

 '(next-error ((t (:inherit (region)))))

 '(query-replace ((t (:inherit (isearch)))))

 )

;; Rainbow delimiters
(defun purple-haze-rainbow-delim-set-face ()
  (set-face-attribute 'rainbow-delimiters-depth-1-face   nil :foreground "#a9f" )
  (set-face-attribute 'rainbow-delimiters-depth-2-face   nil :foreground "#959" )
  (set-face-attribute 'rainbow-delimiters-depth-3-face   nil :foreground "#535" )
  (set-face-attribute 'rainbow-delimiters-depth-4-face   nil :foreground "#639" )
  (set-face-attribute 'rainbow-delimiters-depth-5-face   nil :foreground "#636" )
  (set-face-attribute 'rainbow-delimiters-depth-6-face   nil :foreground "#639" )
  (set-face-attribute 'rainbow-delimiters-depth-7-face   nil :foreground "#424" )
  (set-face-attribute 'rainbow-delimiters-depth-8-face   nil :foreground "#646" )
  (set-face-attribute 'rainbow-delimiters-depth-9-face   nil :foreground "#919" )
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil :foreground "#F00" ))

(eval-after-load "rainbow-delimiters" '(purple-haze-rainbow-delim-set-face))

;; Add to custom-theme-load-path
;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


(provide-theme 'purple-haze)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; purple-haze-theme.el ends here
