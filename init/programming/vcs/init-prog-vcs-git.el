;;; init-prog-vcs-git.el --- init Git for Emacs
;;
;;; Commentary:

;;; Code:


(unless (boundp 'prog-vcs-git-prefix)
  (define-prefix-command 'prog-vcs-git-prefix))
(define-key 'prog-vcs-prefix (kbd "g") 'prog-vcs-git-prefix)


;; [ Git modes ] -- front end wrapper for vc-git.

(use-package gitconfig-mode
  :ensure t
  :defer t
  :mode ("\\.gitconfig\\'" . gitconfig-mode))
(use-package gitattributes-mode
  :ensure t
  :defer t)
(use-package gitignore-mode
  :ensure t
  :defer t
  :mode ("\\.gitignore\\'" . gitignore-mode))

;;; [ gitignore-templates ] -- Access GitHub .gitignore templates.

(use-package gitignore-templates
  :ensure t
  :defer t
  :commands (gitignore-templates-insert gitignore-templates-new-file)
  :preface
  (unless (boundp 'gitignore-template-prefix)
    (define-prefix-command 'gitignore-template-prefix))
  (define-key prog-vcs-prefix (kbd "t") 'gitignore-template-prefix)
  :bind (:map gitignore-template-prefix
              ("t" . gitignore-templates-insert)
              ("n" . gitignore-templates-new-file)))

(use-package git-commit ; edit Git commit messages.
  :ensure t
  :defer t
  :init
  ;; `company-dabbrev' in git commit buffer.
  ;; https://github.com/company-mode/company-mode/issues/704
  (defun my:company-dabbrev-ignore-except-magit-diff (buffer)
    (let ((name (buffer-name)))
      (and (string-match-p "\\`[ *]" name)
           (not (string-match-p "\\*magit-diff:" name)))))
  (defun my:git-commit-setup-hook ()
    (setq-local fill-column 72)
    (auto-fill-mode t)
    (setq-local company-dabbrev-code-modes '(text-mode magit-diff-mode))
    (setq-local company-dabbrev-ignore-buffers
                #'my:company-dabbrev-ignore-except-magit-diff)
    (setq company-dabbrev-code-other-buffers 'all)
    (flyspell-mode)
    (setq-local company-backends
                '(company-dabbrev-code
                  :with company-abbrev                  
                  :separate company-ispell)))
  (add-hook 'git-commit-setup-hook #'my:git-commit-setup-hook))

;;; [ Magit ]

(use-package magit
  :ensure t
  :defer t
  :commands (magit-status)
  :bind (:map prog-vcs-prefix
              ("v" . magit-status)
              ("l" . magit-list-repositories)

              :map prog-vcs-git-prefix
              ("F" . magit-log-buffer-file)
              ("b" . magit-blame-popup)
              ("v" . magit-status)
              ("s" . magit-stage)
              ("c" . magit-commit-create)
              ("C" . magit-commit-amend)
              ("d" . magit-diff)
              ("l" . magit-log)
              ("o" . magit-checkout)
              ("M-b" . magit-bisect)
              ("B" . magit-blame)
              ("f" . magit-file-popup))
  :init
  (defalias 'magit-log-region 'magit-log-buffer-file)
  (define-key prog-vcs-git-prefix (kbd "r") 'magit-log-region)
  
  ;; Performance
  ;; (setq magit-refresh-status-buffer nil)
  (setq auto-revert-buffer-list-filter 'magit-auto-revert-repository-buffer-p)

  (setq magit-clone-default-directory (expand-file-name "~/Code"))
  (setq magit-repository-directories
        `((,user-emacs-directory . 0)
          ("~/Code/" . 3)
          ("~/Org/Website" . 1)))
  
  ;; let magit status buffer display in current window.
  (setq magit-display-buffer-function 'display-buffer)
  ;; show gravatar in Magit revision.
  (setq magit-revision-show-gravatars '("^Author:     " . "^Commit:     "))
  
  :config
  ;; Git WIP (work in progress) in Magit
  (add-to-list 'magit-no-confirm 'safe-with-wip)

  ;; manage popup buffers.
  (add-to-list 'display-buffer-alist
               '("\\`magit:.*\\'" (display-buffer-reuse-window display-buffer-same-window)))
  (add-to-list 'display-buffer-alist
               '("^magit-diff.*" (display-buffer-below-selected)))
  (add-to-list 'display-buffer-alist
               '("^magit-revision.*" (display-buffer-below-selected)))
  (add-to-list 'display-buffer-alist
               '("^magit-log.*" (display-buffer-same-window)))
  (add-to-list 'display-buffer-alist
               '("^magit-process.*" (display-buffer-same-window))))

;;; [ magit-gitflow ] -- Git Flow plugin for magit

(use-package magit-gitflow
  :ensure t
  :defer t
  :after magit
  :init (add-hook 'magit-status-mode-hook 'turn-on-magit-gitflow))

;;; [ git-messenger ] -- popup commit message at current line.

(use-package git-messenger
  :ensure t
  :defer t
  :bind (:map prog-vcs-prefix
              ("m m" . git-messenger:popup-message)
              :map git-messenger-map
              ("m" . git-messenger:copy-message)
              ("c" . git-messenger:copy-message))
  :init (setq git-messenger:show-detail t ; always show detail message.
              ;; git-messenger:handled-backends '(git svn)
              git-messenger:use-magit-popup t))

;;; [ magit-diff-flycheck ] -- Flycheck for Magit diff buffers!

(use-package magit-diff-flycheck
  :ensure t
  :defer t
  :commands (magit-diff-flycheck))

;;; [ forge ] -- Work with Git forges, such as Github and Gitlab, from the comfort of Magit and the rest of Emacs.

(use-package forge
  :ensure t
  :defer t)



(provide 'init-prog-vcs-git)

;;; init-prog-vcs-git.el ends here
