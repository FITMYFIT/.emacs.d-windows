;;; init-prog-document-api.el --- init for API
;;; -*- coding: utf-8 -*-

;;; Commentary:



;;; Code:

;;; [ dash-docs ] -- Offline documentation browser using Dash docsets.

(use-package dash-docs
  :ensure t
  :defer t
  :init (setq dash-docs-docsets-path (expand-file-name "~/.docsets")
              dash-docs-min-length 3
              ;; 'eww-browse-url, 'browse-url, 'browse-url-generic, 'helm-browse-url
              dash-docs-browser-func 'browse-url-generic
              dash-docs-candidate-format "%d  %n  (%t)"
              dash-docs-enable-debugging nil)
  ;; (setq dash-docs-common-docsets ; it will DUPLICATE with major mode docsets.
  ;;       '("Clojure" "Java"
  ;;         ;; "Common Lisp"
  ;;         ;; "Python 3"
  ;;         "HTML" "CSS"
  ;;         "JavaScript" "NodeJS"))
  )

;;; [ helm-dash ] -- Offline documentation browser for +150 APIs using Dash docsets.

(use-package helm-dash
  :ensure t
  :bind (:map document-prefix ("d" . helm-dash-at-point) ("M-d" . helm-dash))
  :init (setq helm-case-fold-search 'smart)

  ;; buffer local docsets
  (defun my-helm-dash-buffer-local-docsets-add (docsets-list)
    (mapc
     (lambda (docset)
       (setq-local dash-docs-docsets (add-to-list 'dash-docs-docsets docset)))
     docsets-list))
  
  ;; C
  (defun helm-dash-buffer-local-C-docsets ()
    (setq-local dash-docs-docsets '("C"))
    (my-helm-dash-buffer-local-docsets-add '("GNU Make" "CMake" "LLVM" "Clang" "GLib")))
  (add-hook 'c-mode-hook 'helm-dash-buffer-local-C-docsets)
  ;; C++
  (defun helm-dash-buffer-local-C++-docsets ()
    (setq-local dash-docs-docsets '("C++")))
  (add-hook 'c++-mode-hook 'helm-dash-buffer-local-C++-docsets)
  )


;;; [ zeal-at-point ]

;; (use-package zeal-at-point
;;   :ensure t
;;   :defer t
;;   :bind (:map document-prefix
;;               ("C-d" . zeal-at-point))
;;   :init
;;   (setq zeal-at-point-zeal-version "0.3.0")
;;   :config
;;   ;; multiple docsets search
;;   (add-to-list 'zeal-at-point-mode-alist
;;                '(clojurescript-mode . ("clojure" "clojurescript")))
;;   (add-to-list 'zeal-at-point-mode-alist
;;                '(enh-ruby-mode . ("ruby" "rails")))
;;   (add-to-list 'zeal-at-point-mode-alist
;;                '(python-mode . ("python" "django")))
;;   (add-hook 'web-mode-hook
;;             (lambda ()
;;               (setq-local zeal-at-point-docset '("javascript" "html" "css"))))
;;   (add-hook 'projectile-rails-mode-hook
;;             (lambda ()
;;               (setq zeal-at-point-docset '("rails" "javascript" "html" "css"))))
;;   )


(provide 'init-prog-document-api)

;;; init-prog-document-api.el ends here
