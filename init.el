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
(setq inhibit-startup-echo-area-message "Hacking happy! Richard.")
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
(require 'init-emacs-customize)


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

(unless (boundp 'build-system-prefix)
  (define-prefix-command 'build-system-prefix))
(global-set-key (kbd "<f6>") 'build-system-prefix)

(require 'init-make)
(require 'init-cmake)

;;; [ build-helper ] -- Utilities to help build code.
(use-package build-helper
  :ensure t
  :defer t
  :bind (:map build-system-prefix
              ("<f5>" . compile)
              ("<f7>" . build-helper-run)
              ("<f8>" . build-helper-re-run)))

(require 'init-prog-lint)
(require 'init-prog-debug)
(require 'init-prog-test)
(require 'init-prog-project)
(require 'init-prog-vcs)
(require 'unicad);;used to show chineses characteristics

;;; Programming Languages
(require 'init-prog-lang-C-common)

;;(pdf-tools-install)
(pdf-loader-install)
;;(eval-after-load 'org '(require 'org-pdfview))

(require 'init-org)

;;(add-to-list 'exec-path "C:/msys64/mingw64/bin/")
;;(setq ispell-program-name "hunspell")

(custom-set-variables
 ;;'(ispell-dictionary "british")
 '(ispell-program-name "C:/msys64/mingw64/bin/hunspell.exe"))
;;(add-to-list 'org-file-apps '("\\.pdf\\'" . (lambda (file link) (org-pdfview-open link))))
(require 'init-prog-lang-tex)



(unless (boundp 'prog-tools-prefix)
  (define-prefix-command 'prog-tools-prefix))
(global-set-key (kbd "C-c t") 'prog-tools-prefix)



;; (defun RichardLIU-splash-animation ()
;;   "Show ASCII animation."
;;   (animate-sequence '("Fuck this shit world!"
;;                       "Author: RichardLIU"
;;                       "Date: 2011/10/0 (yes, day 0!)") 0)
;;   (kill-buffer "*Animation*"))
;; (add-hook 'after-init-hook #'RichardLIU-splash-animation)

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


(add-to-list 'auto-mode-alist '("\\.dat\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.plt\\'" . gnuplot-mode));;set org-mode of .dat files 20191030
;; (require 'linum)
;; (global-linum-mode t);;show line number
;; (global-auto-revert-mode t);;reload files if corrected

;;(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;;rewrite the selection
(delete-selection-mode t)

;;high light the current line
(global-hl-line-mode t)

;;disable auto backup
(setq make-backup-files nil)

(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


;;for theme
(load-theme 'monokai t)


;;定位到我想要的文件件目录 for windows
(defconst my-projects-pathd "d:/")
(defun god ()
  (interactive)
  (dired my-projects-pathd))

(defun goe ()
  (interactive)
  (dired my-projects-pathe)) 
(defconst my-projects-pathe "e:/")

(defun gof ()
  (interactive)
  (dired my-projects-pathf)) 
(defconst my-projects-pathf "f:/")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; init.el ends here
