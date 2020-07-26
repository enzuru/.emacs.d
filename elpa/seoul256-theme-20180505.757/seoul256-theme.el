;;; seoul256-theme.el --- Low-contrast color scheme based on Seoul Colors.

;; Copyright (C) 2016-2018 Anand Iyer

;; Author: Anand Iyer <anand.ucb@gmail.com>
;; Maintainer: Anand Iyer <anand.ucb@gmail.com>
;; URL: http://github.com/anandpiyer/seoul256-emacs
;; Package-Version: 20180505.757
;; Package-Commit: d28a9de73a5ffb1a1c9492db75a5c1efe5e9815f
;; Created: 21 October 2016
;; Modified: 05 May 2018
;; Version: 0.3.7
;; Keywords: theme
;; Package-Requires: ((emacs "24.3"))

;;; MIT License
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;;; Commentary:

;; A port of the Seoul256 color scheme to Emacs.
;;
;; This port contains some modifications, partly due to the differences
;; ih customization flexibility offered by Emacs and Vim.  However, I have
;; tried to stay true to the original as much as possible.

;;; Credits:

;; Junegunn Choi created the original theme for Vim on which this port is based.

;;; Code:

(require 'cl-lib)

(when (version< emacs-version "24.3")
  (error "Requires Emacs 24.3 or later"))

(defgroup seoul256 nil
  "seoul256 theme"
  :group 'faces)

(defcustom seoul256-background 237
  "Background color for seoul256 scheme."
  :type 'number
  :group 'seoul256)

(defcustom seoul256-alternate-background 253
  "Alternate background color for seoul256 scheme."
  :type 'number
  :group 'seoul256)

(deftheme seoul256 "Low-contrast color scheme based on Seoul Colors")

(defvar seoul256-default-colors-alist
  '((16 . "#000000")  (17 . "#00005F")  (18 . "#000087")
    (19 . "#0000AF")  (20 . "#0000D7")  (21 . "#0000FF")
    (22 . "#006F00")  (23 . "#007173")  (24 . "#007299")
    (25 . "#0074BE")  (26 . "#005FD7")  (27 . "#005FFF")
    (28 . "#008700")  (29 . "#00875F")  (30 . "#009799")
    (31 . "#0099BD")  (32 . "#0087D7")  (33 . "#0087FF")
    (34 . "#00AF00")  (35 . "#00AF5F")  (36 . "#00AF87")
    (37 . "#00AFAF")  (38 . "#00BDDF")  (39 . "#00AFFF")
    (40 . "#00D700")  (41 . "#00D75F")  (42 . "#00D787")
    (43 . "#00D7AF")  (44 . "#00D7D7")  (45 . "#00D7FF")
    (46 . "#00FF00")  (47 . "#00FF5F")  (48 . "#00FF87")
    (49 . "#00FFAF")  (50 . "#00FFD7")  (51 . "#00FFFF")
    (52 . "#730B00")  (53 . "#5F005F")  (54 . "#5F0087")
    (55 . "#5F00AF")  (56 . "#5F00D7")  (57 . "#5F00FF")
    (58 . "#727100")  (59 . "#727272")  (60 . "#5F5F87")
    (61 . "#5F5FAF")  (62 . "#5F5FD7")  (63 . "#5F5FFF")
    (64 . "#5F8700")  (65 . "#719872")  (66 . "#719899")
    (67 . "#7299BC")  (68 . "#719CDF")  (69 . "#5F87FF")
    (70 . "#5FAF00")  (71 . "#5FAF5F")  (72 . "#5FAF87")
    (73 . "#6FBCBD")  (74 . "#70BDDF")  (75 . "#5FAFFF")
    (76 . "#5FD700")  (77 . "#5FD75F")  (78 . "#5FD787")
    (79 . "#5FD7AF")  (80 . "#5FD7D7")  (81 . "#5FD7FF")
    (82 . "#5FFF00")  (83 . "#5FFF5F")  (84 . "#5FFF87")
    (85 . "#5FFFAF")  (86 . "#5FFFD7")  (87 . "#5FFFFF")
    (88 . "#9B1300")  (89 . "#9B1D72")  (90 . "#870087")
    (91 . "#8700AF")  (92 . "#8700D7")  (93 . "#8700FF")
    (94 . "#9A7200")  (95 . "#9A7372")  (96 . "#9A7599")
    (97 . "#875FAF")  (98 . "#875FD7")  (99 . "#875FFF")
    (100 . "#878700") (101 . "#999872") (102 . "#878787")
    (103 . "#999ABD") (104 . "#8787D7") (105 . "#8787FF")
    (106 . "#87AF00") (107 . "#87AF5F") (108 . "#98BC99")
    (109 . "#98BCBD") (110 . "#98BEDE") (111 . "#87AFFF")
    (112 . "#87D700") (113 . "#87D75F") (114 . "#87D787")
    (115 . "#87D7AF") (116 . "#97DDDF") (117 . "#87D7FF")
    (118 . "#87FF00") (119 . "#87FF5F") (120 . "#87FF87")
    (121 . "#87FFAF") (122 . "#87FFD7") (123 . "#87FFFF")
    (124 . "#AF0000") (125 . "#BF2172") (126 . "#AF0087")
    (127 . "#AF00AF") (128 . "#AF00D7") (129 . "#AF00FF")
    (130 . "#AF5F00") (131 . "#BE7572") (132 . "#AF5F87")
    (133 . "#AF5FAF") (134 . "#AF5FD7") (135 . "#AF5FFF")
    (136 . "#AF8700") (137 . "#BE9873") (138 . "#AF8787")
    (139 . "#AF87AF") (140 . "#AF87D7") (141 . "#AF87FF")
    (142 . "#AFAF00") (143 . "#BDBB72") (144 . "#BDBC98")
    (145 . "#BDBDBD") (146 . "#AFAFD7") (147 . "#AFAFFF")
    (148 . "#AFD700") (149 . "#AFD75F") (150 . "#AFD787")
    (151 . "#BCDDBD") (152 . "#BCDEDE") (153 . "#BCE0FF")
    (154 . "#AFFF00") (155 . "#AFFF5F") (156 . "#AFFF87")
    (157 . "#AFFFAF") (158 . "#AFFFD7") (159 . "#AFFFFF")
    (160 . "#D70000") (161 . "#E12672") (162 . "#D70087")
    (163 . "#D700AF") (164 . "#D700D7") (165 . "#D700FF")
    (166 . "#D75F00") (167 . "#D75F5F") (168 . "#E17899")
    (169 . "#D75FAF") (170 . "#D75FD7") (171 . "#D75FFF")
    (172 . "#D78700") (173 . "#E19972") (174 . "#E09B99")
    (175 . "#D787AF") (176 . "#D787D7") (177 . "#D787FF")
    (178 . "#D7AF00") (179 . "#DFBC72") (180 . "#D7AF87")
    (181 . "#E0BEBC") (182 . "#D7AFD7") (183 . "#D7AFFF")
    (184 . "#DEDC00") (185 . "#D7D75F") (186 . "#DEDD99")
    (187 . "#DFDEBD") (188 . "#D7D7D7") (189 . "#DFDFFF")
    (190 . "#D7FF00") (191 . "#D7FF5F") (192 . "#D7FF87")
    (193 . "#D7FFAF") (194 . "#D7FFD7") (195 . "#D7FFFF")
    (196 . "#FF0000") (197 . "#FF005F") (198 . "#FF0087")
    (199 . "#FF00AF") (200 . "#FF00D7") (201 . "#FF00FF")
    (202 . "#FF5F00") (203 . "#FF5F5F") (204 . "#FF5F87")
    (205 . "#FF5FAF") (206 . "#FF5FD7") (207 . "#FF5FFF")
    (208 . "#FF8700") (209 . "#FF875F") (210 . "#FF8787")
    (211 . "#FF87AF") (212 . "#FF87D7") (213 . "#FF87FF")
    (214 . "#FFAF00") (215 . "#FFAF5F") (216 . "#FFBD98")
    (217 . "#FFBFBD") (218 . "#FFC0DE") (219 . "#FFAFFF")
    (220 . "#FFDD00") (221 . "#FFD75F") (222 . "#FFDE99")
    (223 . "#FFD7AF") (224 . "#FFDFDF") (225 . "#FFD7FF")
    (226 . "#FFFF00") (227 . "#FFFF5F") (228 . "#FFFF87")
    (229 . "#FFFFAF") (230 . "#FFFFDF") (231 . "#FFFFFF")
    (232 . "#060606") (233 . "#171717") (234 . "#252525")
    (235 . "#333233") (236 . "#3F3F3F") (237 . "#4B4B4B")
    (238 . "#565656") (239 . "#616161") (240 . "#6B6B6B")
    (241 . "#757575") (242 . "#6C6C6C") (243 . "#767676")
    (244 . "#808080") (245 . "#8A8A8A") (246 . "#949494")
    (247 . "#9E9E9E") (248 . "#A8A8A8") (249 . "#BFBFBF")
    (250 . "#C8C8C8") (251 . "#D1D0D1") (252 . "#D9D9D9")
    (253 . "#E1E1E1") (254 . "#E9E9E9") (255 . "#F1F1F1")))

(defvar seoul256-override-colors-alist
  '()
  "Use this alist to override the theme's default colors.")

(defvar seoul256-colors-alist
  (append seoul256-override-colors-alist seoul256-default-colors-alist))

(defvar seoul256-current-bg nil
  "Current background used by seoul256 theme.")

(defun seoul256-apply (theme style dark-fg light-fg dark-bg light-bg)
  "Apply theme THEME, a STYLE variant of seoul256 theme using DARK-FG, LIGHT-FG, DARK-BG and LIGHT-BG as main colors."
  (cl-flet ((hex (dark light)
                 (let ((color-id dark))
                   (when (string= style "light")
                     (setq color-id light))
                   (cdr (assoc color-id seoul256-colors-alist)))))

    (custom-theme-set-faces
     theme

     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;;;; in-built
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;; basic ui
     '(button                       ((t (:underline t))))
     `(cursor                       ((t (:background ,(hex (- light-bg 1) 95)))))
     `(default                      ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(fringe                       ((t (:inherit default))))
     `(header-line                  ((t (:foreground ,(hex 256 16)))))
     `(highlight                    ((t (:foreground ,(hex (+ dark-bg 1) 238) :background ,(hex 220 220)))))
     `(hl-line                      ((t (:background ,(hex (- dark-bg 1) (- light-bg 1))))))
     `(link                         ((t (:foreground ,(hex 73 23)))))
     `(link-visited                 ((t (:foreground ,(hex 72 22)))))
     `(match                        ((t (:foreground ,(hex dark-fg 255) :background ,(hex 24 74) :weight bold))))
     `(minibuffer-prompt            ((t (:foreground ,(hex 74 24) :weight bold))))
     `(region                       ((t (:background ,(hex 23 152)))))

     ;; font-lock
     `(font-lock-builtin-face            ((t (:foreground ,(hex 187 58)))))
     `(font-lock-comment-delimiter-face  ((t (:foreground ,(hex 65 65)))))
     `(font-lock-comment-face            ((t (:foreground ,(hex 65 65)))))
     `(font-lock-constant-face           ((t (:foreground ,(hex 216 173)))))
     `(font-lock-doc-face                ((t (:inherit font-lock-string-face))))
     `(font-lock-function-name-face      ((t (:inherit font-lock-builtin-face))))
     `(font-lock-keyword-face            ((t (:foreground ,(hex 108 66)))))
     `(font-lock-preprocessor-face       ((t (:foreground ,(hex 143 58)))))
     `(font-lock-string-face             ((t (:foreground ,(hex 109 30)))))
     `(font-lock-type-face               ((t (:foreground ,(hex 179 94)))))
     `(font-lock-variable-name-face      ((t (:foreground ,(hex 217 96)))))
     `(font-lock-warning-face            ((t (:foreground ,(hex 179 88)))))

     ;; font-latex
     `(font-latex-bold-face              ((t (:inherit bold))))
     `(font-latex-string-face            ((t (:inherit font-lock-string-face))))
     `(font-latex-italic-face            ((t (:foreground ,(hex 217 96) :slant italic))))
     `(font-latex-sectioning-5-face      ((t (:foreground ,(hex 181 88)))))

     ;; ido-mode
     `(ido-first-match  ((t (:inherit isearch))))

     ;; isearch
     `(isearch         ((t (:foreground ,(hex (+ dark-bg 1) 238) :background ,(hex 220 220) :weight bold))))
     `(lazy-highlight  ((t (:inherit match))))
     `(isearch-fail    ((t (:background ,(hex 196 196) :foreground ,(hex (+ dark-bg 3) 253)))))

     ;; line number
     `(line-number                 ((t (:foreground ,(hex 101 101) :background ,(hex (+ dark-bg 1) (- light-bg 2))))))
     `(line-number-current-line    ((t (:foreground ,(hex 131 131) :background ,(hex (- dark-bg 1) (- light-bg 1))))))

     ;; linum
     `(linum    ((t (:inherit line-number))))

     ;; mode-line
     `(mode-line            ((t (:foreground ,(hex 187 187) :background ,(hex 95 95)))))
     `(mode-line-buffer-id  ((t (:foreground ,(hex 230 230)))))
     `(mode-line-emphasis   ((t (:foreground ,(hex 256 256) :weight bold))))
     `(mode-line-highlight  ((t (:inherit highlight))))
     `(mode-line-inactive   ((t (:foreground ,(hex (+ dark-bg 10) (- light-bg 10)) :background ,(hex (+ dark-bg 2) (- light-bg 2) )))))

     ;; show-paren
     `(show-paren-match     ((t (:foreground ,(hex 226 200) :background ,(hex (+ dark-bg 3) (- light-bg 3)) :weight bold))))
     `(show-paren-mismatch  ((t (:foreground ,(hex 196 196) :inherit unspecified :strike-through t :weight bold))))

     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;;;; package-specific
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;; anzu
     `(anzu-mode-line    ((t (:inherit mode-line-highlight))))

     ;; company
     `(company-preview                       ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(company-preview-common                ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(company-preview-search                ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(company-scrollbar-bg                  ((t (:background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(company-scrollbar-fg                  ((t (:background ,(hex (- dark-bg 2) (- light-bg 6))))))
     `(company-tooltip                       ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(company-tooltip-annotation            ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(company-tooltip-annotation-selection  ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(company-tooltip-common                ((t (:foreground ,(hex 226 32)))))
     `(company-tooltip-common-selection      ((t (:inherit company-tooltip-common))))
     `(company-tooltip-mouse                 ((t (:foreground ,(hex 226 32)))))
     `(company-tooltip-search                ((t (:foreground ,(hex dark-fg light-fg) :background ,(hex dark-bg light-bg)))))
     `(company-tooltip-search-selection      ((t (:inherit company-tooltip-search))))
     `(company-tooltip-selection             ((t (:foreground ,(hex 226 32) :background ,(hex 23 152)))))

     ;; git-gutter
     `(git-gutter:added     ((t (:foreground ,(hex 108 65) :background ,(hex (+ dark-bg 1) (- light-bg 2))))))
     `(git-gutter:deleted   ((t (:foreground ,(hex 161 161) :background ,(hex (+ dark-bg 1) (- light-bg 2))))))
     `(git-gutter:modified  ((t (:foreground ,(hex 68 68) :background ,(hex (+ dark-bg 1) (- light-bg 2))))))

     ;; helm
     `(helm-buffer-directory    ((t (:foreground ,(hex 187 95)))))
     `(helm-buffer-file         ((t (:foreground ,(hex dark-fg light-fg)))))
     `(helm-ff-directory        ((t (:inherit helm-buffer-directory))))
     `(helm-ff-file             ((t (:inherit helm-buffer-file))))
     `(helm-match                 ((t (:foreground ,(hex 74 24) :underline t))))
     `(helm-source-header         ((t (:inherit hl-line :foreground ,(hex 95 95) :slant italic :weight bold))))
     `(helm-selection             ((t (:inherit match))))

     ;; highlight-indent-guides
     `(highlight-indent-guides-odd-face  ((t (:background ,(hex (- dark-bg 1) (+ light-bg 1))))))
     `(highlight-indent-guides-even-face ((t (:background ,(hex (+ dark-bg 1) (- light-bg 1))))))

     ;; ivy
     `(ivy-current-match            ((t (:inherit match))))
     `(ivy-minibuffer-match-face-1  ((t (:foreground ,(hex 74 24) :underline t))))
     `(ivy-minibuffer-match-face-2  ((t (:inherit ivy-minibuffer-match-face-1))))
     `(ivy-minibuffer-match-face-3  ((t (:inherit ivy-minibuffer-match-face-1))))
     `(ivy-minibuffer-match-face-4  ((t (:inherit ivy-minibuffer-match-face-1))))

     ;; linum-relative
     `(linum-relative-current-face  ((t (:inherit line-number-current-line))))

     ;; nlinum
     `(nlinum-current-line  ((t (:inherit line-number-current-line))))

     ;; nlinum-hl
     `(nlinum-hl-face ((t (:inherit line-number-current-line))))

     ;; nlinum-relative
     `(nlinum-relative-current-face ((t (:inherit line-number-current-line))))

     ;; powerline
     `(powerline-active0     ((t (:inherit mode-number))))
     `(powerline-active1     ((t (:inherit line-number))))
     `(powerline-active2     ((t (:inherit default))))
     `(powerline-inactive1   ((t (:inherit mode-line-inactive))))
     `(powerline-inactive2   ((t (:inherit powerline-inactive1))))
     `(powerline-inactive3   ((t (:inherit powerline-inactive1))))

     ;; rainbow-delimiters
     `(rainbow-delimiters-unmatched-face ((t (:inherit show-paren-mismatch))))
     `(rainbow-delimiters-mismatched-face (( t (:inherit 'rainbow-delimiters-unmatched-face))))

     ;; smart-mode-line
     `(sml/filename ((t (:foreground ,(hex 187 230) :weight bold))))

     ;; smart-parens
     `(sp-pair-overlay-face        ((t (:inherit region))))
     `(sp-show-pair-match-face     ((t (:inherit show-paren-match))))
     `(sp-show-pair-mismatch-face  ((t (:inherit show-paren-mismatch))))

     ;; solaire-mode
     `(solaire-default-face  ((t (:background ,(hex (- dark-bg 1) (- light-bg 1))))))
     `(solaire-hl-line-face  ((t (:background ,(hex (- dark-bg 2) (- light-bg 2))))))

     ;; tabbar
     `(tabbar-default       ((t (:background ,(hex (+ dark-bg 2) (- light-bg 2))))))
     `(tabbar-button        ((t (:inherit tabbar-default))))
     `(tabbar-selected      ((t (:foreground ,(hex 23 66) :background ,(hex 187 187)))))
     `(tabbar-unselected    ((t (:foreground ,(hex (+ dark-bg 4) (- light-bg 4)) :background ,(hex (+ dark-bg 12) (- light-bg 12))) ))) )))

(defun seoul256-create (theme background)
  "Create a seoul256 theme `THEME' using a given `BACKGROUND'."
  (let ((dark-bg 237)
        (light-bg 253)
        (dark-fg 252)
        (light-fg 239)
        (style "dark"))

    (when (and (>= background 233)
               (<= background 239))
      (setq style "dark"
            dark-bg background))

    (when (and (>= background 252)
               (<= background 256))
      (setq style "light"
            light-bg background))

    (if (string= style "dark")
        (setq seoul256-current-bg dark-bg)
      (setq seoul256-current-bg light-bg))

    (seoul256-apply theme style dark-fg light-fg dark-bg light-bg)))

(defun seoul256-switch-background ()
  "Switch the background of the current seoul256 theme."
  (interactive)
  (let ((diff1 0)
        (diff2 0))
    (setq diff1 (abs (- seoul256-current-bg seoul256-alternate-background))
          diff2 (abs (- seoul256-current-bg seoul256-background)))
    (if (< diff1 diff2)
      (seoul256-create 'seoul256 seoul256-background)
    (seoul256-create 'seoul256 seoul256-alternate-background))))

(defun seoul256-darken-background ()
  "Darken current background."
  (interactive)
  (when (or (and (> seoul256-current-bg 233)
                 (<= seoul256-current-bg 239))
            (and (> seoul256-current-bg 252)
                 (<= seoul256-current-bg 256)))
    (seoul256-create 'seoul256 (- seoul256-current-bg 1))))

(defun seoul256-brighten-background ()
  "Brighten current background."
  (interactive)
  (when (or (and (>= seoul256-current-bg 233)
                 (< seoul256-current-bg 239))
            (and (>= seoul256-current-bg 252)
                 (< seoul256-current-bg 256)))
    (seoul256-create 'seoul256 (+ 1 seoul256-current-bg))))

(seoul256-create 'seoul256 seoul256-background)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'seoul256)

;;; seoul256-theme.el ends here
