;;; banner-comment-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "banner-comment" "banner-comment.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from banner-comment.el

(autoload 'banner-comment "banner-comment" "\
Turn line at point into a banner comment.

Called on an existing banner comment, will reformat it.

Final column will be (or END-COLUMN comment-fill-column fill-column).

\(fn &optional END-COLUMN)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "banner-comment" '("banner-comment-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; banner-comment-autoloads.el ends here
