;;; init-ivy.el --- init for Ivy-mode
;;; -*- coding: utf-8 -*-

;;; Commentary:



;;; Code:

;;; [ ivy ]

(use-package ivy
  :ensure t
  :ensure ivy-hydra ; [C-o], [M-o]
  :defer t
  :delight ivy-mode
  :init (ivy-mode 1)
  (setq ivy-use-virtual-buffers t ; treat recentf, bookmarks as virtual buffers.
        ivy-virtual-abbreviate 'full ; use 'full to fix bookmarks uniquify issue.
        ivy-height 7
        ;; ivy-fixed-height-minibuffer t
        ivy-display-style 'fancy
        ivy-initial-inputs-alist nil ; remove initial ^ input.
        ;; ivy-extra-directories '() ; remove . and .. directory.
        )
  :config
  (set-face-attribute 'ivy-current-match nil ; selection
                      :background nil :foreground nil
                      :weight 'normal
                      :box t)
  (set-face-attribute 'ivy-minibuffer-match-highlight nil ; highlighting the match under the cursor
                      :background "light gray" :foreground "black"
                      :weight 'normal)
  (set-face-attribute 'ivy-minibuffer-match-face-1 nil ; the text between multiple matches
                      :foreground (face-attribute 'default :foreground)
                      :overline "dim gray"
                      ;; :strike-through nil
                      :weight 'normal)
  (set-face-attribute 'ivy-minibuffer-match-face-2 nil ; only one match
                      :foreground (face-attribute 'default :foreground)
                      :underline "red"
                      :weight 'normal)
  (set-face-attribute 'ivy-minibuffer-match-face-3 nil ; the first match in multiple matches
                      :background " " :underline "orange"
                      :weight 'normal)
  (set-face-attribute 'ivy-minibuffer-match-face-4 nil ; the second match in multiple matches
                      :background " " :underline "yellow"
                      :weight 'normal)
  )

;;; improve Emacs performance like `company-mode'.
;;;
;; (defun ivy-mode-toggle-advice (origin-func prefixarg &optional command-name typed)
;;   (interactive "r")
;;   (ivy-mode 1)
;;   (call-interactively origin-func)
;;   (ivy-mode -1))
;; (advice-add 'execute-extended-command :around #'ivy-mode-toggle-advice)
;; (advice-remove 'execute-extended-command #'ivy-mode-toggle-advice)

;;; [ ivy-rich ] -- More friendly display transformer for ivy.

;; (use-package ivy-rich
;;   :ensure t
;;   :defer t
;;   :commands (ivy-rich-mode)
;;   :init (ivy-rich-mode 1)
;;   (setq ivy-format-function #'ivy-format-function-line))

;;; [ counsel ]

(use-package counsel
  :ensure t
  :defer t
  :delight counsel-mode
  :bind (([remap yank-pop] . counsel-yank-pop)
         ([remap menu-bar-open] . counsel-tmm) ; [F10] text menu access
         ([remap apropos] . counsel-apropos)
         ("C-x c p" . counsel-list-processes) ; [C-x c p]
         ("C-x c t" . cancel-function-timers) ; [C-x c t]
         ("C-x c c" . counsel-colors-emacs)
         ("C-x c C" . counsel-colors-web)
         ("C-x RET v" . counsel-set-variable) ; [C-x RET v]
         ("C-x RET u" . counsel-unicode-char) ; [C-x RET u]
         ([remap switch-to-buffer] . ivy-switch-buffer) ; [C-x b]
         ("M-t" . counsel-git) ; [M-t]
         ("C-c v g g" . counsel-git-grep)
         ([remap grep] . counsel-grep) ; [C-s g]
         ;; ("" . counsel-switch-to-shell-buffer) ; switch to a shell buffer, or create one
         ;; ([remap org-goto] . counsel-org-goto) ; [C-c C-j] completion for Org headings
         ;; ( . counsel-org-goto-all) ; completion for Org headings in all open buffers
         ;; ([remap org-set-tags-command] . counsel-org-tag) ; [C-c C-q]
         ;; ([remap org-agenda-set-tags] . counsel-org-tag-agenda) ; [:]
         ;; ([remap org-capture] . counsel-org-capture)
         ([remap org-attach-open] . counsel-org-file) ; browse all attachments for the current Org file
         ([remap locate] . counsel-locate)
         ("C-x c #" . counsel-linux-app)
         ;; :map read-expression-map ("C-r" . counsel-minibuffer-history) ; in [M-:]
         ;; :map ivy-minibuffer-map ("M-y" . ivy-next-line)
         )
  :preface (unless (boundp 'search-prefix) (define-prefix-command 'search-prefix))
  (define-key search-prefix (kbd "M-g") 'counsel-grep)
  (define-key search-prefix (kbd "M-r") 'counsel-rg) ; [C-u] prompt for dir support
  :init (setq counsel-mode-override-describe-bindings t)
  (counsel-mode 1))

;;; [ ivy-posframe ] -- Using posframe to show Ivy.

;; (use-package ivy-posframe
;;   :ensure t
;;   :after ivy
;;   :config
;;   (setq ivy-posframe-style 'window-bottom-left
;;         ivy-fixed-height-minibuffer nil)
;;   ;;; replace ivy default with posframe
;;   (setq ivy-display-function #'ivy-posframe-display)
;;   ;; replace some specific commands
;;   (push '(counsel-M-x . ivy-posframe-display-at-window-bottom-left)
;;         ivy-display-functions-alist)
;;   (push '(completion-at-point . ivy-posframe-display-at-point)
;;         ivy-display-functions-alist)
;;   (push '(complete-symbol . ivy-posframe-display-at-point)
;;         ivy-display-functions-alist)
;;   ;; posframe doesn't work well with async sources
;;   (push '(swiper . ivy-posframe-display-at-window-bottom-left)
;;         ivy-display-functions-alist)
;;   (push '(counsel-org-goto . ivy-posframe-display-at-window-bottom-left)
;;         ivy-display-functions-alist)
;;   ;; fallback mode
;;   (push '(t . ivy-posframe-display-at-point) ivy-display-functions-alist)
;;
;;   (ivy-posframe-enable)
;;   ;; set ivy-posframe frame parameters
;;   (setq ivy-posframe-hide-minibuffer t
;;         ivy-posframe-parameters `((min-width . 95)
;;                                   (min-height . ,ivy-height)
;;                                   (internal-border-width . 5)
;;                                   (left-fringe . ,left-fringe-width) ; 0
;;                                   (right-fringe . ,right-fringe-width) ; 0
;;                                   )
;;         ;; ivy-posframe-width (/ (display-pixel-width) 14)
;;         )
;;   ;; set ivy-posframe face
;;   (set-face-attribute 'ivy-posframe nil
;;                       :foreground (face-foreground 'default)
;;                       :background (cl-case (alist-get 'background-mode (frame-parameters))
;;                                     ('light
;;                                      (color-darken-name (face-background 'default) 10))
;;                                     ('dark
;;                                      (color-lighten-name (face-background 'default) 10))))
;;
;;   ;; set internal border
;;   (setq ivy-posframe-border-width 1)
;;   (set-face-attribute 'internal-border nil :background "gray50"))


(provide 'init-ivy)

;;; init-ivy.el ends here
