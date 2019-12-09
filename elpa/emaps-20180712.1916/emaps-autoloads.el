;;; emaps-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "emaps" "emaps.el" (0 0 0 0))
;;; Generated autoloads from emaps.el

(autoload 'emaps-describe-keymap "emaps" "\
Display the full documentation of KEYMAP (a symbol).

Unlike `describe-variable', this will display characters as strings rather than integers.

\(fn KEYMAP)" t nil)

(autoload 'emaps-describe-keymap-bindings "emaps" "\
Like `describe-bindings', but only describe bindings in KEYMAP.

\(fn KEYMAP)" t nil)

(autoload 'emaps-keymap-for-mode "emaps" "\
Return the keymap for MODE (or NIL if none exists).

\(fn MODE)" nil nil)

(autoload 'emaps-define-key "emaps" "\
Create a binding in KEYMAP from KEY to DEF and each key def pair in BINDINGS.

See `define-key' for the forms that KEY and DEF may take.

\(fn KEYMAP KEY DEF &rest BINDINGS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emaps" '("emaps-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; emaps-autoloads.el ends here
