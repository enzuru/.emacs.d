;;; airline-themes.el --- vim-airline themes for emacs powerline -*- lexical-binding: t; -*-

;; Author: Anthony DiGirolamo <anthony.digirolamo@gmail.com>
;; URL: http://github.com/AnthonyDiGirolamo/airline-themes
;; Version: 1.7
;; Keywords: evil, mode-line, powerline, airline, themes
;; Package-Requires: ((powerline "2.3"))

;;; Commentary:
;;
;; vim-airline themes https://github.com/vim-airline/vim-airline-themes for emacs powerline https://github.com/milkypostman/powerline
;;

;;; Code:

(require 'powerline)
(require 'cl-lib)

(defface airline-normal-outer  '((t (:foreground "#141413" :background "#aeee00" :weight normal))) "Airline Normal Outer Face"  :group 'airline-themes)
(defface airline-normal-inner  '((t (:foreground "#f4cf86" :background "#45413b" :weight normal))) "Airline Normal Inner Face"  :group 'airline-themes)
(defface airline-normal-center '((t (:foreground "#8cffba" :background "#242321" :weight normal))) "Airline Normal Center Face" :group 'airline-themes)

(defface airline-insert-outer  '((t (:foreground "#141413" :background "#0a9dff" :weight normal))) "Airline Insert Outer Face"  :group 'airline-themes)
(defface airline-insert-inner  '((t (:foreground "#f4cf86" :background "#005faf" :weight normal))) "Airline Insert Inner Face"  :group 'airline-themes)
(defface airline-insert-center '((t (:foreground "#0a9dff" :background "#242321" :weight normal))) "Airline Insert Center Face" :group 'airline-themes)

(defface airline-visual-outer  '((t (:foreground "#141413" :background "#ffa724" :weight normal))) "Airline Visual Outer Face"  :group 'airline-themes)
(defface airline-visual-inner  '((t (:foreground "#000000" :background "#fade3e" :weight normal))) "Airline Visual Inner Face"  :group 'airline-themes)
(defface airline-visual-center '((t (:foreground "#000000" :background "#b88853" :weight normal))) "Airline Visual Center Face" :group 'airline-themes)

(defface airline-replace-outer '((t (:foreground "#141413" :background "#aeee00" :weight normal))) "Airline Replace Outer Face" :group 'airline-themes)
(defface airline-replace-inner  '((t (:foreground "#f4cf86" :background "#45413b" :weight normal))) "Airline Replace Inner Face"  :group 'airline-themes)
(defface airline-replace-center '((t (:foreground "#8cffba" :background "#242321" :weight normal))) "Airline Replace Center Face" :group 'airline-themes)

(defface airline-emacs-outer   '((t (:foreground "#d7d7ff" :background "#5f00af" :weight normal))) "Airline Emacs Outer Face"   :group 'airline-themes)
(defface airline-emacs-inner  '((t (:foreground "#f4cf86" :background "#45413b" :weight normal))) "Airline Emacs Inner Face"  :group 'airline-themes)
(defface airline-emacs-center '((t (:foreground "#8cffba" :background "#242321" :weight normal))) "Airline Emacs Center Face" :group 'airline-themes)

(defface airline-inactive3 '((t (:foreground "#45413b" :background "#242321" :weight normal))) "Airline Inactive Center Face" :group 'airline-themes)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(defcustom airline-shortened-directory-length 30
  "Set the desired directory length."

  :group 'airline-themes
  :type '(integer))

(defcustom airline-hide-state-on-inactive-buffers nil
  "Hide Evil and buffer state on inactive buffers.

Valid Values: t (hidden), nil (shown)"
  :group 'airline-themes
  :type '(choice (const :tag "Hidden" t)
                 (const :tag "Shown" nil)))

(defcustom airline-hide-eyebrowse-on-inactive-buffers nil
  "Hide eyebrowse indicator on inactive buffers.

Valid Values: t (hidden), nil (shown)"
  :group 'airline-themes
  :type '(choice (const :tag "Hidden" t)
                 (const :tag "Shown" nil)))

(defcustom airline-hide-vc-branch-on-inactive-buffers nil
  "Hide vc branch on inactive buffers.

Valid Values: t (hidden), nil (shown)"
  :group 'airline-themes
  :type '(choice (const :tag "Hidden" t)
                 (const :tag "Shown" nil)))

(defcustom airline-eshell-colors t
  "Set eshell prompt colors to match the airline theme.

Valid Values: t (enabled), nil (disabled)"
  :group 'airline-themes
  :type '(choice (const :tag "Enabled" t)
                 (const :tag "Disabled" nil)))

