;;
;;  02-common.el
;;

;; 定番設定

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
;; DiredのRETで同じバッファでディレクトリを開く
(put 'dired-find-alternate-file 'disabled nil)
