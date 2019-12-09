;;; key-quiz-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "key-quiz" "key-quiz.el" (0 0 0 0))
;;; Generated autoloads from key-quiz.el

(autoload 'key-quiz "key-quiz" "\
Play a game of Key Quiz.

Key Quiz is a game where the player must type in key sequences
corresponding to different Emacs commands, chosen at random.

The game includes a variant, called 'reverse mode', where the player
is given a key sequence and then must answer with the corresponding
command.  This mode is activated when called interactively with a
prefix argument, or when REVERSE is non-nil.

To KEYS argument can be used to specify a custom key-command list.
The value of the argument must be an alist with each item having the
form (KEY . COMMAND), where KEY should be a string in the format
returned by commands such as `C-h k' (`describe-key'), and COMMAND
should be a string representing the command bound to that key.  It is
not necessary for the commands to exist, or for the keys to be
actually bound to those commands.  If KEYS is omitted or nil, a
key-command list will be generated from the output of running
`describe-buffer-bindings' on a new buffer, set to mode
`key-quiz-use-mode'.

Instructions:
- Answer the questions as they are prompted.
- Points are awarded for correct (or partially correct) answers.
- Points are substracted for incorrect answers.
  The minimum possible score is 0.
- By default, 20 questions are asked per game.
- Use 'p RET' to pause the game and 'c' to resume it.
- Use \\[keyboard-quit] to cancel the question prompt.  Then, use 'r' to start a
  new game or 'q' to kill the buffer.

\(fn &optional REVERSE KEYS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "key-quiz" '("key-quiz-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; key-quiz-autoloads.el ends here
