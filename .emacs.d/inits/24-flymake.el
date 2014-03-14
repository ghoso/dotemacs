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
