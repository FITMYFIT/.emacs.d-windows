(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command-style
   (quote
    (("" "%(PDF)%(latex) %(file-line-error) %(extraopts) %S%(PDFout)"))))
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %(file-line-error) %`%(extraopts) %S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %T" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %`%(extraopts) %S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil
      (plain-tex-mode latex-mode doctex-mode context-mode texinfo-mode ams-tex-mode)
      :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run makeglossaries to create glossary
     file")
     ("Index" "makeindex %s" TeX-run-index nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(cdlatex-command-alist
   (quote
    (("big(" "insert \\big( \\big)" "\\big( ? \\big)" cdlatex-position-cursor nil nil t)
     ("te" "" "\\text{ ? }" cdlatex-position-cursor nil nil t))))
 '(cdlatex-math-symbol-alist (quote ((48 ("\\varnothing" "\\emptyset")))))
 '(cdlatex-paired-parens "$[{(")
 '(company-quickhelp-color-background "#D0D0D0")
 '(company-quickhelp-color-foreground "#494B53")
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" default)))
 '(el-get-git-shallow-clone t)
 '(global-aggressive-indent-mode nil)
 '(ispell-personal-dictionary "C:/Program Files (x86)/Aspell/dict/")
 '(ispell-program-name "")
 '(package-archives
   (quote
    (("org" . "https://orgmode.org/elpa/")
     ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))))
 '(package-selected-packages
   (quote
    (org-ref helm-ispell ac-ispell esup ansi package-build epl git commander f dash s cask org-download rainbow-delimiters pdfgrep pdf-tools-org org-noter pdf-view-restore latex-preview-pane magic-latex-buffer company-math company-reftex cdlatex helm-mt company-auctex auto-complete-auctex multi-term evil-magit gnuplot org-pdfview pdf-tools auctex org ws-butler sr-speedbar helm-cscope xcscope yasnippet-snippets smartparens flycheck-cstyle c-eldoc flycheck-irony irony-eldoc company-irony-c-headers company-irony irony modern-cpp-font-lock diffview git-gutter+ forge magit-org-todos magit-diff-flycheck git-messenger magit-gitflow magit git-commit gitignore-templates gitignore-mode gitattributes-mode gitconfig-mode projectile-variable realgud-lldb realgud flycheck-inline build-helper cmake-ide eldoc-cmake cmake-font-lock cmake-mode makefile-executor quickrun helm-dash dash-docs dired-sidebar code-archive org-sync-snippets auto-yasnippet ivy-yasnippet yasnippet company-quickhelp shut-up company auto-complete origami aggressive-indent indent-guide banner-comment org-commentary poporg hl-todo which-key visual-regexp-steroids use-package treepy symbol-overlay regex-tool pcre2el one-themes leaf-keywords kv key-quiz ivy-hydra ht hierarchy helm-swoop frog-jump-buffer flycheck-package emaps elgrep el-get doom-modeline delight deferred counsel anzu ample-regexps aggressive-fill-paragraph ace-window a)))
 '(pdf-misc-print-program "lpr" t)
 '(pdf-misc-print-programm "lpr" t)
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/home/liu/basilisk/src/" "-I/home/liu/basilisk/src/navier-stokes/" "-I/home/liu/basilisk/src/ehd/" "-I/home/liu/basilisk/src/grid/")
     (company-clang-arguments "-I/home/liu/basilisk/src/")
     (company-clang-arguments "-I/home/liu/sph201909/sph2-ehd-0.1/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