(defcustom airline-helm-colors t
  "Set helm colors to match the airline theme.

Valid Values: t (enabled), nil (disabled)"
  :group 'airline-themes
  :type '(choice (const :tag "Enabled" t)
                 (const :tag "Disabled" nil)))

(defcustom airline-cursor-colors t
  "Set the cursor color based on the current evil state.

Valid Values: t (enabled), nil (disabled)"
  :group 'airline-themes
  :type '(choice (const :tag "Enabled" t)
                 (const :tag "Disabled" nil)))

(defcustom airline-display-directory nil
  "Display the currend directory along with the filename.

Valid Values: airline-directory-full, airline-directory-shortened, nil (disabled)"
  :group 'airline-themes
  :type '(choice (const :tag "Full" airline-directory-full)
                 (const :tag "Shortened" airline-directory-shortened)
                 (const :tag "Disabled" nil)))

(defcustom airline-utf-glyph-separator-left #x2b80
  "The unicode character number used for the left side separator."
  :group 'airline-themes
  :type '(choice
          (const :tag "Space: #x20" #x20)
          (const :tag "Box Drawing Bar: │ #x2502" #x2502)
          (const :tag "Box Drawing Forward: Slash ╲ #x2572" #x2572)
          (const :tag "Box Drawing Back Slash: ╱ #x2571" #x2571)
          (const :tag "Block Element Solid Block: █ #x2588" #x2588)
          (const :tag "Block Element 75% Block: ▓ #x2593" #x2593)
          (const :tag "Block Element 50% Block: ▒ #x2592" #x2592)
          (const :tag "Block Element 25% Block: ░ #x2591" #x2591)
          (const :tag "powerline:  #xe0b0" #xe0b0)
          (const :tag "vim-powerline: ⮀ #x2b80" #x2b80)))

(defcustom airline-utf-glyph-separator-right #x2b82
  "The unicode character number used for the right side separator."
  :group 'airline-themes
  :type '(choice
          (const :tag "Space: #x20" #x20)
          (const :tag "Box Drawing Bar: │ #x2502" #x2502)
          (const :tag "Box Drawing Forward Slash: ╲ #x2572" #x2572)
          (const :tag "Box Drawing Back Slash: ╱ #x2571" #x2571)
          (const :tag "Block Element Solid Block: █ #x2588" #x2588)
          (const :tag "Block Element 75% Block: ▓ #x2593" #x2593)
          (const :tag "Block Element 50% Block: ▒ #x2592" #x2592)
          (const :tag "Block Element 25% Block: ░ #x2591" #x2591)
          (const :tag "powerline:  #xe0b2" #xe0b2)
          (const :tag "vim-powerline: ⮂ #x2b82" #x2b82)))

(defcustom airline-utf-glyph-subseparator-left #x2b81
  "The unicode character number used for the left side subseparator."
  :group 'airline-themes
  :type '(choice
          (const :tag "Space: #x20" #x20)
          (const :tag "Box Drawing Bar: │ #x2502" #x2502)
          (const :tag "Box Drawing Forward Slash: ╲ #x2572" #x2572)
          (const :tag "Box Drawing Back Slash: ╱ #x2571" #x2571)
          (const :tag "Block Element Solid Block: █ #x2588" #x2588)
          (const :tag "Block Element 75% Block: ▓ #x2593" #x2593)
          (const :tag "Block Element 50% Block: ▒ #x2592" #x2592)
          (const :tag "Block Element 25% Block: ░ #x2591" #x2591)
          (const :tag "powerline:  #xe0b1" #xe0b1)
          (const :tag "vim-powerline ⮁ #x2b81" #x2b81)))

(defcustom airline-utf-glyph-subseparator-right #x2b83
  "The unicode character number used for the right side subseparator."
  :group 'airline-themes
  :type '(choice
          (const :tag "Space: #x20" #x20)
          (const :tag "Box Drawing Bar: │ #x2502" #x2502)
          (const :tag "Box Drawing Forward Slash: ╲ #x2572" #x2572)
          (const :tag "Box Drawing Back Slash: ╱ #x2571" #x2571)
          (const :tag "Block Element Solid Block: █ #x2588" #x2588)
          (const :tag "Block Element 75% Block: ▓ #x2593" #x2593)
          (const :tag "Block Element 50% Block: ▒ #x2592" #x2592)
          (const :tag "Block Element 25% Block: ░ #x2591" #x2591)
          (const :tag "powerline:  #xe0b3" #xe0b3)
          (const :tag "vim-powerline: ⮃ #x2b83" #x2b83)))

(defcustom airline-utf-glyph-branch #x2b60
  "The unicode character number used for the branch symbol."
  :group 'airline-themes
  :type '(choice
          (const :tag "option key symbol: ⌥ #x2325" #x2325)
          (const :tag "runic letter fehu: ᚠ #x16a0" #x16a0)
          (const :tag "powerline:  #xe0a0" #xe0a0)
          (const :tag "vim-powerline: ⭠ #x2b60" #x2b60)))

(defcustom airline-utf-glyph-readonly #x2b64
  "The unicode character number used for the readonly symbol."
  :group 'airline-themes
  :type '(choice
          (const :tag "powerline:  #xe0a2" #xe0a2)
          (const :tag "vim-powerline: ⭤ #x2b64" #x2b64)))

(defcustom airline-utf-glyph-linenumber #x2630
  "The unicode character number used for the linenumber symbol."
  :group 'airline-themes
  :type '(choice
          (const :tag "Box Drawing two horizontal lines: ═ #x2550" #x2550)
          (const :tag "Three horizontal lines: ☰ #x2630" #x2630)
          (const :tag "powerline ln:  #xe0a1" #xe0a1)
          (const :tag "vim-powerline ln: ⭡ #x2b61" #x2b61)))

(defun airline-themes-set-eshell-prompt ()
  "Set the eshell prompt"
  (setq eshell-highlight-prompt t
        eshell-prompt-regexp "^ [^#$]* [#$] "
        eshell-prompt-function
        (lambda ()
          (concat
           (propertize
            " "
            'face `(:foreground ,(face-foreground 'airline-insert-outer)
                    :background ,(face-background 'airline-insert-outer)))

           (propertize
            (concat (char-to-string airline-utf-glyph-separator-left) " ")
            'face `(:foreground ,(face-background 'airline-insert-outer)
                    :background ,(face-background 'airline-insert-inner)))

           (if (eq airline-display-directory 'airline-directory-shortened)
               (propertize
                (concat (airline-shorten-directory (eshell/pwd) airline-shortened-directory-length) " ")
                'face `(:foreground ,(face-foreground 'airline-insert-inner)
                        :background ,(face-background 'airline-insert-inner)))
             (propertize
              (concat (abbreviate-file-name (eshell/pwd)) " ")
              'face `(:foreground ,(face-foreground 'airline-insert-inner)
                      :background ,(face-background 'airline-insert-inner))))

           (propertize
            (concat (char-to-string airline-utf-glyph-separator-left) " ")
            'face `(:foreground ,(face-background 'airline-insert-inner)
                    :background ,(face-background 'airline-insert-center)))

           (propertize
            (concat (airline-curr-dir-git-branch-string (eshell/pwd)) " ")
            'face `(:foreground ,(face-foreground 'airline-insert-center)
                    :background ,(face-background 'airline-insert-center)))

           (propertize
            (concat (char-to-string airline-utf-glyph-separator-left))
            'face `(:foreground ,(face-background 'airline-insert-center)))

           (propertize " $ " 'face `())))))

(defun airline-themes-mode-line-format ()
  '(let* ((current-window-width (window-width))
          (active (powerline-selected-window-active))
          (separator-left (intern (format "powerline-%s-%s"
                                          (powerline-current-separator)
                                          (car powerline-default-separator-dir))))
          (separator-right (intern (format "powerline-%s-%s"
                                           (powerline-current-separator)
                                           (cdr powerline-default-separator-dir))))
          (mode-line-face (if active 'mode-line 'mode-line-inactive))
          (evil-mode-active (featurep 'evil))
          (visual-block (if evil-mode-active
                            (and (evil-visual-state-p)
                                 (eq evil-visual-selection 'block))
                          nil))
          (visual-line (if evil-mode-active
                           (and (evil-visual-state-p)
                                (eq evil-visual-selection 'line))
                         nil))
          (current-evil-state-string (if evil-mode-active
                                         (upcase (concat (symbol-name evil-state)
                                                         (cond (visual-block "-BLOCK")
                                                               (visual-line "-LINE"))))
                                       nil))
          ;; Shorten evil state to a single charater instead of the full word
          (current-evil-state-string (if (and current-evil-state-string
                                              (< current-window-width 80))
                                         (substring current-evil-state-string 0 1)
                                       current-evil-state-string))
          (outer-face
           (if active
               (if evil-mode-active
                   (cond ((eq evil-state (intern "normal"))  'airline-normal-outer)
                         ((eq evil-state (intern "insert"))  'airline-insert-outer)
                         ((eq evil-state (intern "visual"))  'airline-visual-outer)
                         ((eq evil-state (intern "replace")) 'airline-replace-outer)
                         ((eq evil-state (intern "emacs"))   'airline-emacs-outer)
                         (t                                  'airline-normal-outer))
                 'airline-normal-outer)
             'powerline-inactive1))

          (inner-face
           (if active
               (if evil-mode-active
                   (cond ((eq evil-state (intern "normal")) 'airline-normal-inner)
                         ((eq evil-state (intern "insert")) 'airline-insert-inner)
                         ((eq evil-state (intern "visual")) 'airline-visual-inner)
                         ((eq evil-state (intern "replace")) 'airline-replace-inner)
                         ((eq evil-state (intern "emacs"))   'airline-emacs-inner)
                         (t                                 'airline-normal-inner))
                 'airline-normal-inner)
             'powerline-inactive2))

          (center-face
           (if active
               (if evil-mode-active
                   (cond ((eq evil-state (intern "normal")) 'airline-normal-center)
                         ((eq evil-state (intern "insert")) 'airline-insert-center)
                         ((eq evil-state (intern "visual")) 'airline-visual-center)
                         ((eq evil-state (intern "replace")) 'airline-replace-center)
                         ((eq evil-state (intern "emacs"))   'airline-emacs-center)
                         (t                                 'airline-normal-center))
                 'airline-normal-center)
             'airline-inactive3))

          ;; Left Hand Side
          (lhs-mode (when (or (not airline-hide-state-on-inactive-buffers)
                              (and airline-hide-state-on-inactive-buffers active))
                      (if evil-mode-active
                          (list
                           ;; Evil Mode Name
                           (powerline-raw (concat " " current-evil-state-string " ") outer-face)
                           (funcall separator-left outer-face inner-face)
                           ;; Modified string
                           (powerline-raw "%*" inner-face 'l))
                        (list
                         ;; Modified string
                         (powerline-raw "%*" outer-face 'l)
                         ;; Separator >
                         (powerline-raw " " outer-face)
                         (funcall separator-left outer-face inner-face)))))

          (lhs-rest (list
                     ;; ;; Separator >
                     ;; (powerline-raw (char-to-string #x2b81) inner-face 'l)

                     ;; Eyebrowse current tab/window config
                     (if (and (or (not airline-hide-eyebrowse-on-inactive-buffers)
                                  (and airline-hide-eyebrowse-on-inactive-buffers active))
                              (featurep 'eyebrowse))
                         (powerline-raw (concat " " (eyebrowse-mode-line-indicator)) inner-face 'r))

                     ;; Git Branch
                     (if (and (or (not airline-hide-vc-branch-on-inactive-buffers)
                                  (and airline-hide-vc-branch-on-inactive-buffers active))
                              buffer-file-name vc-mode)
                         (powerline-raw (airline-get-vc) inner-face))

                     ;; Separator >
                     (powerline-raw " " inner-face)
                     (funcall separator-left inner-face center-face)

                     ;; Directory
                     (cond
                      ((and buffer-file-name ;; if buffer has a filename
                            (eq airline-display-directory
                                'airline-directory-shortened))
                       (powerline-raw (airline-shorten-directory default-directory airline-shortened-directory-length) center-face 'l))
                      ((and buffer-file-name ;; if buffer has a filename
                            (eq airline-display-directory
                                'airline-directory-full))
                       (powerline-raw default-directory center-face 'l))
                      (t
                       (powerline-raw " " center-face)))

                     ;; Buffer ID
                     ;; (powerline-buffer-id center-face)
                     (powerline-raw "%b" center-face)

                     ;; Current Function (which-function-mode)
                     (when (and (boundp 'which-func-mode) which-func-mode)
                       ;; (powerline-raw which-func-format 'l nil))
                       (powerline-raw which-func-format center-face 'l))

                     ;; ;; Separator >
                     ;; (powerline-raw " " center-face)
                     ;; (funcall separator-left mode-line face1)

                     (when (boundp 'erc-modified-channels-object)
                       (powerline-raw erc-modified-channels-object center-face 'l))

                     ;; ;; Separator <
                     ;; (powerline-raw " " face1)
                     ;; (funcall separator-right face1 face2)
                     ))

          (lhs (append lhs-mode lhs-rest))

          ;; Right Hand Side
          (rhs (list (powerline-raw global-mode-string center-face 'r)

                     ;; ;; Separator <
                     ;; (powerline-raw (char-to-string #x2b83) center-face 'l)

                     ;; Minor Modes
                     (powerline-minor-modes center-face 'l)
                     ;; (powerline-narrow center-face 'l)

                     ;; Subseparator <
                     (powerline-raw (char-to-string airline-utf-glyph-subseparator-right) center-face 'l)

                     ;; Major Mode
                     (powerline-major-mode center-face 'l)
                     (powerline-process center-face)

                     ;; Separator <
                     (powerline-raw " " center-face)
                     (funcall separator-right center-face inner-face)

                     ;; ;; Buffer Size
                     ;; (when powerline-display-buffer-size
                     ;;   (powerline-buffer-size inner-face 'l))
                     ;; ;; Mule Info
                     ;; (when powerline-display-mule-info
                     ;;   (powerline-raw mode-line-mule-info inner-face 'l))
                     ;; (powerline-raw " " inner-face)
                     (powerline-raw (format " %s " buffer-file-coding-system) inner-face)

                     ;; Separator <
                     (funcall separator-right inner-face outer-face)

                     ;; % location in file
                     (powerline-raw "%3p" outer-face 'l)
                     ;; LN charachter
                     (powerline-raw (char-to-string airline-utf-glyph-linenumber) outer-face 'l)

                     ;; Current Line / File Size
                     ;; (powerline-raw "%l/%I" outer-face 'l)
                     ;; Current Line / Number of lines
                     (powerline-raw
                      (format "%%l/%d" (count-lines (point-min) (point-max))) outer-face 'l)

                     (powerline-raw "ln :" outer-face 'l)
                     ;; Current Column
                     (powerline-raw "%3c " outer-face 'l)

                     ;; ;; position in file image
                     ;; (when powerline-display-hud
                     ;;   (powerline-hud inner-face outer-face))
                     )
               ))
     ;; Combine Left and Right Hand Sides
     (concat (powerline-render lhs)
             (powerline-fill center-face (powerline-width rhs))
             (powerline-render rhs))))

(defun airline-themes-set-modeline ()
  "Set the airline mode-line-format"
  (interactive)
  (setq-default mode-line-format
                `("%e"
                  (:eval
                   ,(airline-themes-mode-line-format)
                   )))
  (powerline-reset)
  (kill-local-variable 'mode-line-format))

(defun airline-themes-set-deftheme (theme-name)
  "Set appropriate face attributes for THEME-NAME."
  (when airline-eshell-colors
    (airline-themes-set-eshell-prompt))

  (when airline-helm-colors
    (custom-theme-set-faces
     theme-name
     `(helm-header           ((t ( :foreground ,insert-inner-foreground  :background ,insert-inner-background  :bold t))))
     `(helm-selection        ((t ( :foreground ,insert-outer-foreground  :background ,insert-outer-background  :bold t))))
     `(helm-source-header    ((t ( :foreground ,insert-center-foreground :background ,insert-center-background :bold t))))
     `(helm-candidate-number ((t ( :foreground ,normal-inner-foreground  :background ,normal-inner-background  :bold t))))
     `(helm-selection-line   ((t ( :foreground ,normal-center-foreground :background ,normal-center-background :bold t))))))

  (custom-theme-set-faces
   theme-name
   `(which-func             ((t ( :foreground ,normal-center-foreground  :background ,normal-center-background :bold t))))
   `(airline-normal-outer   ((t ( :foreground ,normal-outer-foreground   :background ,normal-outer-background))))
   `(airline-normal-inner   ((t ( :foreground ,normal-inner-foreground   :background ,normal-inner-background))))
   `(airline-normal-center  ((t ( :foreground ,normal-center-foreground  :background ,normal-center-background))))
   `(airline-insert-outer   ((t ( :foreground ,insert-outer-foreground   :background ,insert-outer-background))))
   `(airline-insert-inner   ((t ( :foreground ,insert-inner-foreground   :background ,insert-inner-background))))
   `(airline-insert-center  ((t ( :foreground ,insert-center-foreground  :background ,insert-center-background))))
   `(airline-visual-outer   ((t ( :foreground ,visual-outer-foreground   :background ,visual-outer-background))))
   `(airline-visual-inner   ((t ( :foreground ,visual-inner-foreground   :background ,visual-inner-background))))
   `(airline-visual-center  ((t ( :foreground ,visual-center-foreground  :background ,visual-center-background))))
   `(airline-replace-outer  ((t ( :foreground ,replace-outer-foreground  :background ,replace-outer-background))))
   `(airline-replace-inner  ((t ( :foreground ,replace-inner-foreground  :background ,replace-inner-background))))
   `(airline-replace-center ((t ( :foreground ,replace-center-foreground :background ,replace-center-background))))
   `(airline-emacs-outer    ((t ( :foreground ,emacs-outer-foreground    :background ,emacs-outer-background))))
   `(airline-emacs-inner    ((t ( :foreground ,emacs-inner-foreground    :background ,emacs-inner-background))))
   `(airline-emacs-center   ((t ( :foreground ,emacs-center-foreground   :background ,emacs-center-background))))
   `(powerline-inactive1    ((t ( :foreground ,inactive1-foreground      :background ,inactive1-background))))
   `(powerline-inactive2    ((t ( :foreground ,inactive2-foreground      :background ,inactive2-background))))
   `(airline-inactive3      ((t ( :foreground ,inactive3-foreground      :background ,inactive3-background))))
   `(mode-line              ((t ( :foreground ,normal-center-foreground  :background ,normal-center-background :box  nil :underline nil :overline nil))))
   `(mode-line-inactive     ((t ( :foreground ,inactive1-foreground      :background ,inactive1-background     :box  nil :underline nil :overline nil))))
   `(mode-line-buffer-id    ((t ( :foreground ,normal-outer-foreground   :background ,normal-outer-background  :box  nil :underline nil :overline nil))))
   `(minibuffer-prompt      ((t ( :foreground ,normal-outer-foreground   :background ,normal-outer-background  :box  nil))))
   ))

(defun airline--git-branch-from-head-file (filename)
  "Return the current branch name or sha from a .git/HEAD FILENAME."
  (when (and (file-regular-p filename) (file-readable-p filename))
    (with-temp-buffer
      ;; extract the branch name
      (insert-file-contents filename)
      (point-min)
      (cond
       ;; ref symbol
       ((re-search-forward "ref: .*/\\([^/\n]+\\)" nil t)
        (match-string-no-properties 1))
       ;; commit sha
       ((re-search-forward "\\([A-Za-z0-9]+\\)\n" nil t)
        ;; shorten
        (substring (match-string-no-properties 1) 0 7))))))

(defun airline-curr-dir-git-branch-string (pwd)
  "Return the current git branch as a string.
Returns an empty string if PWD is not a git repo."
  (if (featurep 'magit)
      ;; use magit
      (magit-get-current-branch)
    ;; Get branch from .git/HEAD file
    (when (and (not (string-match-p "^\/ssh:" pwd))
               (eshell-search-path "git")
               (locate-dominating-file pwd ".git"))
      (let* ((symlink-expanded-pwd (file-truename (expand-file-name pwd)))
             (root-git-repo-dir (file-name-as-directory
                                 (expand-file-name
                                  (locate-dominating-file symlink-expanded-pwd ".git"))))
             (dotgit-folder (concat (file-name-as-directory root-git-repo-dir) ".git"))
             (dotgit-head-file (concat (file-name-as-directory dotgit-folder) "HEAD")))
        (cond
         ;; standard repo with .git/HEAD file
         ((and (file-directory-p dotgit-folder)
               (file-regular-p dotgit-head-file))
          (airline--git-branch-from-head-file dotgit-head-file))
         ;; submodule with .git containing the path to the submodule
         ;; only handles submodules one level deep
         ((and (file-regular-p dotgit-folder)
               (file-readable-p dotgit-folder))
          (let* ((submodule-relative-dir (with-temp-buffer
                                           ;; extract the submodule repo location
                                           (insert-file-contents dotgit-folder) (point-min)
                                           (when (re-search-forward "gitdir: \\([^\n]+\\)" nil t)
                                             (match-string-no-properties 1))))
                 (submodule-absolute-dir (expand-file-name
                                          (concat
                                           (file-name-as-directory root-git-repo-dir)
                                           (file-name-as-directory submodule-relative-dir))))
                 (submodule-head-file (concat (file-name-as-directory submodule-absolute-dir) "HEAD")))
            (airline--git-branch-from-head-file submodule-head-file)
            ))
         ;; empty string if no git branch
         (t
          (string))))
      )))

(defun airline-get-vc ()
  "Reimplementation of powerline-vc function to give the same result in gui as the terminal."
  (interactive)
  (format "%s%s"
          (char-to-string airline-utf-glyph-branch)
          (if (featurep 'magit)
              ;; prepend a space
              (format " %s" (magit-get-current-branch))
            ;; vc-mode prepends a space
            (format-mode-line '(vc-mode vc-mode)))))

(defun airline-shorten-directory (dir max-length)
  "Return a shortened version of `DIR'.

Replacing elements with single characters starting from the left to try and get
the path down to `MAX-LENGTH'"
  (let* ((components (split-string (abbreviate-file-name dir) "/"))
         (len (+ (1- (length components))
                 (cl-reduce '+ components :key 'length)))
         (str ""))
    (while (and (> len max-length)
                (cdr components))
      (setq str (concat str (if (= 0 (length (car components)))
                                "/"
                              (string (elt (car components) 0) ?/)))
            len (- len (1- (length (car components))))
            components (cdr components)))
    (concat str (cl-reduce (lambda (a b) (concat a "/" b)) components))
  )
)

(defun airline-generate-theme-file (theme-name json)
  "Create a theme.el file.

Arguments:
  THEME-NAME: a theme name as a string.
  JSON: a hash-table derived from the vim 'airline#themes#$theme-name#palette'
        variable encoded in json format."
  (when (and theme-name json)
    (with-temp-file (format "airline-%s-theme.el" theme-name)
      (let* ((normal-outer (gethash "airline_a" (gethash "normal" json)))
             (normal-inner (gethash "airline_b" (gethash "normal" json)))
             (normal-center (gethash "airline_c" (gethash "normal" json)))

             (insert-outer (gethash "airline_a" (gethash "insert" json) normal-outer))
             (insert-inner (gethash "airline_b" (gethash "insert" json) normal-inner))
             (insert-center (gethash "airline_c" (gethash "insert" json) normal-center))

             (visual-outer (gethash "airline_a" (gethash "visual" json) normal-outer))
             (visual-inner (gethash "airline_b" (gethash "visual" json) normal-inner))
             (visual-center (gethash "airline_c" (gethash "visual" json) normal-center))

             (replace-outer (gethash "airline_a" (gethash "replace" json) normal-outer))
             (replace-inner (gethash "airline_b" (gethash "replace" json) normal-inner))
             (replace-center (gethash "airline_c" (gethash "replace" json) normal-center))

             (inactive1 (gethash "airline_a" (gethash "inactive" json) normal-outer))
             (inactive2 (gethash "airline_b" (gethash "inactive" json) normal-inner))
             (inactive3 (gethash "airline_c" (gethash "inactive" json) normal-center))

             (normal-outer-foreground   (nth 0 normal-outer))   (normal-outer-background   (nth 1 normal-outer))
             (normal-inner-foreground   (nth 0 normal-inner))   (normal-inner-background   (nth 1 normal-inner))
             (normal-center-foreground  (nth 0 normal-center))  (normal-center-background  (nth 1 normal-center))

             (insert-outer-foreground   (nth 0 insert-outer))   (insert-outer-background   (nth 1 insert-outer))
             (insert-inner-foreground   (nth 0 insert-inner))   (insert-inner-background   (nth 1 insert-inner))
             (insert-center-foreground  (nth 0 insert-center))  (insert-center-background  (nth 1 insert-center))

             (visual-outer-foreground   (nth 0 visual-outer))   (visual-outer-background   (nth 1 visual-outer))
             (visual-inner-foreground   (nth 0 visual-inner))   (visual-inner-background   (nth 1 visual-inner))
             (visual-center-foreground  (nth 0 visual-center))  (visual-center-background  (nth 1 visual-center))

             (visual-outer-foreground  (if (string-empty-p visual-outer-foreground)  normal-outer-foreground  visual-outer-foreground))
             (visual-center-foreground (if (string-empty-p visual-center-foreground) normal-center-foreground visual-center-foreground))
             (visual-inner-foreground  (if (string-empty-p visual-inner-foreground)  normal-inner-foreground  visual-inner-foreground))

             (replace-outer-foreground  (nth 0 replace-outer))  (replace-outer-background  (nth 1 replace-outer))
             (replace-inner-foreground  (nth 0 replace-inner))  (replace-inner-background  (nth 1 replace-inner))
             (replace-center-foreground (nth 0 replace-center)) (replace-center-background (nth 1 replace-center))

             (emacs-outer-foreground    (nth 0 normal-outer))   (emacs-outer-background    (nth 1 normal-outer))
             (emacs-inner-foreground    (nth 0 normal-inner))   (emacs-inner-background    (nth 1 normal-inner))
             (emacs-center-foreground   (nth 0 normal-center))  (emacs-center-background   (nth 1 normal-center))

             (inactive1-foreground      (nth 0 inactive1))      (inactive1-background      (nth 1 inactive1))
             (inactive2-foreground      (nth 0 inactive2))      (inactive2-background      (nth 1 inactive2))
             (inactive3-foreground      (nth 0 inactive3))      (inactive3-background      (nth 1 inactive3))

             (inactive1-foreground (if (string-empty-p inactive1-foreground) normal-outer-foreground  inactive1-foreground))
             (inactive2-foreground (if (string-empty-p inactive2-foreground) normal-center-foreground inactive2-foreground))
             (inactive3-foreground (if (string-empty-p inactive3-foreground) normal-inner-foreground  inactive3-foreground)))
        (insert (s-lex-format "
;;; Code:

(deftheme airline-${theme-name}
  \"source: https://github.com/vim-airline/vim-airline-themes\")

(let ((normal-outer-foreground   \"${normal-outer-foreground}\") (normal-outer-background   \"${normal-outer-background}\")
      (normal-inner-foreground   \"${normal-inner-foreground}\") (normal-inner-background   \"${normal-inner-background}\")
      (normal-center-foreground  \"${normal-center-foreground}\") (normal-center-background  \"${normal-center-background}\")

      (insert-outer-foreground   \"${insert-outer-foreground}\") (insert-outer-background   \"${insert-outer-background}\")
      (insert-inner-foreground   \"${insert-inner-foreground}\") (insert-inner-background   \"${insert-inner-background}\")
      (insert-center-foreground  \"${insert-center-foreground}\") (insert-center-background  \"${insert-center-background}\")

      (visual-outer-foreground   \"${visual-outer-foreground}\") (visual-outer-background   \"${visual-outer-background}\")
      (visual-inner-foreground   \"${visual-inner-foreground}\") (visual-inner-background   \"${visual-inner-background}\")
      (visual-center-foreground  \"${visual-center-foreground}\") (visual-center-background  \"${visual-center-background}\")

      (replace-outer-foreground  \"${replace-outer-foreground}\") (replace-outer-background  \"${replace-outer-background}\")
      (replace-inner-foreground  \"${replace-inner-foreground}\") (replace-inner-background  \"${replace-inner-background}\")
      (replace-center-foreground \"${replace-center-foreground}\") (replace-center-background \"${replace-center-background}\")

      (emacs-outer-foreground    \"${emacs-outer-foreground}\") (emacs-outer-background    \"${emacs-outer-background}\")
      (emacs-inner-foreground    \"${emacs-inner-foreground}\") (emacs-inner-background    \"${emacs-inner-background}\")
      (emacs-center-foreground   \"${emacs-center-foreground}\") (emacs-center-background   \"${emacs-center-background}\")

      (inactive1-foreground      \"${inactive1-foreground}\") (inactive1-background      \"${inactive1-background}\")
      (inactive2-foreground      \"${inactive2-foreground}\") (inactive2-background      \"${inactive2-background}\")
      (inactive3-foreground      \"${inactive3-foreground}\") (inactive3-background      \"${inactive3-background}\"))

  (airline-themes-set-deftheme 'airline-${theme-name})

  (when airline-cursor-colors
    (setq evil-emacs-state-cursor   emacs-outer-background
          evil-normal-state-cursor  normal-outer-background
          evil-insert-state-cursor  `(bar ,insert-outer-background)
          evil-replace-state-cursor replace-outer-background
          evil-visual-state-cursor  visual-outer-background))
)

(airline-themes-set-modeline)

(provide-theme 'airline-${theme-name})
;;; airline-${theme-name}-theme.el ends here
"))))))

(defun airline-generate-themes ()
  "Generate all *theme.el files based on definitions encoded in vim-airline-theme-palettes.json."
  (interactive)
  (require 's)
  (require 'json)
  (when (and (fboundp 'json-read-file) (fboundp 's-lex-format))
    (let* ((default-directory (file-name-directory (locate-library "airline-themes" )))
           (json-object-type 'hash-table)
           (json-array-type 'list)
           (json-key-type 'string)
           (json (json-read-file "vim-airline-theme-palettes.json")))
      (maphash
       (lambda (theme-name theme-json)
         (airline-generate-theme-file theme-name theme-json))
       json))))

(defun airline-preview-themes ()
  (interactive)
  ;; (let* ((preview-buffer-name "*airline-preview-themes*")
  ;;        (preview-buffer (get-buffer preview-buffer-name)))
  ;;   (when (not preview-buffer)
  ;;     (setq preview-buffer (generate-new-buffer preview-buffer-name)))
  ;;   (switch-to-buffer preview-buffer)
  ;;   (funcall 'fundamental-mode)
  ;;   (setq buffer-offer-save nil)
  ;;   (erase-buffer))
  (let* ((old-def-dir default-directory)
         (default-directory (file-name-directory (locate-library "airline-themes" )))
         (json-object-type 'hash-table)
         (json-array-type 'list)
         (json-key-type 'string)
         (json-themes (json-read-file "vim-airline-theme-palettes.json")))
    (setq default-directory old-def-dir)
    (setq themenames (list))
    (maphash
     (lambda (k v)
       (push k themenames)
       )
     json-themes)
    (cl-loop
     for theme-name in (sort themenames 'string-lessp)
     do
     (cl-loop
      for estate in (list
                     'evil-normal-state
                     'evil-insert-state
                     'evil-visual-char
                     'evil-replace-state)
      do
      (load-theme (intern (format "airline-%s" theme-name)) t)
      (funcall estate)
      (message "airline-%s" theme-name)
      (force-mode-line-update)
      (redisplay t)
      (sleep-for 1.2)
      (escr-frame-screenshot)))
    ))


(provide 'airline-themes)
;;; airline-themes.el ends here
