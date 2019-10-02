;;; init-prog-complete.el --- init for Programming Completion
;;; -*- coding: utf-8 -*-

;;; Commentary:



;;; Code:


;;; [ pcomplete ] --- Programmable, Context-Sensitive Completion Library

(use-package pcomplete
  :init (setq pcomplete-ignore-case t))


(require 'init-auto-complete)
(require 'init-company-mode)


(provide 'init-prog-complete)

;;; init-prog-complete.el ends here
