;;; init-company-mode.el --- init company-mode
;;; -*- coding: utf-8 -*-

;;; Commentary:



;;; Code:

;;; [ Company Mode ]

(use-package company
  :ensure t
  :defer t
  :delight company-mode
  ;; disable `company-mode' in `org-mode' for performance.
  ;; :preface (setq company-global-modes '(not org-mode))
  :commands (global-company-mode)
  :init (global-company-mode 1)
  (setq company-minimum-prefix-length 3
        ;; decrease this delay when you can type code continuously fast.
        company-idle-delay 0.3
        company-tooltip-idle-delay 0.5
        company-echo-delay 0 ; remove annoying blink
        ;; determine which characters trigger auto-completion the selected candidate.
        company-auto-complete nil ; nil: don't auto select the first candidate when input `company-auto-complete-chars'.
        ;; '(?_ ?\( ?w ?. ?\" ?$ ?\' ?/ ?| ?! ?#)
        company-auto-complete-chars '(?\  ?\) ?. ?#)
        ;; company-require-match 'company-explicit-action-p ; 'never
        company-tooltip-align-annotations t ; align annotations to the right tooltip border.
        company-tooltip-flip-when-above nil
        company-tooltip-limit 10 ; tooltip candidates max limit
        company-tooltip-minimum 3 ; minimum candidates height limit
        ;; company-tooltip-minimum-width 0 ; the minimum width of the tooltip's inner area
        company-tooltip-margin 1 ; width of margin columns to show around the tooltip
        company-selection-wrap-around t ; loop over candidates
        company-search-regexp-function #'company-search-flex-regexp)

  ;; `company-mode' frontend showing the selection as if it had been inserted.
  ;; (add-to-list 'company-frontends 'company-preview-frontend)

  
  ;; company-tabnine: A company-mode backend for TabNine, the all-language autocompleter.
  ;; (use-package company-tabnine
  ;;   :ensure t
  ;;   ;; :init (add-to-list 'company-backends #'company-tabnine)
  ;;   ;; (company-tng-configure-default)
  ;;   :config
  ;;   ;; The free version of TabNine is good enough,
  ;;   ;; and below code is recommended that TabNine not always
  ;;   ;; prompt me to purchase a paid version in a large project.
  ;;   (defadvice company-echo-show (around disable-tabnine-upgrade-message activate)
  ;;     (let ((company-message-func (ad-get-arg 0)))
  ;;       (when (and company-message-func
  ;;                  (stringp (funcall company-message-func)))
  ;;         (unless (string-match "The free version of TabNine only indexes up to" (funcall company-message-func))
  ;;           ad-do-it)))))

  (setq-default company-backends
                `((company-capf         ; `completion-at-point-functions'
                   ;; ,(if (featurep 'company-tabnine)
                   ;;      'company-tabnine)
                   ;; :with company-semantic
                   ;; company-gtags company-etags
                   :separate company-yasnippet
                   :separate company-tempo  ; tempo: flexible template insertion
                   :separate company-keywords
                   :separate company-abbrev)
                  company-dabbrev-code
                  company-files
                  company-ispell))
  
  :config
  (defun my-company-add-backend-locally (backend)
    "Add a backend in my custom way.

\\(my-company-add-backend-locally 'company-robe\\)"
    (make-local-variable 'company-backends)
    (unless (eq (car (car company-backends)) backend)
      (setq-local company-backends
                  (cons (cons backend (cons ':with (car company-backends)))
                        (cdr company-backends)))))

  ;; [ company-ispell ]
  ;; (setq company-ispell-dictionary "/usr/share/dict/words")
  ;; (add-to-list 'company-backend 'company-ispell)
  ;; hide `company-ispell' echo message "Starting 'look' process".
  (use-package shut-up
    :ensure t
    :init
    (advice-add 'ispell-lookup-words :around
                (lambda (orig &rest args)
                  (shut-up (apply orig args)))))
  
  ;; keybindings

  ;; manually start completion (don't globally set, conflict with auto-complete
  ;; in some modes which use auto-complete)
  ;;
  ;; (global-set-key (kbd "<tab>") 'company-indent-or-complete-common)
  ;; (define-key company-mode-map (kbd "<tab>") 'company-complete)
  ;; (define-key company-mode-map (kbd "TAB") 'company-complete)
  ;; (define-key company-mode-map [tab] 'company-complete)
  
  (define-key company-mode-map (kbd "C-M-i") 'company-complete)
  (define-key company-mode-map (kbd "M-<tab>") 'company-complete)

  ;; yasnippet
  ;; `yas-expand', `yas-expand-from-trigger-key'
  (define-key company-active-map [tab] 'yas-expand-from-trigger-key)

  ;; navigation
  (define-key company-active-map "\t" nil)
  (define-key company-active-map [tab] nil)
  (define-key company-active-map (kbd "<tab>") 'company-select-next)
  (define-key company-active-map (kbd "<S-tab>") 'company-select-previous)
  (define-key company-active-map (kbd "<return>") 'company-complete-selection)
  (define-key company-active-map (kbd "M-h") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "M-l") 'company-show-location)
  ;; (setq company-search-regexp-function #regexp-quote)
  (define-key company-active-map (kbd "C-s") 'company-search-candidates)
  (define-key company-active-map (kbd "C-M-s") 'company-filter-candidates)
  ;; nested searching map.
  (define-key company-search-map (kbd "M-g") 'company-search-toggle-filtering)
  (define-key company-search-map (kbd "C-g") 'company-search-abort)
  (define-key company-search-map (kbd "C-s") 'company-search-repeat-forward)
  (define-key company-search-map (kbd "C-r") 'company-search-repeat-backward)
  (define-key company-search-map (kbd "C-n") 'company-search-repeat-forward)
  (define-key company-search-map (kbd "C-p") 'company-search-repeat-backward)
  (define-key company-search-map (kbd "C-o") 'company-search-kill-others)

  ;; [ company-yasnippet ]
  ;; make `company-yasnippet' work for prefix like `%link_to'.
  ;; (setq-default yas-key-syntaxes (list "w_" "w_." "w_.()"
  ;;                                      #'yas-try-key-from-whitespace))

  ;; [ company-abbrev / company-dabbrev ]
  (setq company-dabbrev-other-buffers t)

  ;; [ company-tempo ]

  ;; [ company-etags ]
  (setq company-etags-modes nil) ; disable `company-etags'
  ;; enable to offer completions in comment and strings.
  ;; (setq company-etags-everywhere t)

  ;; [ company-transformers ]
  ;; NOTE: disable customize `company-transformers' to fix python-mode company candidates
  ;; sorting.
  ;; (setq company-transformers '(company-sort-by-backend-importance
  ;;                              company-sort-prefer-same-case-prefix))
  )


(add-to-list 'display-buffer-alist
             '("^\\*company-documentation\\*" . (display-buffer-below-selected)))

;;; [ company-quickhelp ] -- Popup documentation for completion candidates.

(use-package company-quickhelp
  :if (not (featurep 'company-box))
  :ensure t
  :after company
  :defer t
  :config (define-key company-active-map (kbd "M-h") 'company-quickhelp--show))

;;; [ company-mode in minibuffer `M-:' ]

(defun company-mode-minibuffer-setup ()
  "Setup company-mode in minibuffer."
  (company-mode 1)
  (setq-local company-tooltip-limit 4)
  (setq-local company-tooltip-minimum 1)
  (if (fboundp 'company-box-mode)
      (setq-local company-frontends '(company-box-frontend))
    (setq-local company-frontends '(company-pseudo-tooltip-frontend))))

(add-hook 'eval-expression-minibuffer-setup-hook 'company-mode-minibuffer-setup)

;;; [ company-box ] -- A company front-end with icons.

;; NOTE: Use `company-box' because it has better doc popup display then `popup'
;; and `company-quickhelp'.
;;
;; NOTE: `company-box' does not support [M-s] to search candidates.

;; (use-package company-box
;;   :ensure t
;;   :ensure all-the-icons
;;   :after (company all-the-icons)
;;   :defer t
;;   :commands (company-box-mode)
;;   :hook (company-mode . company-box-mode)
;;   :init (setq company-box-doc-enable nil ; disable auto `company-box-doc' timer.
;;               company-box-show-single-candidate t ; for still can use doc popup keybinding.
;;               company-box-doc-delay 0.5)
;;   :config
;;   (add-to-list 'company-box-frame-parameters '(internal-border-width . 2))
;;   (add-to-list 'company-box-frame-parameters '(border-color . "dim gray"))
;;
;;   (setq company-box-backends-colors
;;         '((company-capf . (:candidate "LightSeaGreen"))
;;           (company-keywords . (:icon "SlateBlue" :candidate "SlateBlue"))
;;           (company-files . (:candidate "CornflowerBlue"))
;;           (company-yasnippet . (:icon "DarkCyan"
;;                                       :candidate "DarkCyan" :annotation "SteelBlue"
;;                                       ;; :selected (:foreground "white")
;;                                       ))
;;           (company-tempo . (:candidate "chocolate"))
;;           (company-dabbrev . (:candidate "black"))
;;           (company-dabbrev-code . (:candidate "gray" :selected "gray"))
;;           ;; extra backends
;;           (company-elisp . (:icon "firebrick"))
;;           (sly-company . (:icon "RoyalBlue"))
;;           (company-slime . (:icon "RoyalBlue"))
;;           (geiser-company-backend . (:icon "SlateBlue"))
;;           (elpy-company-backend . (:icon "orange"))
;;           (company-robe . (:icon "red1"))
;;           (company-c-headers . (:icon "DarkGoldenrod"))
;;           (company-irony . (:icon "DodgerBlue"))
;;           (company-irony-c-headers . (:icon "DarkGoldenrod"))
;;           (company-go . (:icon "SandyBrown"))
;;           (company-racer . (:icon "SteelBlue"))
;;           (company-tern . (:icon "yellow3"))
;;           (company-lua . (:icon "LightBlue"))
;;           (company-edbi . (:icon "DarkGreen"))
;;           (company-restclient . (:icon "DarkTurquoise"))))
;;
;;   (setq company-box-icons-alist 'company-box-icons-all-the-icons)
;;  
;;   (setq company-box-icons-unknown
;;         (all-the-icons-faicon "code" :height 0.8 :v-adjust -0.05))
;;   (setq company-box-icons-yasnippet
;;         (all-the-icons-faicon "file-code-o" :height 0.8 :v-adjust -0.05))
;;   (setq company-box-icons-elisp
;;         (list
;;          ;; "λ" ; function/method
;;          (all-the-icons-material "functions" :height 0.8 :v-adjust -0.15)
;;          ;; (all-the-icons-faicon "hashtag" :height 0.8 :v-adjust -0.15)
;;          (all-the-icons-faicon "asterisk" :height 0.8 :v-adjust -0.15) ; variable
;;          (all-the-icons-octicon "package" :height 0.8 :v-adjust -0.05) ; library
;;          (all-the-icons-faicon "font" :height 0.8 :v-adjust -0.05) ; face
;;          ))
;;   (setq company-box-icons-lsp
;;         `((1 . ,(all-the-icons-faicon "file-text-o" :height 0.8 :v-adjust -0.05)) ;; Text: String
;;           (2 . ,(all-the-icons-material "functions" :height 0.8 :v-adjust -0.15)) ;; Method
;;           (3 . ,(all-the-icons-material "functions" :height 0.8 :v-adjust -0.15)) ;; Function
;;           (4 . ,(all-the-icons-material "functions" :height 0.8 :v-adjust -0.15)) ;; Constructor
;;           (5 . ,(all-the-icons-faicon "slack" :height 0.8 :v-adjust -0.15)) ;; Field
;;           (6 . ,(all-the-icons-faicon "asterisk" :height 0.8 :v-adjust -0.15)) ;; Variable
;;           (7 . ,(all-the-icons-faicon "clone" :height 0.8 :v-adjust -0.15)) ;; Class
;;           (8 . ,(all-the-icons-faicon "gg" :height 0.8 :v-adjust -0.15)) ;; Interface
;;           (9 . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.15)) ;; Module
;;           (10 . ,(all-the-icons-faicon "puzzle-piece" :height 0.8 :v-adjust -0.15)) ;; Property
;;           (11 . ,(all-the-icons-faicon "square-o" :height 0.8 :v-adjust -0.15)) ;; Unit
;;           (12 . ,(all-the-icons-faicon "circle-o" :height 0.8 :v-adjust -0.05)) ;; Value
;;           (13 . ,(all-the-icons-faicon "tag" :height 0.8 :v-adjust -0.15)) ;; Enum
;;           (14 . ,(all-the-icons-faicon "code" :height 0.8 :v-adjust -0.05)) ;; Keyword
;;           (15 . ,(all-the-icons-faicon "file-code-o" :height 0.8 :v-adjust -0.05)) ;; Snippet
;;           (16 . ,(all-the-icons-faicon "font" :height 0.8 :v-adjust -0.05)) ;; Color
;;           (17 . ,(all-the-icons-faicon "file-o" :height 0.8 :v-adjust -0.05)) ;; File
;;           (18 . ,(all-the-icons-faicon "link" :height 0.8 :v-adjust -0.15)) ;; Reference
;;           (19 . ,(all-the-icons-faicon "folder-o" :height 0.8 :v-adjust -0.05)) ;; Folder
;;           (20 . ,(all-the-icons-faicon "hashtag" :height 0.8 :v-adjust -0.15)) ;; EnumMember
;;           (21 . ,(all-the-icons-faicon "lightbulb-o" :height 0.8 :v-adjust -0.15)) ;; Constant
;;           (22 . ,(all-the-icons-faicon "codepen" :height 0.8 :v-adjust -0.15)) ;; Struct
;;           (23 . ,(all-the-icons-faicon "ticket" :height 0.8 :v-adjust -0.05)) ;; Event
;;           (24 . ,(all-the-icons-faicon "cog" :height 0.8 :v-adjust -0.15)) ;; Operator
;;           (25 . ,(all-the-icons-faicon "question-circle-o" :height 0.8 :v-adjust -0.15)) ;; TypeParameter
;;           ))
;;   )


(provide 'init-company-mode)

;;; init-company-mode.el ends here
