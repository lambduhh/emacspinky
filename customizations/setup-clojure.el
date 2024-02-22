;;;;
;; Clojure
;;;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; Set whitespace preferences
;; highlight lines over 80 characters for linter
;(setq whitespace-line-column 80) ;; limit line length
(add-hook 'clojure-mode-hook #'whitespace-mode)
(setq whitespace-style '(face lines-tail))
(require 'whitespace)
(add-hook 'prog-mode-hook 'whitespace-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; Rainbows
(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)


;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))


;; Default indent
(setq clojure-indent-style :always-align)

;; snippet support
(require 'yasnippet)
(yas-global-mode 1)

(put-clojure-indent 'go-try 0)
(put-clojure-indent 'async 1)

;;;; CUSTOM CIDER- Global key bindings

(global-set-key (kbd "C-<space>") #'cider-eval-sexp)
(global-set-key (kbd "C-<return>") #'cider-load-buffer)
(global-set-key (kbd "M-u") #'cljr-splice-sexp-killing-backward)
(global-set-key (kbd "C-M-i") #'cider-inspect-last-result)
(global-set-key (kbd "C-M-'") #'cider-format-buffer)
(global-set-key (kbd "C-M-a") #'clojure-align)
(global-set-key (kbd "M-S-<f11>") #'bookmark-set)
(global-set-key (kbd "S-<f11>") #'bookmark-jump)
;(global-set-key (kbd "C-c d") #'cider-doc)
;(global-set-key (kbd "C-S-<space>") #'cider-eval-last-sexp-and-replace)
(global-set-key (kbd "M-]") #'forward-sexp)
(global-set-key (kbd "M-[") #'backward-sexp)
(global-set-key (kbd "M-S-<up>") #'move-line-up)
(global-set-key (kbd "M-S-<down>") #'move-line-down)
(global-set-key (kbd "C-x f") #'recentf-open-files)
(global-set-key (kbd "C-M-g") #'cider-find-var)
(global-set-key (kbd "C-M-]") #'er/expand-region)
(global-set-key (kbd "C-S-<backspace>") #'cider-pop-back)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(global-set-key (kbd "C-a") #'smarter-move-beginning-of-line)
(global-set-key (kbd "C-'") #'cider-format-buffer)

(provide 'setup-clojure)

;;; setup-clojure.el ends here
