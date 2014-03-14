;;
;; 23-rinari.el

;; Rinari
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
