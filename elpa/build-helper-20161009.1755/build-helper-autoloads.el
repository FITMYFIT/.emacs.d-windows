;;; build-helper-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "build-helper" "build-helper.el" (0 0 0 0))
;;; Generated autoloads from build-helper.el

(autoload 'build-helper-setup "build-helper" "\
Setup build-helper.

\(fn)" nil nil)

(autoload 'build-helper-re-run "build-helper" "\
Run the last command or functions associated with a TARGET.

\(fn TARGET)" t nil)

(autoload 'build-helper-run "build-helper" "\
Run functions associated with TARGET, prompt if all fail.

This runs functions associated with the current `major-mode' and TARGET.

If all functions return nil, display a prompt with history of the last commands
executed in this project, `major-mode' and target.

This compile command will be executed from the function `projectile-project-root' directory.

\(fn TARGET)" t nil)

(autoload 'build-helper-re-run-test "build-helper" "\
Run `build-helper-re-run' with target test.

\(fn)" t nil)

(autoload 'build-helper-re-run-build "build-helper" "\
Run `build-helper-re-run' with target build.

\(fn)" t nil)

(autoload 'build-helper-re-run-run "build-helper" "\
Run `build-helper-re-run' with target run.

\(fn)" t nil)

(autoload 'build-helper-run-test "build-helper" "\
Run `build-helper-run' with target test.

\(fn)" t nil)

(autoload 'build-helper-run-build "build-helper" "\
Run `build-helper-run' with target build.

\(fn)" t nil)

(autoload 'build-helper-run-run "build-helper" "\
Run `build-helper-run' with target run.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "build-helper" '("build-helper-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; build-helper-autoloads.el ends here
