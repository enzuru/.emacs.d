;;; exwm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "exwm" "exwm.el" (0 0 0 0))
;;; Generated autoloads from exwm.el

(autoload 'exwm-restart "exwm" "\
Restart EXWM." t nil)

(autoload 'exwm-init "exwm" "\
Initialize EXWM.

\(fn &optional FRAME)" t nil)

(autoload 'exwm-exit "exwm" "\
Exit EXWM." t nil)

(autoload 'exwm-enable "exwm" "\
Enable/Disable EXWM.

\(fn &optional UNDO)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm" '("exwm-")))

;;;***

;;;### (autoloads nil "exwm-cm" "exwm-cm.el" (0 0 0 0))
;;; Generated autoloads from exwm-cm.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-cm" '("exwm-cm-")))

;;;***

;;;### (autoloads nil "exwm-config" "exwm-config.el" (0 0 0 0))
;;; Generated autoloads from exwm-config.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-config" '("exwm-config-")))

;;;***

;;;### (autoloads nil "exwm-core" "exwm-core.el" (0 0 0 0))
;;; Generated autoloads from exwm-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-core" '("exwm-")))

;;;***

;;;### (autoloads nil "exwm-floating" "exwm-floating.el" (0 0 0 0))
;;; Generated autoloads from exwm-floating.el

(autoload 'exwm-floating-toggle-floating "exwm-floating" "\
Toggle the current window between floating and non-floating states." t nil)

(autoload 'exwm-floating-hide "exwm-floating" "\
Hide the current floating X window (which would show again when selected)." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-floating" '("exwm-floating-")))

;;;***

;;;### (autoloads nil "exwm-input" "exwm-input.el" (0 0 0 0))
;;; Generated autoloads from exwm-input.el

(autoload 'exwm-input-set-key "exwm-input" "\
Set a global key binding.

The new key binding only takes effect in real time when this command is
called interactively, and is lost when this session ends unless it's
specifically saved in the Customize interface for `exwm-input-global-keys'.

In configuration you should customize or set `exwm-input-global-keys'
instead.

\(fn KEY COMMAND)" t nil)

(autoload 'exwm-input-grab-keyboard "exwm-input" "\
Switch to line-mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-release-keyboard "exwm-input" "\
Switch to char-mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-toggle-keyboard "exwm-input" "\
Toggle between 'line-mode' and 'char-mode'.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-send-next-key "exwm-input" "\
Send next key to client window.

EXWM will prompt for the key to send.  This command can be prefixed to send
multiple keys.  If END-KEY is non-nil, stop sending keys if it's pressed.

\(fn TIMES &optional END-KEY)" t nil)

(autoload 'exwm-input-set-simulation-key "exwm-input" "\
Set a simulation key.

The simulation key takes effect in real time, but is lost when this session
ends unless it's specifically saved in the Customize interface for
`exwm-input-simulation-keys'.

\(fn ORIGINAL-KEY SIMULATED-KEY)" t nil)

(autoload 'exwm-input-send-simulation-key "exwm-input" "\
Fake a key event according to the last input key sequence.

\(fn TIMES)" t nil)

(autoload 'exwm-input-invoke-factory "exwm-input" "\
Make a command that invokes KEYS when called.

One use is to access the keymap bound to KEYS (as prefix keys) in char-mode.

\(fn KEYS)" nil t)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-input" '("exwm-input-")))

;;;***

;;;### (autoloads nil "exwm-layout" "exwm-layout.el" (0 0 0 0))
;;; Generated autoloads from exwm-layout.el

(autoload 'exwm-layout-set-fullscreen "exwm-layout" "\
Make window ID fullscreen.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-unset-fullscreen "exwm-layout" "\
Restore window from fullscreen state.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-toggle-fullscreen "exwm-layout" "\
Toggle fullscreen mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-enlarge-window "exwm-layout" "\
Make the selected window DELTA pixels taller.

If no argument is given, make the selected window one pixel taller.  If the
optional argument HORIZONTAL is non-nil, make selected window DELTA pixels
wider.  If DELTA is negative, shrink selected window by -DELTA pixels.

Normal hints are checked and regarded if the selected window is displaying an
`exwm-mode' buffer.  However, this may violate the normal hints set on other X
windows.

\(fn DELTA &optional HORIZONTAL)" t nil)

(autoload 'exwm-layout-enlarge-window-horizontally "exwm-layout" "\
Make the selected window DELTA pixels wider.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-shrink-window "exwm-layout" "\
Make the selected window DELTA pixels lower.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-shrink-window-horizontally "exwm-layout" "\
Make the selected window DELTA pixels narrower.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-hide-mode-line "exwm-layout" "\
Hide mode-line." t nil)

(autoload 'exwm-layout-show-mode-line "exwm-layout" "\
Show mode-line." t nil)

(autoload 'exwm-layout-toggle-mode-line "exwm-layout" "\
Toggle the display of mode-line." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-layout" '("exwm-layout-")))

;;;***

;;;### (autoloads nil "exwm-manage" "exwm-manage.el" (0 0 0 0))
;;; Generated autoloads from exwm-manage.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-manage" '("exwm-manage-")))

;;;***

;;;### (autoloads nil "exwm-randr" "exwm-randr.el" (0 0 0 0))
;;; Generated autoloads from exwm-randr.el

(autoload 'exwm-randr-refresh "exwm-randr" "\
Refresh workspaces according to the updated RandR info." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-randr" '("exwm-randr-")))

;;;***

;;;### (autoloads nil "exwm-systemtray" "exwm-systemtray.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from exwm-systemtray.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-systemtray" '("exwm-systemtray-" "xcb:systemtray:-ClientMessage")))

;;;***

;;;### (autoloads nil "exwm-workspace" "exwm-workspace.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from exwm-workspace.el

(autoload 'exwm-workspace--get-geometry "exwm-workspace" "\
Return the geometry of frame FRAME.

\(fn FRAME)" nil nil)

(autoload 'exwm-workspace--current-height "exwm-workspace" "\
Return the height of current workspace." nil nil)

(autoload 'exwm-workspace--minibuffer-own-frame-p "exwm-workspace" "\
Reports whether the minibuffer is displayed in its own frame." nil nil)

(autoload 'exwm-workspace-switch "exwm-workspace" "\
Switch to workspace INDEX (0-based).

Query for the index if not specified when called interactively.  Passing a
workspace frame as the first option or making use of the rest options are
for internal use only.

\(fn FRAME-OR-INDEX &optional FORCE)" t nil)

(autoload 'exwm-workspace-switch-create "exwm-workspace" "\
Switch to workspace INDEX or creating it first if it does not exist yet.

Passing a workspace frame as the first option is for internal use only.

\(fn FRAME-OR-INDEX)" t nil)

(autoload 'exwm-workspace-swap "exwm-workspace" "\
Interchange position of WORKSPACE1 with that of WORKSPACE2.

\(fn WORKSPACE1 WORKSPACE2)" t nil)

(autoload 'exwm-workspace-move "exwm-workspace" "\
Move WORKSPACE to the NTH position.

When called interactively, prompt for a workspace and move current one just
before it.

\(fn WORKSPACE NTH)" t nil)

(autoload 'exwm-workspace-add "exwm-workspace" "\
Add a workspace as the INDEX-th workspace, or the last one if INDEX is nil.

INDEX must not exceed the current number of workspaces.

\(fn &optional INDEX)" t nil)

(autoload 'exwm-workspace-delete "exwm-workspace" "\
Delete the workspace FRAME-OR-INDEX.

\(fn &optional FRAME-OR-INDEX)" t nil)

(autoload 'exwm-workspace-move-window "exwm-workspace" "\
Move window ID to workspace FRAME-OR-INDEX.

\(fn FRAME-OR-INDEX &optional ID)" t nil)

(autoload 'exwm-workspace-switch-to-buffer "exwm-workspace" "\
Make the current Emacs window display another buffer.

\(fn BUFFER-OR-NAME)" t nil)

(autoload 'exwm-workspace-attach-minibuffer "exwm-workspace" "\
Attach the minibuffer so that it always shows." t nil)

(autoload 'exwm-workspace-detach-minibuffer "exwm-workspace" "\
Detach the minibuffer so that it automatically hides." t nil)

(autoload 'exwm-workspace-toggle-minibuffer "exwm-workspace" "\
Attach the minibuffer if it's detached, or detach it if it's attached." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-workspace" '("exwm-workspace-")))

;;;***

;;;### (autoloads nil "exwm-xim" "exwm-xim.el" (0 0 0 0))
;;; Generated autoloads from exwm-xim.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "exwm-xim" '("exwm-xim-")))

;;;***

;;;### (autoloads nil nil ("exwm-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; exwm-autoloads.el ends here
