(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    init-loader
    php-mode
    scala-mode2
    markdown-mode
    scss-mode
    haskell-mode
    ;; js2-mode
    ruby-block
    google-c-style
    yaml-mode
    ;; flycheck
    exec-path-from-shell
    yasnippet
    dropdown-list
    migemo
    open-junk-file
    recentf-ext
    popwin
    google-translate
    auto-complete
    foreign-regexp
    emmet-mode
    auto-highlight-symbol
    highlight-symbol
    slim-mode
    apache-mode
    zenburn-theme
    ssh-config-mode
    smarty-mode
    go-mode
    go-autocomplete
    smartrep
    expand-region
    multiple-cursors
    ;; jade-mode
    ;; coffee-mode
    ;; haml-mode
    dash-at-point
    auto-save-buffers-enhanced
    ))

(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

