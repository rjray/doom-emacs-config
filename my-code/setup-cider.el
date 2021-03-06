;;; setup-cider --- Loading and configuration of CIDER

;;; Commentary:

;;; Code:

(require 'cider)

(setq
 nrepl-hide-special-buffers t
 cider-auto-select-error-buffer t
 cider-repl-display-in-current-window t
 cider-repl-history-size 1000)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(provide 'setup-cider)
;;; setup-cider.el ends here
