;; Help: C-h(elp)

(global-set-key (kbd "C-h b") 'describe-bindings)                ;; C-h(elp) b(indings)
(global-set-key (kbd "C-h f") 'counsel-describe-function)        ;; C-h(elp) f(unction)
(global-set-key (kbd "C-h k") 'describe-key)                     ;; C-h(elp) k(ey)
(global-set-key (kbd "C-h m") 'describe-mode)                    ;; C-h(elp) m(ode)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)        ;; C-h(elp) v(ariable)

;; Window management

(global-set-key (kbd "C-x 0") 'delete-window)                    ;; C-x 0(of this should exist)
(global-set-key (kbd "C-x 1") 'delete-other-windows)             ;; C-x 1(window to rule them all)
(global-set-key (kbd "C-x 2") 'split-window-below)
(global-set-key (kbd "C-x 3") 'split-window-right)

;; Arrow keys for movement and buffer management

(global-set-key (kbd "C-<up>") 'backward-paragraph)              ;; C-<up>(buffer)
(global-set-key (kbd "C-<down>") 'forward-paragraph)             ;; C-<down>(buffer)
(global-set-key (kbd "C-x <up>") 'beginning-of-buffer)           ;; C-x(tremely)<up>
(global-set-key (kbd "C-x <down>") 'end-of-buffer)               ;; C-x(tremely)(bottom)
(global-set-key (kbd "C-x <left>") 'previous-buffer)             ;; C-x <left>(buffer)
(global-set-key (kbd "C-x <right>") 'next-buffer)                ;; C-x <right>(buffer)
(when (fboundp 'windmove-default-keybindings)                    ;; Shift up, down, left, right between buffers
  (windmove-default-keybindings))

;; Console: C-c(onsole)

(global-set-key (kbd "C-c d") 'docker)                           ;; C-c(onsole) d(ocker)
(global-set-key (kbd "C-c e") 'multi-term)                       ;; C-c(onsole) e(macs)
(global-set-key (kbd "C-c x") 'async-term)                       ;; C-c(onsole) x(term)
(global-set-key (kbd "C-c s") 'magit-status)                     ;; C-c(onsole) s(tatus of git)
(global-set-key (kbd "C-c C-p") 'magit-push-current-to-upstream) ;; C-c(onsole) C-p(ush git)

;; Zones via elscreen: C-z(one)

(global-set-key (kbd "C-z c") 'elscreen-create)                  ;; C-z(one) c(reate)
(global-set-key (kbd "C-z k") 'elscreen-kill)                    ;; C-z(one) k(ill)
(global-set-key (kbd "C-z n") 'elscreen-next)                    ;; C-z(one) n(ext)
(global-set-key (kbd "C-z p") 'elscreen-previous)                ;; C-z(one) p(revious)

;; Execute: C-x(ecute) letter

(global-set-key (kbd "C-x c") 'compile)                          ;; C-x(ecute) c(ompilation)
(global-set-key (kbd "C-x f") 'counsel-find-file)                ;; C-x(ecute) f(ind command)
(global-set-key (kbd "C-x k") 'volatile-kill-buffer)             ;; C-x(ecute) k(ill)
(global-set-key (kbd "C-x l") 'counsel-locate)                   ;; C-x(ecute) l(ocate)
(global-set-key (kbd "C-x o") 'other-window)                     ;; C-x(ecute) o(ther window)
(global-set-key (kbd "C-x s") 'replace-string)                   ;; C-x(ecute) s(tring replacement)

;; Execute under point: C-x(ecute) C-letter

(global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)              ;; C-x(ecute) C-b(uffer switch)
(global-set-key (kbd "C-x C-c") 'counsel-ag-thing-at-point)      ;; C-x(ecute) C-c(ounsel ag)
(global-set-key (kbd "C-x C-d") 'devdocs-search)                 ;; C-x(ecute) C-d(ocumentation search)
(global-set-key (kbd "C-x C-f") 'sunrise-cd)                     ;; C-x(ecute) C-f(ile manager)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)       ;; C-x(ecute) C-m(-x)
(global-set-key (kbd "C-x C-r") 'eval-region)                    ;; C-x(ecute) C-r(egion)
(global-set-key (kbd "C-x C-s") 'save-buffer)                    ;; C-x(ecute) C-s(ave buffer)
(global-set-key (kbd "C-x C-w") 'dumb-jump-go)                   ;; C-x(ecute) C-w(here is this code)

;; Buffer browsing & management: ergonomic & simple but not memorable

(global-set-key (kbd "<C-tab>") 'other-window)                   ;; psuedo tab-like functionality
(global-set-key (kbd "C-=") 'er/expand-region)                   ;; increasingly expand selected region
(global-set-key (kbd "C-a") 'move-beginning-of-line)             ;; a(lpha of line)
(global-set-key (kbd "C-e") 'move-end-of-line)                   ;; e(nd of line)
(global-set-key (kbd "C-f") 'scroll-down)
(global-set-key (kbd "C-g") 'keyboard-quit)                      ;; g(et out of here)
(global-set-key (kbd "C-s") 'swiper-isearch)                     ;; s(earch)
(global-set-key (kbd "C-v") 'scroll-up)
(global-set-key (kbd "C-w") 'kill-region)
(global-set-key (kbd "M-g") 'goto-line)                          ;; g(oto)
(global-set-key (kbd "M-w") 'kill-ring-save)
(global-set-key (kbd "M-y") 'counsel-yank-pop)                   ;; y(ank pop)
