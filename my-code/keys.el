;;; keys --- Global key bindings

;;; Commentary:

;;; Global-level key-bindings. Not to be confused with mode-level keys, which
;;; should generally be done via mode hooks.

;;; Code:

;; Taken from crisp.el, written by Gary D. Foster
(defvar last-last-command nil
  "Internal variable.")

(defun home ()
  "Home - begin of line, once more - screen, once more - buffer."
  (interactive nil)
  (cond
    ((and (eq last-command 'home) (eq last-last-command 'home))
     (goto-char (point-min)))
    ((eq last-command 'home)
     (move-to-window-line 0))
    (t (beginning-of-line)))
  (setq last-last-command last-command))

(defun end ()
  "End - end of line, once more - screen, once more - buffer."
  (interactive nil)
  (cond
    ((and (eq last-command 'end) (eq last-last-command 'end))
     (goto-char (point-max)))
    ((eq last-command 'end)
     (move-to-window-line -1)
     (end-of-line))
    (t (end-of-line)))
  (setq last-last-command last-command))

;; For tweaking around with lisp:
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun insert-utf-char ()
  "Insert a Unicode character selected by name via minibuf."
  (interactive)
  (call-interactively 'insert-char))

;;; Bindings:

;; Browse the kill-ring with C-c k:
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;; Replace a lisp sexp with its eval'd value:
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; Use this instead of hitting M-x all the time:
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Highlighting symbols:
(global-set-key (kbd "C-/") 'highlight-symbol-at-point)
(global-set-key (kbd "C-.") 'highlight-symbol-next)
(global-set-key (kbd "C-,") 'highlight-symbol-prev)
(global-set-key (kbd "C-;") 'highlight-symbol-query-replace)

;; Function-key bindings. Don't go above f8, though, because MacOS grabs f9
;; through f12. And f1-f4 are already in use.
(global-set-key [(f5)]         'call-last-kbd-macro)
(global-set-key [(control f5)] 'edit-last-kbd-macro)

(global-set-key [(f6)]         'search-forward-regexp)
(global-set-key [(control f6)] 'search-backward-regexp)

(global-set-key [(f8)]         'cider-jack-in)

;; Meta-key combinations
(global-set-key [(meta g)] 'goto-line)
(global-set-key [(meta q)] 'quote)

;; UTF chars
(global-set-key (kbd "C-c C-q") 'insert-utf-char)

;; I miss these keys on my Macbook... but at least I have them on full
;; keyboards...
(global-set-key [(home)] 'home)
(global-set-key [(end)] 'end)

(provide 'keys)
;;; keys.el ends here
