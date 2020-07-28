;;; gotham-theme.el --- A very dark Emacs color theme.

;; Copyright (C) 2014 Vasilij Schneidermann <mail@vasilij.de>

;; Author: Vasilij Schneidermann <mail@vasilij.de>
;; URL: https://depp.brause.cc/gotham-theme
;; Package-Version: 20200506.1250
;; Package-Commit: 0e5965f897c8c976d6b2ca2471dec0dec9b29bbb
;; Version: 1.1.8

;; This file is NOT part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; A port of the Gotham theme for Vim to Emacs 24 that uses the new
;; theming support.

;;; Credits:

;; Andrea Leopardi created the original Vim theme on which this port
;; is based, it can be found under
;; <https://github.com/whatyouhide/vim-gotham>

;;; Code:

(defgroup gotham nil
  "A very dark Emacs theme"
  :group 'themes
  :prefix "gotham-")

(deftheme gotham "The Gotham color theme")

(define-obsolete-variable-alias 'gotham-tty-extended-palette
  'gotham-tty-256-colors "1.1.6")
(defcustom gotham-tty-256-colors nil
  "Use the regular 256-color palette in the terminal?
When t, assume a regular 256-color palette, otherwise assume a
customized 16-color palette."
  :type '(boolean (const :tag "16 colors" nil)
                  (const :tag "256 colors" t))
  :group 'gotham)

(defvar gotham-color-alist
  `((base0   "#0c1014" ,(if gotham-tty-256-colors "color-232" "black"))
    (base1   "#11151c" ,(if gotham-tty-256-colors "color-233" "brightblack"))
    (base2   "#091f2e" ,(if gotham-tty-256-colors "color-17"  "brightgreen"))
    (base3   "#0a3749" ,(if gotham-tty-256-colors "color-18"  "brightblue"))
    (base4   "#245361" ,(if gotham-tty-256-colors "color-24"  "brightyellow"))
    (base5   "#599cab" ,(if gotham-tty-256-colors "color-81"  "brightcyan"))
    (base6   "#99d1ce" ,(if gotham-tty-256-colors "color-122" "white"))
    (base7   "#d3ebe9" ,(if gotham-tty-256-colors "color-194" "brightwhite"))

    (red     "#c23127" ,(if gotham-tty-256-colors "color-124" "red"))
    (orange  "#d26937" ,(if gotham-tty-256-colors "color-166" "brightred"))
    (yellow  "#edb443" ,(if gotham-tty-256-colors "color-214" "yellow"))
    (magenta "#888ca6" ,(if gotham-tty-256-colors "color-67"  "brightmagenta"))
    (violet  "#4e5166" ,(if gotham-tty-256-colors "color-60"  "magenta"))
    (blue    "#195466" ,(if gotham-tty-256-colors "color-24"  "blue"))
    (cyan    "#33859e" ,(if gotham-tty-256-colors "color-44"  "cyan"))
    (green   "#2aa889" ,(if gotham-tty-256-colors "color-78"  "green")))
  "List of colors the theme consists of.")

(defun gotham-set-faces (faces)
  "Helper function that sets the faces of the theme to a list of FACES.
See `gotham-transform-face' for the transformation, see
`gotham-transform-spec' for the rules."
  (apply #'custom-theme-set-faces 'gotham
         (mapcar #'gotham-transform-face faces)))

(defun gotham-transform-face (face)
  "Helper function that transforms a FACE to all variants.
FACE is a list where the first element is the name of the
affected face and the remaining elements specify the face
attributes which are transformed into face attributes for both
graphical and terminal displays.  See `gotham-transform-spec' for
the rules that are applied to the face attributes."
  (let* ((name (car face))
         (spec (cdr face))
         (graphic-spec (gotham-transform-spec spec 'graphic))
         (tty-spec (gotham-transform-spec spec 'tty)))
    `(,name ((((type graphic)) ,@graphic-spec)
             (((type tty)) ,@tty-spec)))))

(defun gotham-transform-spec (spec display)
  "Helper function that transforms SPEC for DISPLAY.
DISPLAY is either 'graphic or 'tty, SPEC is a property list where
the values are substituted with colors from `gotham-color-alist'
depending on DISPLAY for keys which are either :foreground or
:background.  All other key-value combinations remain unchanged."
  (let (output)
    (while spec
      (let* ((key (car spec))
             (value (cadr spec))
             (index (cond ((eq display 'graphic) 1)
                          ((eq display 'tty) 2)))
             (color (nth index (assoc value gotham-color-alist))))
        (cond
         ((and (memq key '(:box :underline)) (listp value))
          (setq output (append output
                               (list key (gotham-transform-spec value display)))))
         ((and (memq key '(:foreground :background :underline :overline :color))
               color)
          (setq output (append output (list key color))))
         (t (setq output (append output (list key value))))))
      (setq spec (cddr spec)))
    output))

(gotham-set-faces
 '((default :foreground base6 :background base0)
   (button :foreground base4 :box t)
   (shadow :foreground base4)
   (highlight :background base2)
   (link :foreground orange :underline t)
   (link-visited :foreground yellow)
   (cursor :background base6)
   (region :foreground unspecified :background base3)
   (secondary-selection :foreground unspecified :background violet)
   (linum :foreground base4 :background base1)
   (fringe :foreground base6 :background base1)
   (vertical-border :foreground base4)
   (tooltip :foreground base6 :background base0)
   (trailing-whitespace :background red)

   ;; font-lock
   (escape-glyph :foreground orange :weight bold)
   (font-lock-builtin-face :foreground orange)
   (font-lock-comment-face :foreground base4)
   (font-lock-comment-delimiter-face :foreground base4)
   (font-lock-constant-face :foreground cyan :weight bold)
   (font-lock-doc-face :foreground green)
   (font-lock-function-name-face :foreground base5)
   (font-lock-keyword-face :foreground blue :weight bold)
   (font-lock-negation-char-face :foreground red)
   (font-lock-preprocessor-face :foreground red)
   (font-lock-regexp-grouping-construct :foreground yellow)
   (font-lock-regexp-grouping-backslash :foreground yellow)
   (font-lock-string-face :foreground green)
   (font-lock-type-face :foreground orange)
   (font-lock-variable-name-face :foreground base5)
   (font-lock-warning-face :foreground red)
   (error :foreground red)
   (success :foreground green)
   (warning :foreground orange)

   ;; search and highlighting
   (match :background base4)
   (isearch :inverse-video t)
   (isearch-fail :foreground red)
   (lazy-highlight :foreground base2 :background yellow)

   ;; mode and header lines
   (minibuffer-prompt :foreground cyan)
   (header-line :foreground base5 :background base2)
   (menu :background base3 :foreground base6)
   (mode-line :foreground base5 :background base2 :box nil)
   (mode-line-inactive :foreground base4 :background base1 :box nil)
   (mode-line-highlight :foreground base6)
   (mode-line-buffer-id :weight bold)

   ;; customize
   (custom-button :foreground base4 :box t)
   (custom-button-mouse :foreground base5 :box t)
   (custom-group-tag :inherit fixed-pitch :foreground magenta)
   (custom-state :foreground cyan)

   ;; compilation
   (compilation-mode-line-fail :foreground unspecified :inherit compilation-error)
   (compilation-mode-line-exit :foreground unspecified :inherit compilation-info)

   ;; diff
   (diff-added :foreground green)
   (diff-changed :foreground cyan)
   (diff-header :foreground yellow)
   (diff-file-header :weight bold)
   (diff-refine-added :background base3)
   (diff-refine-change :background base3)
   (diff-refine-removed :background base3)
   (diff-removed :foreground red)

   ;; erc
   (erc-current-nick-face :foreground base5)
   (erc-dangerous-host-face :foreground red)
   (erc-direct-msg-face :foreground orange)
   (erc-error-face :inherit error)
   (erc-fool-face :inherit shadow)
   (erc-header-line :foreground base2 :background magenta)
   (erc-input-face :inherit default)
   (erc-inverse-face :inverse-video t)
   (erc-keyword-face :foreground green)
   (erc-my-nick-face :foreground yellow)
   (erc-nick-msg-face :foreground orange)
   (erc-notice-face :foreground cyan)
   (erc-pal-face :foreground yellow)
   (erc-prompt-face :foreground orange)
   (erc-timestamp-face :foreground magenta :weight bold)

   ;; ediff
   ;; FIXME add support for threeway merges (*-diff-ancestor)
   (ediff-current-diff-A :foreground red :background base2)
   (ediff-current-diff-B :foreground green :background base2)
   (ediff-current-diff-C :foreground blue :background base2)
   ;(ediff-current-diff-Ancestor)
   (ediff-even-diff-A :background base2)
   (ediff-even-diff-B :background base2)
   (ediff-even-diff-C :background base2)
   ;(ediff-even-diff-Ancestor)
   (ediff-fine-diff-A :foreground red :background base3)
   (ediff-fine-diff-B :foreground green :background base3)
   (ediff-fine-diff-C :foreground cyan :background base3)
   ;(ediff-fine-diff-Ancestor)
   (ediff-odd-diff-A :background base2)
   (ediff-odd-diff-B :background base2)
   (ediff-odd-diff-C :background base2)
   ;(ediff-odd-diff-Ancestor)

   ;; eldoc
   (eldoc-highlight-function-argument :foreground orange :weight bold)

   ;; eshell
   (eshell-prompt :foreground yellow :weight bold)
   (eshell-ls-archive :foreground magenta)
   (eshell-ls-backup :foreground violet :weight bold)
   (eshell-ls-clutter :foreground base5)
   (eshell-ls-directory :foreground cyan :weight bold)
   (eshell-ls-executable :foreground green)
   (eshell-ls-missing :foreground red :weight bold)
   (eshell-ls-product :foreground base3)
   (eshell-ls-readonly :foreground red)
   (eshell-ls-special :foreground orange :weight bold)
   (eshell-ls-symlink :foreground blue :weight bold)
   (eshell-ls-unreadable :foreground red)

   ;; flymake
   (flymake-errline :underline (:style wave :color red))
   (flymake-warnline :underline (:style wave :color orange))

   ;; flyspell
   (flyspell-duplicate :underline (:style wave :color orange))
   (flyspell-incorrect :underline (:style wave :color red))

   ;; gnus
   (gnus-emphasis-highlight-words :foreground orange)
   (gnus-header-content :inherit italic :foreground green)
   (gnus-header-from :foreground base4)
   (gnus-header-name :foreground magenta)
   (gnus-header-newsgroups :inherit italic :foreground yellow)
   (gnus-header-subject :foreground base5)
   (gnus-x-face :foreground base0 :background base6)
   (gnus-signature :inherit italic :foreground blue)
   (mm-uu-extract :foreground green :background base1)
   (gnus-cite-1 :foreground base4)
   (gnus-cite-2 :foreground base5)
   (gnus-cite-3 :foreground base6)
   (gnus-cite-4 :foreground base7)
   (gnus-cite-5 :foreground green)
   (gnus-cite-6 :foreground yellow)
   (gnus-cite-7 :foreground orange)
   (gnus-cite-8 :foreground red)
   (gnus-cite-9 :foreground cyan)
   (gnus-cite-10 :foreground magenta)
   (gnus-cite-11 :foreground blue)
   (gnus-group-mail-1 :foreground green :weight bold)
   (gnus-group-mail-1-empty :foreground green)
   (gnus-group-mail-2 :foreground cyan :weight bold)
   (gnus-group-mail-2-empty :foreground cyan)
   (gnus-group-mail-3 :foreground violet :weight bold)
   (gnus-group-mail-3-empty :foreground violet)
   (gnus-group-mail-low :foreground base5 :weight bold)
   (gnus-group-mail-low-empty :foreground base5)
   (gnus-group-news-1 :foreground base4 :weight bold)
   (gnus-group-news-1-empty :foreground base4)
   (gnus-group-news-2 :foreground magenta :weight bold)
   (gnus-group-news-2-empty :foreground magenta)
   (gnus-group-news-3 :foreground base7 :weight bold)
   (gnus-group-news-3-empty :foreground base7)
   (gnus-group-news-4 :foreground violet :weight bold)
   (gnus-group-news-empty :foreground violet)
   (gnus-group-news-5 :foreground cyan :weight bold)
   (gnus-group-news-5-empty :foreground cyan)
   (gnus-group-news-6 :foreground green :weight bold)
   (gnus-group-news-6-empty :foreground green)
   (gnus-group-news-low :foreground blue :weight bold)
   (gnus-group-news-low-empty :foreground blue)
   (gnus-splash :foreground base6)
   (gnus-summary-cancelled :foreground yellow)
   (gnus-summary-high-ancient :foreground blue :weight bold)
   (gnus-summary-high-read :foreground green :weight bold)
   (gnus-summary-high-ticked :foreground base7 :weight bold)
   (gnus-summary-high-undownloaded :foreground base5 :weight bold)
   (gnus-summary-low-ancient :inherit italic :foreground blue)
   (gnus-summary-low-read :inherit italic :foreground green)
   (gnus-summary-low-ticked :inherit italic :foreground base7)
   (gnus-summary-low-undownloaded :inherit italic :foreground base4)
   (gnus-summary-normal-ancient :foreground blue)
   (gnus-summary-normal-read :foreground green)
   (gnus-summary-normal-ticked :foreground base7)
   (gnus-summary-normal-undownloaded :foreground base5)
   (gnus-summary-normal-unread :foreground cyan)
   (gnus-server-agent :foreground base6 :weight bold)
   (gnus-server-closed :inherit italic :foreground base4)
   (gnus-server-cloud :foreground green :weight bold)
   (gnus-server-denied :foreground magenta :weight bold)
   (gnus-server-offline :foreground yellow :weight bold)
   (gnus-server-opened :foreground base5 :weight bold)

   ;; ido
   (ido-first-match :foreground yellow :weight bold)
   (ido-indicator :foreground red)
   (ido-only-match :foreground green)
   (ido-subdir :foreground red)

   ;; info
   (Info-quoted :inherit font-lock-constant-face)
   (info-menu-header :foreground green :weight bold :height 1.4 )
   (info-menu-star :foreground red)
   (info-node :inherit italic :foreground base6 :weight bold)
   (info-title-1 :weight bold :height 1.6)
   (info-title-2 :weight bold :height 1.4)
   (info-title-3 :weight bold :height 1.2)
   (info-title-4 :weight bold)

   ;; makefile
   (makefile-space :background magenta)

   ;; message-mode
   (message-cited-text :foreground blue)
   (message-header-cc :foreground base5)
   (message-header-name :foreground orange)
   (message-header-newsgroups :inherit shadow)
   (message-header-other :foreground base5)
   (message-header-subject :foreground base5)
   (message-header-to :foreground base5)
   (message-header-xheader :inherit shadow)
   (message-mml :foreground yellow)
   (message-separator :foreground blue)

   ;; outline
   (outline-1 :foreground violet)
   (outline-2 :foreground cyan)
   (outline-3 :foreground magenta)
   (outline-4 :foreground green)
   (outline-5 :foreground violet)
   (outline-6 :foreground cyan)
   (outline-7 :foreground magenta)
   (outline-8 :foreground green)

   ;; pulse
   (pulse-highlight-start-face :background base4)

   ;; rcirc
   (rcirc-bright-nick :foreground base7)
   (rcirc-dim-nick :inherit shadow)
   (rcirc-my-nick :foreground base5)
   (rcirc-nick-in-message :inherit rcirc-my-nick)
   (rcirc-other-nick :foreground magenta)
   (rcirc-prompt :foreground orange)
   (rcirc-server :foreground cyan)
   (rcirc-url :inherit link)

   ;; re-builder
   (reb-match-0 :foreground base0 :background base6)
   (reb-match-1 :foreground base0 :background green)
   (reb-match-2 :foreground base0 :background yellow)
   (reb-match-3 :foreground base0 :background cyan)

   ;; ruler
   (ruler-mode-column-number :foreground base6)
   (ruler-mode-comment-column :foreground base4)
   (ruler-mode-current-column :foreground yellow)
   (ruler-mode-default :foreground base5 :background base2)
   (ruler-mode-fill-column :foreground red)
   (ruler-mode-fringes :foreground green)
   (ruler-mode-goal-column :foreground orange)
   (ruler-mode-pad :foreground cyan)
   (ruler-mode-tab-stop :foreground magenta)

   ;; semantic
   (semantic-complete-inline-face :underline base5)
   (semantic-decoration-on-fileless-includes :foreground base4 :background yellow)
   (semantic-decoration-on-private-members-face :background base1)
   (semantic-decoration-on-protected-members-face :background base1)
   (semantic-decoration-on-unknown-includes :background red)
   (semantic-decoration-on-unparsed-includes :background orange)
   (semantic-highlight-edits-face :inherit highlight)
   (semantic-highlight-func-current-tag-face :inherit highlight)
   (semantic-tag-boundary-face :overline cyan)
   (semantic-unmatched-syntax-face :underline red)
   (senator-momentary-highlight-face :inherit highlight)
   (srecode-field-face :underline green)

   ;; speedbar
   (speedbar-button-face :foreground base5)
   (speedbar-directory-face :foreground base5 :weight bold)
   (speedbar-file-face :foreground green)
   (speedbar-highlight-face :inherit highlight)
   (speedbar-selected-face :inherit highlight)
   (speedbar-separator-face :background blue :overline t)
   (speedbar-tag-face :foreground orange)

   ;; show-paren-mode
   (show-paren-match :foreground base2 :background orange :inverse-video nil)
   (show-paren-mismatch :foreground base2 :background red :inverse-video nil)

   ;; term
   (term-color-black :foreground base1 :background base1)
   (term-color-red :foreground red :background red)
   (term-color-green :foreground green :background green)
   (term-color-yellow :foreground yellow :background yellow)
   (term-color-blue :foreground blue :background blue)
   (term-color-magenta :foreground magenta :background magenta)
   (term-color-cyan :foreground cyan :background cyan)
   (term-color-white :foreground base6 :background base6)

   ;; widget
   (widget-button-pressed :foreground red)
   (widget-documentation :foreground green)
   (widget-field :background base4)
   (widget-single-line-field :inherit widget-field)

   ;; which-func-mode
   (which-func :foreground orange)

   ;; whitespace-mode
   (whitespace-empty :foreground base7 :background cyan)
   (whitespace-hspace :foreground base7 :background magenta)
   (whitespace-indentation :background yellow)
   (whitespace-line :foreground base6 :background violet)
   (whitespace-newline :foreground base3)
   (whitespace-space :foreground base7 :background base2)
   (whitespace-space-after-tab :foreground base7 :background orange)
   (whitespace-space-before-tab :foreground base7 :background orange)
   (whitespace-tab :background base3)
   (whitespace-trailing :foreground base7 :background red)

   ;; external packages

   ;; ace-jump
   (ace-jump-face-foreground :foreground red :background unspecified)
   (ace-jump-face-background :foreground base4 :background unspecified)

   ;; ace-window
   (aw-background-face :foreground base3)
   (aw-leading-char-face :foreground base7 :background base3)

   ;; anzu
   (anzu-mode-line :foreground orange :weight bold)
   (anzu-mode-line-no-match :foreground red :weight bold)
   (anzu-replace-highlight :foreground base6 :background base4)
   (anzu-match-1 :foreground base0 :background green)
   (anzu-match-2 :foreground base0 :background yellow)
   (anzu-match-3 :foreground base0 :background cyan)
   (anzu-replace-to :foreground yellow :background base3)

   ;; auctex
   (font-latex-bold-face :inherit bold)
   (font-latex-doctex-documentation-face :inherit highlight)
   (font-latex-doctex-preprocessor-face :inherit highlight :foreground red)
   (font-latex-italic-face :inherit italic)
   (font-latex-math-face :foreground base5)
   (font-latex-sectioning-0-face :inherit bold :foreground yellow)
   (font-latex-sectioning-1-face :inherit bold :foreground yellow)
   (font-latex-sectioning-2-face :inherit bold :foreground yellow)
   (font-latex-sectioning-3-face :inherit bold :foreground yellow)
   (font-latex-sectioning-4-face :inherit bold :foreground yellow)
   (font-latex-sectioning-5-face :inherit bold :foreground yellow)
   (font-latex-sedate-face :foreground orange)
   (font-latex-slide-title-face :inherit bold :foreground orange)
   (font-latex-string-face :inherit font-lock-string-face)
   (font-latex-verbatim-face :inherit font-lock-string-face)
   (font-latex-warning-face :inherit warning)

   ;; auto-complete
   (ac-completion-face :foreground base7 :background base4)

   ;; avy
   (avy-background-face :foreground base3)
   (avy-lead-face :foreground base7 :background base3)
   (avy-lead-face-0 :foreground base0 :background base4)
   (avy-lead-face-1 :foreground base0 :background magenta)
   (avy-lead-face-2 :foreground base0 :background green)

   ;; bookmark+
   (bmkp-*-mark :foreground base2 :background yellow)
   (bmkp->-mark :foreground yellow)
   (bmkp-D-mark :foreground yellow :background red)
   (bmkp-X-mark :foreground red)
   (bmkp-a-mark :foreground base7 :background orange)
   (bmkp-bad-bookmark :foreground red :background base2)
   (bmkp-bookmark-file :foreground cyan :background base2)
   (bmkp-bookmark-list :foreground green :background base2)
   (bmkp-buffer :foreground green)
   (bmkp-desktop :foreground orange :background base2)
   (bmkp-file-handler :foreground base6 :background red)
   (bmkp-function :foreground base5)
   (bmkp-gnus :foreground orange)
   (bmkp-heading :foreground yellow)
   (bmkp-info :foreground base7)
   (bmkp-light-autonamed :inherit highlight)
   (bmkp-light-autonamed-region :foreground green :background base2)
   (bmkp-light-fringe-autonamed :foreground green :background base2)
   (bmkp-light-fringe-non-autonamed :foreground cyan :background base2)
   (bmkp-light-mark :foreground base7 :background base1)
   (bmkp-light-non-autonamed :foreground yellow :background base2)
   (bmkp-light-non-autonamed-region :foreground cyan :background base2)
   (bmkp-local-directory :foreground cyan)
   (bmkp-local-file-with-region :foreground yellow)
   (bmkp-local-file-without-region :foreground base6)
   (bmkp-man :foreground magenta)
   (bmkp-no-jump :foreground base4)
   (bmkp-no-local :foreground yellow)
   (bmkp-non-file :foreground base4)
   (bmkp-remote-file :foreground orange)
   (bmkp-sequence :foreground blue)
   (bmkp-su-or-sudo :foreground red)
   (bmkp-t-mark :foreground magenta)
   (bmkp-url :foreground orange)
   (bmkp-variable-list :foreground base5)

   ;; cfw-calendar
   (cfw:face-annotation :background base1 :foreground violet)
   (cfw:face-day-title :background base1)
   (cfw:face-default-content :foreground yellow)
   (cfw:face-default-day :background base1 :weight bold)
   (cfw:face-disable :background base1 :foreground violet)
   (cfw:face-grid :foreground violet)
   (cfw:face-header :foreground yellow :weight bold)
   (cfw:face-holiday :background green :foreground base7)
   (cfw:face-periods :foreground cyan)
   (cfw:face-select :background base3 :foreground yellow)
   (cfw:face-saturday :foreground violet :weight bold)
   (cfw:face-sunday :foreground magenta :weight bold)
   (cfw:face-title :background base0 :foreground magenta :weight bold)
   (cfw:face-today :background base1 :foreground cyan)
   (cfw:face-today-title :background red :foreground base7)
   (cfw:face-toolbar :background base1)
   (cfw:face-toolbar-button-off :foreground yellow)
   (cfw:face-toolbar-button-on :foreground violet)

   ;; circe
   (circe-fool-face :inherit shadow)
   (circe-highlight-nick-face :foreground base5 :weight bold)
   (circe-prompt-face :foreground orange)
   (circe-server-face :foreground cyan)
   (circe-topic-diff-new-face :foreground base2 :background green)
   (circe-topic-diff-removed-face :foreground base0 :background red)

   ;; company
   (company-echo-common :foreground red)
   (company-preview :inherit company-tooltip-selection)
   (company-preview-common :inherit company-preview :foreground yellow)
   (company-preview-search :inherit company-preview)
   (company-scrollbar-bg :background base2)
   (company-scrollbar-fg :background base4)
   (company-tooltip :foreground base6 :background base2)
   (company-tooltip-annotation :inherit company-tooltip :foreground red)
   (company-tooltip-common :background base2 :weight bold)
   (company-tooltip-common-selection :foreground base7 :background base4 :weight bold)
   (company-tooltip-mouse :foreground base7 :background base4)
   (company-tooltip-selection :foreground base7 :background base4)

   ;; debbugs
   (debbugs-gnu-done :foreground green)
   (debbugs-gnu-handled :foreground yellow)
   (debbugs-gnu-new :foreground red)
   (debbugs-gnu-pending :foreground orange)
   (debbugs-gnu-stale :foreground blue)
   (debbugs-gnu-tagged :foreground red)

   ;; diff-hl
   (diff-hl-change :foreground cyan)
   (diff-hl-delete :foreground red)
   (diff-hl-insert :foreground green)

   ;; dired-async
   (dired-async-failures :inherit error)
   (dired-async-message :inherit warning)
   (dired-async-mode-message :inherit success)

   ;; dired plus
   (diredp-autofile-name :background base3)
   (diredp-compressed-file-name :foreground blue)
   (diredp-compressed-file-suffix :foreground blue)
   (diredp-date-time :foreground blue)
   (diredp-deletion :foreground yellow :background red)
   (diredp-deletion-file-name :background base3)
   (diredp-dir-heading :foreground orange)
   (diredp-dir-name :foreground cyan)
   (diredp-executable-tag :foreground yellow)
   (diredp-file-name :foreground base6)
   (diredp-file-suffix :foreground green)
   (diredp-flag-mark :foreground yellow :background blue)
   (diredp-flag-mark-line :background base3)
   (diredp-ignored-file-name :foreground base6)
   (diredp-mode-line-flagged :foreground red)
   (diredp-mode-line-marked :foreground red)
   (diredp-number :foreground violet)
   (diredp-symlink :foreground base6)
   (diredp-tagged-autofile-name :foreground base6)
   (diredp-no-priv :background base0)
   (diredp-dir-priv :foreground cyan)
   (diredp-read-priv :foreground magenta)
   (diredp-write-priv :foreground green)
   (diredp-exec-priv :foreground blue)
   (diredp-link-priv :foreground yellow)
   (diredp-rare-priv :foreground base6)
   (diredp-other-priv :foreground base6)

   ;; ecb
   (ecb-default-highlight-face :background violet)
   (ecb-method-non-semantic-face :foreground orange)
   (ecb-mode-line-prefix-face :foreground green)
   (ecb-tag-header-face :foreground base2 :background cyan)
   (ecb-tree-guide-line-face :foreground base4)
   (ecb-type-tag-group-face :foreground magenta)

   ;; elfeed
   (elfeed-log-debug-level-face :foreground base4)
   (elfeed-log-error-level-face :inherit error)
   (elfeed-log-info-level-face :inherit success)
   (elfeed-log-warn-level-face :inherit warning)
   (elfeed-search-date-face :foreground violet)
   (elfeed-search-feed-face :foreground orange)
   (elfeed-search-tag-face :foreground green)
   (elfeed-search-title-face :foreground base5)
   (elfeed-search-unread-count-face :foreground orange)
   (elfeed-search-unread-title-face :foreground base6 :weight bold)

   ;; emms
   (emms-playlist-track-face :foreground blue)
   (emms-playlist-selected-face :foreground base6)
   (emms-browser-album-face :foreground cyan)
   (emms-browser-artist-face :foreground cyan)
   (emms-browser-composer-face :foreground cyan)
   (emms-browser-performer-face :foreground cyan)
   (emms-browser-track-face :foreground blue)
   (emms-browser-year/genre-face :foreground cyan)
   (emms-metaplaylist-mode-current-face :foreground red)
   (emms-metaplaylist-mode-face :foreground base6)
   (emms-stream-name-face :foreground cyan)
   (emms-stream-url-face :foreground violet)

   ;; enh-ruby-mode
   (enh-ruby-heredoc-delimiter-face :foreground green :weight bold)
   (enh-ruby-op-face :foreground magenta)
   (enh-ruby-regexp-face :foreground green)
   (enh-ruby-regexp-delimiter-face :foreground green :weight bold)
   (enh-ruby-string-delimiter-face :foreground green)
   (erm-syn-errline :foreground red)
   (erm-syn-warnline :foreground orange)

   ;; flx
   (flx-highlight-face :foreground yellow)

   ;; flycheck
   (flycheck-error :underline (:style wave :color red))
   (flycheck-info :underline (:style wave :color green))
   (flycheck-warning :underline (:style wave :color orange))

   ;; geiser
   (geiser-font-lock-autodoc-current-arg :foreground orange)
   (geiser-font-lock-autodoc-identifier :foreground magenta)
   (geiser-font-lock-doc-link :foreground blue :underline t)
   (geiser-font-lock-error-link :foreground cyan :underline t)
   (geiser-font-lock-xref-link :foreground green :underline t)

   ;; helm
   (helm-bookmark-addressbook :foreground orange)
   (helm-bookmark-file :foreground cyan)
   (helm-bookmark-gnus :foreground magenta)
   (helm-bookmark-info :foreground green)
   (helm-bookmark-man :foreground violet)
   (helm-bookmark-w3m :foreground yellow)
   (helm-buffer-directory :weight bold)
   (helm-buffer-not-saved :foreground red)
   (helm-buffer-process :foreground orange)
   (helm-buffer-saved-out :foreground base7 :background red)
   (helm-buffer-size :foreground magenta)
   (helm-candidate-number :background base3)
   (helm-ff-directory :weight bold)
   (helm-ff-executable :foreground green)
   (helm-ff-invalid-symlink :foreground base2 :background red)
   (helm-ff-prefix :foreground base2 :background yellow)
   (helm-ff-symlink :foreground orange)
   (helm-grep-file :foreground cyan)
   (helm-grep-finish :foreground green)
   (helm-grep-lineno :foreground orange)
   (helm-grep-match :foreground yellow)
   (helm-grep-running :foreground red)
   (helm-history-remote :foreground orange)
   (helm-locate-finish :foreground green)
   (helm-match :foreground yellow)
   (helm-moccur-buffer :foreground cyan)
   (helm-prefarg :foreground green)
   (helm-resume-need-update :foreground base7 :background red)
   (helm-selection :inherit highlight)
   (helm-selection-line :inherit highlight)
   (helm-separator :inherit shadow)
   (helm-source-header :foreground base2 :background blue :weight bold)
   (helm-time-zone-current :foreground green)
   (helm-time-zone-home :foreground red)
   (helm-visible-mark :inherit secondary-selection)

   ;; hydra
   (hydra-face-red :foreground red :bold t)
   (hydra-face-blue :foreground cyan :bold t)
   (hydra-face-teal :foreground green :bold t)
   (hydra-face-pink :foreground orange :bold t)
   (hydra-face-amaranth :foreground magenta :bold t)

   ;; info+
   (info-command-ref-item :foreground green :background base2)
   (info-constant-ref-item :foreground cyan :background base2)
   (info-double-quoted-name :inherit font-lock-comment-face)
   (info-file :foreground yellow :background base2)
   (info-function-ref-item :inherit font-lock-function-name-face :background base2)
   (info-macro-ref-item :foreground yellow :background base2)
   (info-menu :foreground yellow)
   (info-quoted-name :inherit font-lock-constant-face)
   (info-reference-item :background base2)
   (info-single-quote :inherit font-lock-keyword-face)
   (info-special-form-ref-item :foreground yellow :background base2)
   (info-string :inherit font-lock-string-face)
   (info-syntax-class-item :foreground blue :background base2)
   (info-user-option-ref-item :foreground red :background base2)
   (info-variable-ref-item :inherit font-lock-variable-name-face :background base2)

   ;; ivy
   (ivy-confirm-face :foreground cyan)
   (ivy-current-match :foreground base7 :background base3)
   (ivy-cursor :foreground base7 :background base3)
   (ivy-match-required :foreground red)
   (ivy-minibuffer-match-face-1 :foreground base0 :background base4)
   (ivy-minibuffer-match-face-2 :foreground base0 :background magenta)
   (ivy-minibuffer-match-face-3 :foreground base0 :background green)
   (ivy-minibuffer-match-face-4 :foreground base0 :background base5)
   (ivy-modified-buffer :foreground yellow)
   (ivy-remote :foreground red)
   (ivy-subdir :foreground base5)
   (ivy-virtual :foreground green)

   ;; jabber
   (jabber-activity-face :foreground green)
   (jabber-activity-personal-face :foreground cyan)
   (jabber-chat-error :inherit error)
   (jabber-chat-prompt-foreign :foreground green)
   (jabber-chat-prompt-local :foreground orange)
   (jabber-chat-prompt-system :foreground cyan)
   (jabber-rare-time-face :foreground magenta :weight bold)
   (jabber-roster-user-away :foreground violet)
   (jabber-roster-user-chatty :foreground yellow)
   (jabber-roster-user-dnd :foreground orange)
   (jabber-roster-user-error :foreground red)
   (jabber-roster-user-offline :inherit shadow)
   (jabber-roster-user-online :foreground cyan)
   (jabber-roster-user-xa :foreground magenta)

   ;; js2-mode
   (js2-error :inherit error)
   (js2-external-variable :foreground orange)
   (js2-function-param :foreground green)
   (js2-instance-member :foreground magenta)
   (js2-jsdoc-html-tag-delimiter :foreground green)
   (js2-jsdoc-html-tag-name :foreground yellow)
   (js2-jsdoc-tag :foreground cyan)
   (js2-jsdoc-type :foreground blue)
   (js2-jsdoc-value :foreground violet)
   (js2-private-function-call :foreground yellow)
   (js2-private-member :foreground orange)
   (js2-warning :underline (:style wave :color orange))

   ;; linum-relative
   (linum-relative-current-face :background base3 :foreground cyan :weight bold)

   ;; lispy
   (lispy-command-name-face :inherit font-lock-function-name-face :background base2)
   (lispy-cursor-face :foreground base0 :background base6)
   (lispy-face-hint :inherit highlight :foreground green)

   ;; lui
   (lui-button-face :inherit link)
   (lui-highlight-face :foreground base7 :weight bold)
   (lui-time-stamp-face :foreground magenta :weight bold)

   ;; magit 2.1
   (magit-bisect-bad :foreground base1 :background red :box (:color base6))
   (magit-bisect-good :foreground base2 :background green :box (:color base7))
   (magit-bisect-skip :foreground base2 :background yellow :box (:color base7))
   (magit-blame-heading :inherit header-line)
   (magit-branch-local :foreground base6)
   (magit-branch-remote :foreground green)
   (magit-cherry-equivalent :foreground magenta)
   (magit-cherry-unmatched :foreground cyan)
   (magit-diff-added :foreground green)
   (magit-diff-added-highlight :foreground green :weight bold)
   (magit-diff-base :foreground blue)
   (magit-diff-base-highlight :foreground blue :weight bold)
   (magit-diff-context :background base1)
   (magit-diff-context-highlight :background base1 :weight bold)
   (magit-diff-file-heading-selection :foreground orange :inherit magit-diff-file-heading-highlight)
   (magit-diff-hunk-heading :background base2)
   (magit-diff-hunk-heading-highlight :background base2 :weight bold)
   (magit-diff-hunk-heading-selection :foreground orange :inherit magit-diff-hunk-heading-highlight)
   (magit-diff-lines-heading :foreground base2 :background orange)
   (magit-diff-removed :foreground red)
   (magit-diff-removed-highlight :foreground red :weight bold)
   (magit-diffstat-added :foreground green)
   (magit-diffstat-removed :foreground red)
   (magit-dimmed :inherit shadow)
   (magit-hash :foreground base5)
   (magit-log-author :foreground orange)
   (magit-log-date :foreground magenta)
   (magit-log-graph :foreground base5)
   (magit-process-ng :foreground red)
   (magit-process-ok :foreground green)
   (magit-reflog-amend :foreground magenta)
   (magit-reflog-checkout :foreground base5)
   (magit-reflog-cherry-pick :foreground green)
   (magit-reflog-commit :foreground green)
   (magit-reflog-merge :foreground green)
   (magit-reflog-other :foreground cyan)
   (magit-reflog-rebase :foreground magenta)
   (magit-reflog-remote :foreground cyan)
   (magit-reflog-reset :foreground red)
   (magit-refname :foreground violet)
   (magit-section-heading :foreground yellow :weight bold)
   (magit-section-heading-selection :foreground orange :weight bold)
   (magit-section-highlight :background base2)
   (magit-sequence-drop :foreground red)
   (magit-sequence-head :foreground base5)
   (magit-sequence-part :foreground yellow)
   (magit-sequence-stop :foreground green)
   (magit-signature-bad :foreground red)
   (magit-signature-good :foreground green)
   (magit-signature-untrusted :foreground cyan)
   (magit-tag :foreground yellow)

   ;; magit 1.4
   (magit-item-highlight :inherit highlight)
   (magit-log-head-label-bisect-bad :foreground base1 :background red :box (:color base6))
   (magit-log-head-label-bisect-good :foreground base2 :background green :box (:color base7))
   (magit-log-head-label-bisect-skip :foreground base2 :background yellow :box (:color base7))
   (magit-log-head-label-default :background base4)
   (magit-log-head-label-head :foreground yellow :background base1 :box t)
   (magit-log-head-label-local :background base1 :box (:color cyan))
   (magit-log-head-label-patches :foreground base2 :background orange :box (:color base6))
   (magit-log-head-label-remote :background base1 :box (:color magenta))
   (magit-log-head-label-tags :inherit magit-log-head-label-bisect-skip)
   (magit-log-head-label-wip :foreground base4 :background base1 :box t)
   (magit-log-reflog-label-checkout :background base1 :box t)
   (magit-log-reflog-label-cherry-pick :inherit magit-log-head-label-bisect-good)
   (magit-log-reflog-label-commit :foreground base2 :background base5 :box (:color base7))
   (magit-log-reflog-label-other :inherit magit-log-head-label-wip)
   (magit-log-reflog-label-rebase :foreground green :background base1 :box t)
   (magit-log-reflog-label-remote :background base1 :box t)
   (magit-log-reflog-label-reset :inherit magit-log-head-label-bisect-bad)
   (magit-log-sha1 :foreground orange)
   (git-rebase-hash :foreground orange)

   ;; markdown-mode
   (markdown-header-face-1 :background base2)
   (markdown-header-face-2 :background base3)
   (markdown-header-face-3 :background base4)
   (markdown-header-face-4 :background base2)
   (markdown-header-face-5 :background base3)
   (markdown-header-face-6 :background base4)

   ;; macrostep
   (macrostep-expansion-highlight-face :inherit highlight)
   (macrostep-gensym-1 :foreground blue :weight bold :box t)
   (macrostep-gensym-2 :foreground green :weight bold :box t)
   (macrostep-gensym-3 :foreground yellow :weight bold :box t)
   (macrostep-gensym-4 :foreground red :weight bold :box t)
   (macrostep-gensym-5 :foreground magenta :weight bold :box t)

   ;; mu4e
   (mu4e-header-highlight-face :inherit highlight)
   (mu4e-region-code :inherit region)

   ;; neotree
   (neo-banner-face :foreground orange :weight bold)
   (neo-button-face :foreground blue)
   (neo-dir-link-face :foreground magenta :weight bold)
   (neo-expand-btn-face :foreground yellow)
   (neo-file-link-face :foreground green)
   (neo-header-face :foreground yellow)
   (neo-root-dir-face :foreground red :weight bold)
   (neo-vc-added-face :foreground yellow)
   (neo-vc-conflict-face :foreground red)
   (neo-vc-default-face :foreground base6)
   (neo-vc-edited-face :foreground cyan)
   (neo-vc-ignored-face :foreground blue)
   (neo-vc-missing-face :foreground red)
   (neo-vc-needs-merge-face :foreground red)
   (neo-vc-unlocked-changes-face :foreground base7 :background blue)
   (neo-vc-up-to-date-face :foreground green)
   (neo-vc-user-face :inherit italic :foreground red)

   ;; org-mode
   (org-agenda-dimmed-todo-face :inherit shadow)
   (org-agenda-done :foreground green)
   (org-agenda-restriction-lock :inherit highlight)
   (org-agenda-structure :foreground base5)
   (org-block :inherit default)
   (org-clock-overlay :inherit secondary-selection)
   (org-column :background base2)
   (org-column-title :inherit org-column :underline t)
   (org-date :foreground cyan :underline t)
   (org-date-selected :foreground base2 :background magenta)
   (org-document-info :foreground base5)
   (org-document-title :weight bold)
   (org-done :foreground green :weight bold)
   (org-drawer :foreground base5)
   (org-ellipsis :inherit shadow :weight bold)
   (org-footnote :foreground base5 :underline t)
   (org-formula :foreground orange)
   (org-habit-alert-face :background yellow)
   (org-habit-alert-future-face :background yellow)
   (org-habit-clear-face :background blue)
   (org-habit-clear-future-face :background blue)
   (org-habit-overdue-face :background red)
   (org-habit-overdue-future-face :background red)
   (org-habit-ready-face :background green)
   (org-habit-ready-future-face :background green)
   (org-headline-done :foreground yellow)
   (org-hide :foreground base0)
   (org-latex-and-related :foreground orange)
   (org-scheduled :foreground green)
   (org-scheduled-previously :foreground orange)
   (org-scheduled-today :inherit org-scheduled)
   (org-sexp-date :foreground cyan)
   (org-table :foreground violet)
   (org-time-grid :foreground yellow)
   (org-todo :foreground red :weight bold)
   (org-upcoming-deadline :foreground orange)

   ;; popup
   (popup-face :foreground base6 :background base2)
   (popup-isearch-match :foreground base7 :background base4)
   (popup-menu-mouse-face :foreground base7 :background base4)
   (popup-menu-selection-face :foreground base7 :background base4)
   (popup-scroll-bar-background-face :background base2)
   (popup-scroll-bar-foreground-face :background base4)
   (popup-summary-face :foreground base4 :background base2)
   (popup-tip-face :foreground base7 :background base4)

   ;; powerline
   (powerline-active1 :foreground base5 :background base2)
   (powerline-active2 :foreground base5 :background base3)
   (powerline-inactive1 :foreground base4 :background base1)
   (powerline-inactive2 :foreground base4 :background base2)

   ;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground base6)
   (rainbow-delimiters-depth-2-face :foreground cyan)
   (rainbow-delimiters-depth-3-face :foreground orange)
   (rainbow-delimiters-depth-4-face :foreground magenta)
   (rainbow-delimiters-depth-5-face :foreground green)
   (rainbow-delimiters-depth-6-face :foreground blue)
   (rainbow-delimiters-depth-7-face :foreground yellow)
   (rainbow-delimiters-depth-8-face :foreground violet)
   (rainbow-delimiters-depth-9-face :foreground red)
   (rainbow-delimiters-unmatched-face :foreground base2 :background base6)

   ;; rst-mode
   (rst-level-1 :background base2)
   (rst-level-2 :background base3)
   (rst-level-3 :background base4)
   (rst-level-4 :background base2)
   (rst-level-5 :background base3)
   (rst-level-6 :background base4)

   ;; slime
   (slime-error-face :underline (:style wave :color red))
   (slime-note-face :underline (:style wave :color magenta))
   (slime-style-warning-face :underline (:style wave :color green))
   (slime-warning-face :underline (:style wave :color orange))
   (sldb-restartable-frame-line-face :foreground green)
   (slime-repl-inputed-output-face :foreground red)

   ;; smartparens
   (sp-show-pair-match-face :foreground base2 :background orange)
   (sp-show-pair-mismatch-face :foreground base2 :background red)

   ;; smart-mode-line
   (sml/charging :foreground green)
   (sml/discharging :foreground red)
   (sml/filename :foreground cyan :weight normal)
   (sml/global :foreground base6)
   (sml/line-number :foreground base5)
   (sml/modes :foreground base4)
   (sml/modified :foreground red :weight bold)
   (sml/outside-modified :foreground base7 :background red)
   (sml/prefix :foreground orange)
   (sml/read-only :foreground yellow)

   ;; volatile-highlights
   (vhl/default-face :inherit highlight)

   ;; w3m
   (w3m-anchor :inherit link)
   (w3m-arrived-anchor :inherit link-visited)
   (w3m-form :background base1 :foreground magenta)
   (w3m-form-button :background base1 :foreground cyan)
   (w3m-form-button-mouse :background base1 :foreground green)
   (w3m-form-button-pressed :background base1 :foreground green)
   (w3m-form-inactive :background base1 :foreground base6)
   (w3m-insert :background base2 :foreground magenta)
   (w3m-error :background base1 :foreground red)
   (w3m-header-line-location-title :background base2 :foreground yellow)
   (w3m-header-line-location-content :background base2 :foreground base4)
   (w3m-bold :weight bold)
   (w3m-image-anchor :background base3 :foreground cyan :inherit link)
   (w3m-image :background base3 :foreground cyan)
   (w3m-lnum-minibuffer-prompt :foreground base1)
   (w3m-lnum-match :background base2)
   (w3m-lnum :underline nil :bold nil :foreground red)
   (w3m-session-select :foreground base0)
   (w3m-session-selected :foreground base1 :bold t :underline t)
   (w3m-tab-background :background base3 :foreground base0)
   (w3m-tab-selected-background :background base3 :foreground base0)
   (w3m-tab-mouse :background base2 :foreground yellow)
   (w3m-tab-selected :background base2 :foreground yellow :bold t)
   (w3m-tab-unselected :background base2 :foreground violet)
   (w3m-tab-selected-retrieving :background base2 :foreground red)
   (w3m-tab-unselected-retrieving :background base2 :foreground orange)

   ;; web-mode
   (web-mode-block-attr-name-face :foreground green)
   (web-mode-block-attr-value-face :foreground cyan)
   (web-mode-block-face :background base1)
   (web-mode-comment-keyword-face :weight bold)
   (web-mode-current-column-highlight-face :inherit highlight)
   (web-mode-current-element-highlight-face :inherit web-mode-block-face)
   (web-mode-doctype-face :foreground base5)
   (web-mode-error-face :inherit error)
   (web-mode-html-attr-name-face :foreground base5)
   (web-mode-html-tag-bracket-face :foreground magenta)
   (web-mode-html-tag-face :foreground violet)
   (web-mode-inlay-face :inherit web-mode-block-face)
   (web-mode-json-context-face :inherit web-mode-json-key-face)
   (web-mode-json-key-face :foreground magenta)
   (web-mode-param-name-face :foreground base5)
   (web-mode-symbol-face :foreground yellow)
   (web-mode-whitespace-face :foreground base7 :background red)

   ;; wgrep
   (wgrep-delete-face :foreground red)
   (wgrep-done-face :foreground blue)
   (wgrep-face :foreground yellow)
   (wgrep-file-face :foreground green)
   (wgrep-reject-face :foreground violet :weight bold)

   ;; undo-tree
   (undo-tree-visualizer-default-face :inherit shadow)
   (undo-tree-visualizer-current-face :foreground orange)
   (undo-tree-visualizer-active-branch-face :foreground unspecified :weight bold)
   (undo-tree-visualizer-register-face :foreground yellow)
   (undo-tree-visualizer-unmodified-face :foreground cyan)
   ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'gotham)

;;; gotham-theme.el ends here
