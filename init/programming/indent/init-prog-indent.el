;;; init-prog-indent.el --- indent init for programming

;;; Commentary:


;;; Code:

;;; [ Tab ]

;;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
;;; Tab length
(setq-default tab-width 2
              standard-indent 2)
(setq-default tab-stop-list (number-sequence 2 120 2))

(use-package cc-mode
  :defer t
  :init (setq c-basic-offset 2))

;;; [ electric-indent-mode ]

(electric-indent-mode t)


;;; [ custom indent functions ]

(global-set-key (kbd "C-c >")
                (lambda (start end)
                  (interactive "rP")
                  (indent-rigidly-right-to-tab-stop start end)))

(global-set-key (kbd "C-c <")
                (lambda (start end)
                  (interactive "rP")
                  (indent-rigidly-left-to-tab-stop start end)))

;;; [ indent-guide ]

(use-package indent-guide
  :ensure t
  :defer t
  :delight indent-guide-mode
  :init (indent-guide-global-mode)
  (setq indent-guide-recursive t
        ;; - 0 to avoid zero-column guide line.
        ;; - -1 to show all indent lines.
        indent-guide-threshold 0
        ;; indent-guide-delay 0.1
        )

  ;; custom indent line char
  ;; 1: use `indent-guide-char'.
  ;; │ ┃  ▍ ┇ ┋ ┊ ┆ ╽ ╿
  (setq indent-guide-char "┃")
  ;; (setq indent-guide-char ":")
  )


;;; [ aggressive-indent-mode ]

(use-package aggressive-indent
  :ensure t
  :defer t
  :delight aggressive-indent-mode
  :commands (aggressive-indent-mode)
  :custom (global-aggressive-indent-mode nil)
  :init (setq aggressive-indent-sit-for-time 0.1)
  
  (defun my/aggressive-indent-enable ()
    (unless (or (member major-mode aggressive-indent-excluded-modes)
                (member major-mode aggressive-indent-dont-electric-modes))
      (aggressive-indent-mode 1)))
  (add-hook 'prog-mode-hook #'my/aggressive-indent-enable)

  :config
  (add-to-list 'aggressive-indent-excluded-modes 'python-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'haskell-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'lua-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'coq-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'snippet-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'cider-repl-mode)

  (add-to-list 'aggressive-indent-dont-electric-modes 'python-mode)

  ;; The variable `aggressive-indent-dont-indent-if' lets you customize when you
  ;; **don't** want indentation to happen.  For instance, if you think it's
  ;; annoying that lines jump around in `c++-mode' because you haven't typed the
  ;; `;' yet, you could add the following clause:
  (add-to-list 'aggressive-indent-dont-indent-if
               '(and (derived-mode-p 'c++-mode)
                     (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                                         (thing-at-point 'line)))))
  )


(provide 'init-prog-indent)

;;; init-prog-indent.el ends here
