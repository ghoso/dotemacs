;;
;; 01-keybind.el
;;

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
