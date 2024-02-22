;; Beautifying Org Mode in Emacs
(use-package org
  :hook (org-mode . visual-line-mode)
  :config
  ;; Increase the size of various headings
  (set-face-attribute 'org-document-title nil :font "Cantarell" :weight 'bold :height 1.3)
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'medium :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-Keybinding))


(defun my-org-screenshot ()
  "Take a screenshot using Flameshot and insert a link to the file in an Org document."
  (interactive)
  (org-display-inline-images)
  (let ((filename (concat
                   (make-temp-name
                    (concat (file-name-nondirectory (buffer-file-name))
                            "_imgs/"
                            (format-time-string "%Y%m%d_%H%M%S_"))) ".png")))
    (unless (file-exists-p (file-name-directory filename))
      (make-directory (file-name-directory filename) t))
    ;; Adjust the command below according to how Flameshot should be invoked
    (shell-command (format "flameshot gui --path %s"
                           (shell-quote-argument (file-name-directory filename))))
    ;; Check if the screenshot was saved
    (let ((newest-screenshot 
           (car (directory-files (file-name-directory filename) t ".png$" nil))))
      (when newest-screenshot
        (insert (format "[[file:%s]]" newest-screenshot)))
      (org-display-inline-images))))


(global-set-key "s-y" 'my-org-screenshot)

(provide 'org-mode.el)
