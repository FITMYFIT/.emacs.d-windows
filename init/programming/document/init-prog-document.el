;;; init-prog-document.el --- init for Programming Document Look Up.

;;; Commentary:

;;; Code:


(unless (boundp 'document-prefix)
  (define-prefix-command 'document-prefix))
(global-set-key (kbd "C-c h") 'document-prefix)

(require 'init-prog-document-eldoc)
(require 'init-prog-document-man)
(require 'init-prog-document-api)
(require 'init-prog-document-assistant)


(provide 'init-prog-document)

;;; init-prog-document.el ends here
