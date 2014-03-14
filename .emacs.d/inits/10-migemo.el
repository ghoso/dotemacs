;;
;; 10-migemo.el
;;
(require 'migemo)
;; for cmigemo
(setq migemo-command "cmigemo"
      migemo-options '("-q" "--emacs" "-i" "\g")
      migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict"
      migemo-user-dictionary nil
      migemo-regex-dictionary nil
      migemo-coding-system 'utf-8)
(require 'helm-config)
(require 'helm-migemo)
