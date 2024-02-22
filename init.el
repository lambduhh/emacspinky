;;; Startup optimizations
(setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024 2)))
(run-with-idle-timer 2 t (lambda () (garbage-collect)))
(setq history-delete-duplicates t)
(setq company-idle-delay nil)

;;; Package Management
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;;; Use-package for cleaner configuration
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;;; Basic configurations
(tool-bar-mode -1)
(nyan-mode 1)
(nyan-toggle-wavy-trail)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-auto-revert-mode t)
(delete-selection-mode 1)


;;; Packages Configuration
(use-package paredit
  :ensure t)

(use-package clojure-mode
  :ensure t
  :config (add-hook 'clojure-mode-hook 'paredit-mode))

(use-package cider
  :ensure t
  :config
  (setq cider-repl-display-help-banner nil))

(use-package projectile
  :ensure t
  :config (projectile-mode +1))

(use-package company
  :ensure t
  :config (global-company-mode))

(use-package magit
  :ensure t)

(use-package clj-refactor
  :ensure t
  :config (add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1) (yas-minor-mode 1))))

;;; Custom functions and hooks
(defun jump-to-init ()
  "Jump to the init.el file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c i") 'jump-to-init)

;;; Custom Set Variables and Faces
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes t)
 '(package-selected-packages
   '(exec-path-from-shell use-package paredit clojure-mode cider projectile helm company magit clj-refactor)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Miscellaneous Customizations

(load-theme 'spacemacs-dark t)

;; Mac M1 Config
;; Ensure Emacs uses all available cores for compilation to speed up startup
(when (and (fboundp 'native-comp-available-p)
           (native-comp-available-p))
  (setq comp-speed 2) ;; 0-2, where 2 is the fastest
  (setq native-comp-async-report-warnings-errors 'silent) ;; Avoid popups
  (setq package-native-compile t))


;; Improve scrolling behavior on macOS
(setq mac-redisplay-dont-reset-vscroll t)
(setq mac-mouse-wheel-smooth-scroll nil)

;; Keep Control as Control
(setq mac-control-modifier 'control)

;; Map Option as Command
(setq mac-option-modifier 'super)

;; Map Command as Meta
(setq mac-command-modifier 'meta)

;; Set OPT as a prefix key
(define-prefix-command 's-prefix)
(global-set-key (kbd "s") 's-prefix)

;; Use exec-path-from-shell to ensure Emacs uses the same $PATH as the shell, fixing issues with finding the correct executables
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

;; (when (display-graphic-p)
;;   ;; Adjust the font and size as per your preference
;;   (set-face-attribute 'default nil :font "Menlo" :height 140))

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; /Customizations
(load "ui.el")
(load "ljmcustom.el")
(load "elisp-editing.el")
(load "setup-clojure.el")
(load "setup-helm.el")
(load "customkeys.el")
(load "org-mode.el")

(provide 'init)
;;; init.el ends here
