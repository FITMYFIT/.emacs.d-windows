;;the following is to solve problem "AUCTex could not find texlive
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2019/bin/x86_64-linux/"))  
(setq exec-path (append exec-path '("/usr/local/texlive/2019/bin/x86_64-linux/")))

(package-initialize)
(load "auctex.el" nil t t)

;;(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)

(setq TeX-parse-self t)

(setq-default TeX-master nil)
;;(add-to-list 'load-path "~/.emacs.d/lisp/") ;; 这是cdlatex.el的存放位置
(require 'cdlatex)

;; 设定outline minor mode的前缀快捷键为C-o
(setq outline-minor-mode-prefix [(control o)]) 

;; 解决显示Unicode字符的卡顿问题
(setq inhibit-compacting-font-caches t)

;; 汉字默认字体为Kaiti(楷体)，可改为其它字体
(set-fontset-font "fontset-default" 'han
                  "KaiTi")
;; 数学符号默认字体为Cambria Math
(set-fontset-font "fontset-default" 'symbol
                  "Cambria Math")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 以下为LaTeX mode相关设置
(setq-default TeX-master nil) ;; 编译时问询主文件名称
(setq TeX-parse-selt t) ;; 对新文件自动解析(usepackage, bibliograph, newtheorem等信息)
;; PDF正向搜索相关设置
(setq TeX-PDF-mode t) 
(setq TeX-source-correlate-mode t) 
(setq TeX-source-correlate-method 'synctex) 
(setq TeX-view-program-list 
      '(("mupdf" ("/usr/bin/mupdf -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o")))) 

;; 打开TeX文件时应该加载的mode/执行的命令
(defun my-latex-hook ()
  (turn-on-cdlatex) ;; 加载cdlatex
  (outline-minor-mode) ;; 加载outline mode
  (turn-on-reftex)  ;; 加载reftex
  (auto-fill-mode)  ;; 加载自动换行
  (flyspell-mode)   ;; 加载拼写检查 (需要安装aspell)
  (TeX-fold-mode t) ;; 加载TeX fold mode
  (outline-hide-body) ;; 打开文件时只显示章节标题
  (assq-delete-all (quote output-pdf) TeX-view-program-selection)    ;; 以下两行是正向搜索相关设置
  (add-to-list 'TeX-view-program-selection '(output-pdf "mupdf"))
  )
(add-hook 'LaTeX-mode-hook 'my-latex-hook)

(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTeX")))

;; LaTeX mode相关
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 王垠提供的小工具: 按“%”匹配括号的小程序
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

;; 调整自动补全字符串的优先级顺序
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
;;the following is used to compile with xelatex when hint c-c
;;(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))


(provide 'init-latex)
