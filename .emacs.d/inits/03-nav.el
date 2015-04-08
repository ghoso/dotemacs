(require 'nav)
;; 分割したフレームを垂直に並べる
(setq nav-split-window-direction 'vertical)
(global-set-key "\C-x\C-d" 'nav-toggle)
(custom-set-variables
  '(nav-width 25))
