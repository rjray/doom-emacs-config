;;; hooks.el --- Mode hooks.

;;; Commentary:

;;; All my mode-hooks should be defined here, except for those that are
;;; platform-dependent.

;;; Code:

(require 'recentf)
(require 'cperl-mode)
(require 'flycheck)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'after-init-hook 'global-whitespace-mode)
(add-hook 'after-init-hook 'save-place-mode)
(add-hook 'after-init-hook 'recentf-mode)

(add-hook 'clojure-mode-hook 'aggressive-indent-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'cider-mode)

(add-hook 'cperl-mode-hook
          (lambda ()
            (define-key cperl-mode-map (kbd "RET") 'newline-and-indent)
            (local-set-key "%" 'self-insert-command)
            (c-set-offset 'inline-open 0)
            (setq cperl-indent-parens-as-block t)
            (setq cperl-close-paren-offset -4)
            (setq cperl-indent-level 4)
            (setq cperl-continued-statement-offset 4)
            (setq cperl-continued-brace-offset 0)
            (setq cperl-brace-offset -4)
            (setq cperl-brace-imaginary-offset 0)
            (setq cperl-label-offset -2)))

(add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(add-hook 'flycheck-mode-hook
          (lambda ()
            (setq flycheck-emacs-lisp-load-path 'inherit)))

(add-hook 'lisp-mode-hook 'aggressive-indent-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)

(add-hook 'recentf-mode-hook
          (lambda ()
            (setq recentf-auto-cleanup 'never
                  recentf-max-menu-items 40
                  recentf-max-saved-items 100
                  recentf-exclude '("\\.ido\\.last" "/recentf$"
                                    ".emacs.d/elpa/"))))

(add-hook 'server-done-hook 'delete-frame)
(add-hook 'server-done-hook
          (lambda ()
            (kill-buffer nil)))

(provide 'hooks)
;;; hooks.el ends here
