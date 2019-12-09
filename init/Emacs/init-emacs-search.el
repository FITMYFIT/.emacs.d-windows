;;; init-emacs-search.el --- init search utilities for Emacs.
;;; -*- coding: utf-8 -*-

;;; Commentary:



;;; Code:

(unless (boundp 'search-prefix)
  (define-prefix-command 'search-prefix))
(global-set-key (kbd "C-c s") 'search-prefix)

(require 'init-emacs-search-isearch)
(require 'init-emacs-search-grep)

(use-package helm-swoop
  :ensure t
  :bind ("C-c s h" . helm-swoop))


(provide 'init-emacs-search)

;;; init-emacs-search.el ends here
