;;; init-prog-snippet.el --- init Programming snippet engines

;;; Commentary:


;;; Code:

;;; [ YASnippet ] --- (template/snippet engine)

(use-package yasnippet
  :ensure t
  :defer t
  :delight yas-minor-mode
  ;; auto set major mode: snippet-mode.
  :mode (("\\.snippet$" . snippet-mode)
         ("\\.yasnippet$" . snippet-mode))
  :init (yas-global-mode 1)
  :config
  ;; indent
  (setq yas-indent-line 'auto) ; 'auto, 'fixed
  (setq yas-also-auto-indent-first-line nil)
  ;; Python indent issue
  (add-hook 'python-mode-hook
            (lambda ()
              (make-local-variable 'yas-indent-line)
              (setq yas-indent-line 'fixed)))

  ;; wrap around region
  (setq yas-wrap-around-region t) ; snippet $0 field expansion wraps around selected region.
  ;; stacked expansion
  (setq yas-triggers-in-field t) ; allow stacked expansions (snippets inside field).
  (setq yas-snippet-revival t) ; re-activate snippet field after undo/redo.

  ;; (setq yas-key-syntaxes '("w" "w_" "w_." "w_.()" yas-try-key-from-whitespace))

  ;; for `yas-choose-value'.
  ;; (setq yas-prompt-functions )

  ;; turn of auto-fill for long length code
  (add-hook 'snippet-mode #'turn-off-auto-fill)

  ;; Faces
  (set-face-attribute 'yas-field-highlight-face nil
                      :inherit 'highlight
                      :foreground nil :background nil
                      :box '(:color "dim gray" :line-width 1))
  
  ;; (define-key yas-minor-mode-map [tab] 'yas-expand)
  ;; (define-key yas-minor-mode-map (kbd "TAB") 'indent-for-tab-command)
  (define-key yas-minor-mode-map (kbd "C-c \\") 'yas-insert-snippet)
  )

(use-package yasnippet-snippets
  :ensure t)

;;; [ ivy-yasnippet ] -- preview yasnippet snippets with Ivy.

(use-package ivy-yasnippet
  :ensure t
  :defer t
  :bind (:map yas-minor-mode-map ([remap yas-insert-snippet] . ivy-yasnippet)))


(provide 'init-prog-snippet)

;;; init-prog-snippet.el ends here
