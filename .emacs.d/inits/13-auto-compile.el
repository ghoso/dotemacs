;;
;; 13-auto-compile.el
;;

;; ~/junk以外で自動コンパイル
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-file-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
