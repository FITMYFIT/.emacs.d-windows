;;; init.el --- --- user init file  -*- no-byte-compile: t -*-

;;; Commentary:


;;; Code:

;;; load ahead

;;; increase GC at Emacs startup to speedup.
(setq emacs-start-time (float-time))
(setq gc-cons-threshold 8000000)
(add-hook
 'after-init-hook
 (lambda ()
   (setq gc-cons-threshold (car (get 'gc-cons-threshold 'standard-value)))))


;;; [ splash ]
(setq fancy-splash-image ; for `fancy-splash-head'
      (expand-file-name "resources/logos/my-emacs-logo.png" user-emacs-directory))
;; (setq fancy-startup-text)

;;; initial message
(setq inhibit-startup-echo-area-message "Hacking happy! stardiviner.")
(setq-default initial-scratch-message
              (concat ";; Happy Hacking " (or user-login-name "") "!\n\n"))



;;; add my init files directory

(add-to-list 'load-path "/usr/share/emacs/site-lisp/") ; for compiled version Emacs load system installed Emacs related packages.

(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))
;; recursively load init files.
(let ((default-directory "~/.emacs.d/init/"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ; shadow
           (append
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))

(setq load-prefer-newer t)


;;; [ package manager ]

(require 'init-package)


;;; debug, profiling etc

(require 'init-emacs-profiler)
;; (require 'init-emacs-benchmark)


;;; my custom functions

(use-package dash
  :ensure t
  :config
  (with-eval-after-load "dash"
    (dash-enable-font-lock)))

(require 'init-library)
(require 'init-functions)


;;; Emacs
(require 'init-emacs-environment)
(require 'init-emacs-settings)
(require 'init-emacs-theme)
(require 'init-emacs-appearance)
(require 'init-emacs-mode-line)
(require 'init-emacs-completion)
(require 'init-emacs-minibuffer)
(require 'init-emacs-buffer)
(require 'init-emacs-window)
(require 'init-emacs-clipboard)
(require 'init-emacs-keybinding)
(require 'init-emacs-abbrev)
(require 'init-emacs-search)
(require 'init-emacs-highlight)
(require 'init-emacs-regex)
(require 'init-emacs-vcs)
(require 'init-emacs-shell)
(require 'init-emacs-comint)
(require 'init-emacs-subprocess)
;; (require 'init-emacs-rpc)
(require 'init-emacs-network)
;; (require 'init-emacs-xwidget)
(require 'init-emacs-customize)
(require 'init-emacs-accessibility)


;;; Programming
(require 'init-prog-programming)
(require 'init-prog-code)
(require 'init-prog-comment)
(require 'init-prog-electric)
(require 'init-prog-indent)
(require 'init-prog-folding)
(require 'init-prog-complete)
(require 'init-prog-sense)
;; (require 'init-prog-parser)
;;; fix issue which `company-rtags' backend is before `company-irony'.
(require 'init-prog-snippet)
(require 'init-prog-sidebar)
(require 'init-prog-document)
(require 'init-prog-compile)
(require 'init-prog-build-system)
(require 'init-prog-lint)
(require 'init-prog-debug)
(require 'init-prog-test)
(require 'init-prog-project)
(require 'init-prog-vcs)


;;; Programming Languages
(require 'init-prog-lang-C-common)
(require 'init-prog-tags)


;;; Programming Tools

(unless (boundp 'prog-tools-prefix)
  (define-prefix-command 'prog-tools-prefix))
(global-set-key (kbd "C-c t") 'prog-tools-prefix)



;; (defun stardiviner-splash-animation ()
;;   "Show ASCII animation."
;;   (animate-sequence '("Fuck this shit world!"
;;                       "Author: stardiviner"
;;                       "Date: 2011/10/0 (yes, day 0!)") 0)
;;   (kill-buffer "*Animation*"))
;; (add-hook 'after-init-hook #'stardiviner-splash-animation)

;;; [ playground ] -- Manage sandboxes for alternative Emacs configurations.

;; (use-package playground
;;   :ensure t
;;   :defer t
;;   :commands (playground-checkout playground-checkout-with-options))

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;;; init.el ends here
