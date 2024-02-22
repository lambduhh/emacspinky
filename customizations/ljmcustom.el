;; Some custom keybindings I use

(global-set-key (kbd "C-t") 'forward-sexp)
(global-set-key (kbd "C-r") 'backward-sexp)
(global-set-key (kbd "C-u") 'previous-line)
(global-set-key (kbd "C-7") 'fixup-whitespace)
(global-set-key (kbd "C-9") 'paredit-backward-delete)

;; move around windows with shift key
(windmove-default-keybindings)

;; windows+alt o
(global-set-key [C-tab] (quote next-multiframe-window))
(global-set-key "f" (quote fixup-whitespace))
(global-set-key (kbd "<C-S-up>") 'shrink-window)
(global-set-key (kbd "<C-S-down>") 'enlarge-window)
(global-set-key (kbd "<S-C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<S-C-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
; C-S-f file search
;(global-set-key [33554438] (quote ag-dired))

(require 'zoom-window)
(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)


(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))



(add-hook 'after-init-hook 'global-company-mode)
;; (global-aggressive-indent-mode 1)
;; (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode 1)

(add-to-list 'auto-mode-alist '("\.cljs.*$" . clojurescript-mode))


;;default to verical split panes
(setq split-width-threshold nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)


;; Insert random uuid
(defun insert-random-uuid ()
  "Insert a random UUID into the buffer."
  (interactive)
  (let ((uuid (shell-command-to-string "uuidgen")))
    (insert "\"" (string-trim-right (downcase uuid)) "\"")))

;;; NAVIGATION
;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.


;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex

 (setq smex-save-file (concat user-emacs-directory ".smex-items"))
 (smex-initialize)
 (global-set-key (kbd "M-x") 'smex)

;; projectile everywhere!
;;; 
;; ;;(projectile-mode +1)
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; (projectile-global-mode)

;; AG configuration
(setq ag-highlight-search t)


;;;AUTOCOMPLETE

(global-auto-complete-mode t)

(defun auto-complete-mode-maybe ()
  "No maybe for you.  Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

(provide 'ljmcustom)



