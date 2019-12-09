;;; helm-cscope-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "helm-cscope" "helm-cscope.el" (0 0 0 0))
;;; Generated autoloads from helm-cscope.el

(autoload 'helm-cscope-find-this-symbol "helm-cscope" "\
Locate a symbol in source code.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-this-symbol-no-prompt "helm-cscope" "\
Locate a symbol in source code [no user prompting].

\(fn)" t nil)

(autoload 'helm-cscope-find-global-definition "helm-cscope" "\
Find a symbol's global definition.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-global-definition-no-prompt "helm-cscope" "\
Find a symbol's global definition [no user prompting].

\(fn)" t nil)

(autoload 'helm-cscope-find-called-function "helm-cscope" "\
Display functions called by a function.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-called-function-no-prompt "helm-cscope" "\
Display functions called by a function [no user prompting].

\(fn)" t nil)

(autoload 'helm-cscope-find-calling-this-function "helm-cscope" "\
Display functions calling a function.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-calling-this-function-no-prompt "helm-cscope" "\
Display functions calling a function [no user prompting].

\(fn)" t nil)

(autoload 'helm-cscope-find-this-text-string "helm-cscope" "\
Locate where a text string occurs.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-this-text-string-no-prompt "helm-cscope" "\
Locate where a text string occurs [no user prompting].

\(fn)" t nil)

(autoload 'helm-cscope-find-egrep-pattern "helm-cscope" "\
Run egrep over the cscope database.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-this-file "helm-cscope" "\
Locate a file.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-this-file-no-prompt "helm-cscope" "\
Locate a file [no user prompting].

\(fn)" t nil)

(autoload 'helm-cscope-find-files-including-file "helm-cscope" "\
Locate all files #including a file.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-assignments-to-this-symbol "helm-cscope" "\
Locate assignments to a symbol in the source code.

\(fn SYMBOL)" t nil)

(autoload 'helm-cscope-find-assignments-to-this-symbol-no-prompt "helm-cscope" "\
Locate assignments to a symbol in the source code[no user prompting].

\(fn)" t nil)

(autoload 'helm-cscope-mode "helm-cscope" "\
Toggle Helm-Cscope mode on or off.
With a prefix argument ARG, enable Helm-Cscope mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{helm-cscope-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "helm-cscope" '("helm-cscope-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; helm-cscope-autoloads.el ends here
