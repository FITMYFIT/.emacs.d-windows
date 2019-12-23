

(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
;;(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'reftex-mode)
;;for Chinese characters
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode --synctex=1 %f"
                              "xelatex -interaction nonstopmode --synctex=1 %f"))
							  
(provide 'init-org)
