;;
;; init.el
;;
;; Created by Go Hosohara (go.hosohara@gmail.com)
;; Created at 2014/Mar/14
;;
;; ~/.emacs.d/lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
