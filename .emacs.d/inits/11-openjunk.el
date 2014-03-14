;;
;; 11-openjunk.el
;;
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%y%m%d%H%M%S.")
(global-set-key (kbd "C-x C-z") 'open-junk-file)
