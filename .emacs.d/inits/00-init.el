;;
;; 00-init.el
;;

;; Character set
(when (equal emacs-major-version 21) (require 'un-define))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
;;(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
;;(set-default-coding-systems 'utf-8-unix)

;;
;; .emacs.dパス設定
;;
;;(.emacs.d/lispのサブディレクトリもパスに追加）
(let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;;
;; Package
;;
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(require 'melpa)
(unless (package-installed-p 'scala-mode2)
    (package-refresh-contents) (package-install 'scala-mode2))

;;
;; auto-install
;;
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
