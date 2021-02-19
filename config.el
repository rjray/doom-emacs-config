;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Randy J. Ray"
      user-mail-address "rjray@blackperl.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Deja Vu Sans Mono" :size 12 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Deja Vu Sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-spacegrey)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; The "base" part of system-name, without the domain.
(defconst *system-name*
  (if (string-match "^\\([a-zA-Z0-9_-]+\\)\\." (system-name))
      (match-string 1 (system-name))
    (system-name))
  "Host name without the domain.")

;; If there is a directory under ~/.doom.d named for this host, load all *.el
;; files within it:
(let ((hostdir (concat doom-private-dir *system-name*)))
  (when (file-directory-p hostdir)
    (dolist (host-el-file (directory-files hostdir t "\\.el$"))
      (load-file host-el-file))))

;; Don't care for typing out "yes" and "no" all the time...
(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default
 confirm-kill-emacs nil
 default-case-fold-search nil
 tramp-default-method "ssh"
 fill-column 79
 show-trailing-whitespace t
 transient-mark-mode t

 ;; Backup stuff
 backup-inhibited t
 make-backup-files nil
 auto-save-default nil
 auto-save-list-file-name nil
 delete-auto-save-files t

 ;; How to uniquify similar buffer names
 uniquify-buffer-name-style 'forward

 ;; Inhibit "magic" mode selection
 magic-mode-alist nil

 ;; No double-spaces when I fill a paragraph
 sentence-end-double-space nil

 ;; Show indication of the buffer size (right before the line/col)
 size-indication-mode t

 ;; Tabs and lines
 tab-width 4
 indent-tabs-mode nil)

;; Set-up for desktop-save-mode
(require 'desktop)
(setq desktop-save t
      desktop-restore-eager 5
      desktop-globals-to-save (append '((extended-command-history . 30)
                                        (file-name-history        . 100)
                                        (grep-history             . 30)
                                        (compile-history          . 30)
                                        (minibuffer-history       . 50)
                                        (query-replace-history    . 60)
                                        (read-expression-history  . 60)
                                        (regexp-history           . 60)
                                        (regexp-search-ring       . 20)
                                        (search-ring              . 20)
                                        (shell-command-history    . 50)
                                        tags-file-name
                                        register-alist)))
(desktop-save-mode 1)

;; Whitespace
(require 'whitespace)
(setq whitespace-style '(face tabs lines-tail))

;; Chrome
(scroll-bar-mode -1)

;; Extra files:
(load! "my-code/setup-cider.el")
(load! "my-code/setup-magit.el")
(load! "my-code/keys.el")
(load! "my-code/hooks.el")
