;;
;; init.el
;;
;; Created by Go Hosohara (go.hosohara@gmail.com)
;; Modified at 2013/OCT/25
;; 

;; Character set
(when (equal emacs-major-version 21) (require 'un-define))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
;;(setq file-name-coding-system 'shift_

;;
;; Key Binding
;;
;; カーソル前の1文字を消す
(global-set-key "\C-h"  'delete-backward-char)
;; カーソル前の1語を消す
(global-set-key (kbd "M-h") 'backward-kill-word)
;; 入力した行にジャンプする
(global-set-key (kbd "M-g") 'goto-line)
;; 改行してインデント調整を行う
(global-set-key (kbd "C-m") 'newline-and-indent)

;;
;; 定番設定
;;
;; タブ文字の幅を設定
(setq-default tab-width 2)
;; インデント文字をタブではなく空白に設定
(setq-default indent-tabs-mode nil)
;; 起動時のウィンドウサイズを設定
(if (boundp 'window-system)
    (setq initial-frame-alist
          (append (list
                   '(width . 180)
                   '(height . 50))
                  initial-frame-alist)))
(setq default-frame-alist initial-frame-alist)
;; 起動時のスプラッシュ画面を非表示
(setq inhibit-startup-message t)
;; エラー時の画面のフラッシュを抑制
(setq ring-bell-function 'ignore)
;; バックアップファイルの作成をしない
(setq-default make-backup-files nil)
;; 対応する括弧をハイライト
(show-paren-mode t)
;; いらないものを消す
;;(menu-bar-mode 0)
;;(tool-bar-mode 0)
;;(scroll-bar-mode 0)
;; カーソル位置表示
(line-number-mode 1)
(column-number-mode 1)
;; y or nで答えられるようにする
(defalias 'yes-or-no-p 'y-or-n-p)
;; ダイアログボックスを使わないようにする
(setq use-dialog-box nil)
;; ガーベージコレクションを実行するまでの
;; 割り当てメモリーのしきい値を増やす
(setq gc-cons-threshold (* 50 gc-cons-threshold))
;; kill-lineで行末も削除
(setq kill-whole-line t)
;; ログの記憶量を増やす
(setq message-low-max 10000)
;; 履歴数を増やす
(setq history-length 1000)
;; 重複する履歴は保存しない
(setq history-delete-duplicates t)
;; 行番号を左に表示
(global-linum-mode 1)
;; 行番号表示４桁
(setq linum-format "%4d ")
;; カーソルが今どの関数の中か表示
(which-function-mode 1)
;; 最近使ったファイルを記録する
(require 'recentf)
(setq recent-save-file "~/.recentf")
(setq recent-exclude '("~/.recentf"))
(setq recent-max-seved-items 50000)
(setq recentf-auto-cleanup '10)
(run-with-idle-timer 30 t 'recentf-save-list)
(recentf-mode 1)

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

;;
;; 定番パッケージ設定
;;
;; helm
(require 'helm-config)
(require 'helm-migemo)
;; Scratchバッファ保存
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%y%m%d%H%M%S.")
(global-set-key (kbd "C-x C-z") 'open-junk-file)
;; emacs-lisp-mode C-c C-dで注釈
(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "c-c C-d") 'lispxmp)
;; カッコの対応を取りながら編集
;;(require 'paredit)
;;(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;; ~/junk以外で自動コンパイル
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-file-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;; カッコに色付け
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;;
;; Haskell mode
;;
(load "~/.emacs.d/elpa/haskell-mode-2.8.0/haskell-site-file")
(setq haskell-program-name "/usr/bin/ghci")

;;
;; Ruby
;;
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                              interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
      '(lambda ()
         (inf-ruby-keys)
))

;;
;; Javascript
;;
;;(autoload 'js2-mode "js2-mode" nil t)
(load "~/.emacs.d/lisp/js2-mode")
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;
;; Rinari
;;
(require 'ido)
(ido-mode t)
(add-to-list 'load-path "~/.emacs.d/lisp/rinari-2.10")
(require 'rinari)
;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/lisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))
;(defface erb-face
;  '((((class color) (min-colors 88) (background dark))
;     :background "black")
;    nil nil)
(defface erb-face
  `((t (:background "black")))
  "Default inherited face for ERB tag body"
  :group 'rhtml-faces)

;; 自動でWeb-modeを起動したい拡張子を追加
(when (require 'Web-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" ,Web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" ,Web-mode)))

;;
;; flymake
;;

;; JS用Flymake初期化関数
(require 'flymake)
(defun flymake-js-init ()
  (list "jshint"
        (list (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))))
;; Javascript編集でFlymakeを起動する
(add-to-list 'flymake-allowed-file-name-masks
             '("\\.js\\'" flymake-js-init))
(add-to-list
 'flymake-err-line-patterns
 '("\\([^ \n]+\\): line \\([0-9]+\\), col \\([0-9]+\\), \\(.*\\)"
   1 2 3 4))
;; CCS lint
(defun flymake-ccs-init ()
  (list
   "ccslint"
   (list "--format=compact" (flymake-init-create-temp-buffer-copy
                             'flymake-create-temp-inplace))))
(add-to-list 'flymake-allowed-file-name-masks
             '("\\.css\\'" flymake-css-init))
(add-to-list
 'flymake-err-line-patterns
 '("\\([^ \n]+\\): line \\([0-9]+\\), col \\([0-9]+\\), \\(\\(Warning\\|Error\\) - .*\\)"
   1 2 3 4))
;;
;; Git
;;
(require 'magit)
