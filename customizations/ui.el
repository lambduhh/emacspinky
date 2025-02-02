;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; Turn off the menu bar at the top of each frame because it's distracting
;(menu-bar-mode -1)

;; Show line numbers
(global-display-line-numbers-mode t)

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
;(when (fboundp 'tool-bar-mode)
 ; (tool-bar-mode -1))


;; ;Firacode stuff for ligs
;; (defun fira-code-mode--make-alist (list)
;;   "Generate prettify-symbols alist from LIST."
;;   (let ((idx -1))
;;     (mapcar
;;      (lambda (s)
;;        (setq idx (1+ idx))
;;        (let* ((code (+ #Xe100 idx))
;;               (width (string-width s))
;;               (prefix ())
;;               (suffix '(?\s (Br . Br)))
;;               (n 1))
;;          (while (< n width)
;;            (setq prefix (append prefix '(?\s (Br . Bl))))
;;            (setq n (1+ n)))
;;          (cons s (append prefix suffix (list (decode-char 'ucs code))))))
;;      list)))

;; (defconst fira-code-mode--ligatures
;;   '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
;;     "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
;;     "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
;;     "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
;;     ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
;;     "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
;;     "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
;;     "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
;;     ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
;;     "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
;;     "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
;;     "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
;;     "x" ":" "+" "+" "*"))

;; (defvar fira-code-mode--old-prettify-alist)

;; (defun fira-code-mode--enable ()
;;   "Enable Fira Code ligatures in current buffer."
;;   (setq-local fira-code-mode--old-prettify-alist prettify-symbols-alist)
;;   (setq-local prettify-symbols-alist (append (fira-code-mode--make-alist
;;                                               fira-code-mode--ligatures)
;;                                              fira-code-mode--old-prettify-alist))
;;   (prettify-symbols-mode t))

;; (defun fira-code-mode--disable ()
;;   "Disable Fira Code ligatures in current buffer."
;;   (setq-local prettify-symbols-alist fira-code-mode--old-prettify-alist)
;;   (prettify-symbols-mode -1))

;; (define-minor-mode fira-code-mode
;;   "Fira Code ligatures minor mode"
;;   :lighter " Fira Code"
;;   (setq-local prettify-symbols-unprettify-at-point 'right-edge)
;;   (if fira-code-mode
;;       (fira-code-mode--enable)
;;     (fira-code-mode--disable)))

;; (defun fira-code-mode--setup ()
;;   "Setup Fira Code Symbols"
;;   (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol"))

;; (provide 'fira-code-mode)

;; (when (window-system)
;;   (set-frame-font "Fira Code-12" nil t))


;; ;; Set Fira Code font
;; (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
;;                (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
;;                (36 . ".\\(?:>\\)")
;;                (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
;;                (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
;;                (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
;;                (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
;;                (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
;;                (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
;;                (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
;;                (48 . ".\\(?:x[a-zA-Z]\\)")
;;                (58 . ".\\(?:::\\|[:=]\\)")
;;                (59 . ".\\(?:;;\\|;\\)")
;;                (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
;;                (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
;;                (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
;;                (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
;;                (91 . ".\\(?:]\\)")
;;                (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
;;                (94 . ".\\(?:=\\)")
;;                (119 . ".\\(?:ww\\)")
;;                (123 . ".\\(?:-\\)")
;;                (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
;;                (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)"))))
;;   (dolist (char-regexp alist)
;;     (set-char-table-range composition-function-table (car char-regexp)
;;                           `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; ;http://endlessparentheses.com/using-prettify-symbols-in-clojure-and-elisp-without-breaking-indentation.html
;; (global-prettify-symbols-mode 1)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))


;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; These settings relate to how emacs interacts with your operating system
;; (setq ;; makes killing/yanking interact with the clipboard
;;       x-select-enable-clipboard t

;;       ;; I'm actually not sure what this does but it's recommended?
;;       x-select-enable-primary t

;;       ;; Save clipboard strings into kill ring before replacing them.
;;       ;; When one selects something in another program to paste it into Emacs,
;;       ;; but kills something in Emacs before actually pasting it,
;;       ;; this selection is gone unless this variable is non-nil
;;       save-interprogram-paste-before-kill t

;;       ;; Shows all options when running apropos. For more info,
;;       ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
;;       apropos-do-all t

;;       ;; Mouse yank commands yank at point instead of at click.
;;       mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
;(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)


;; (add-hook 'helm-major-mode-hook
;;           (lambda ()
;;             (setq auto-composition-mode nil)))

;; (add-hook 'ediff-mode-hook
;;             (lambda ()
;;               (setq auto-composition-mode nil)))

 





(require 'zone)

(defun zone-choose (pgm)
    "Choose a PGM to run for `zone'."
    (interactive
     (list
      (completing-read
       "Program: "
       (mapcar 'symbol-name zone-programs))))
    (let ((zone-programs (list (intern pgm))))
      (zone)))

(provide `ui)
