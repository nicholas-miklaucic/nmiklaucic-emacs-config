;; setup packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; magit
(add-to-list 'load-path "~/.emacs.d/lisp/magit/lisp")
(require 'magit)

;; keybindings
(global-set-key [f1] 'shell)
(global-set-key [f10] 'magit-status)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x C-e") 'eval-buffer)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c f") 'helm-recentf)
(global-set-key (kbd "C-x C-r") 'recompile)

;; because I'm dumb
(global-set-key (kbd "C-z") 'undo)

;; taking care of fill stuff
(setq-default fill-column 100)
(add-hook 'prog-mode-hook 'auto-fill-mode)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/lisp/magit/Documentation/"))


;; this needs to be a thing
(global-set-key (kbd "C-c C-w") 'kill-region)

(use-package neotree
  :bind (([f8] . neotree-toggle))
  )

(use-package symon
  :init
  (symon-mode))

(use-package emacs-xkcd)

;; wind-move
(windmove-default-keybindings)

;; because I use ` for a drop-down terminal (sometimes), set a global keybinding
(defun insert-backtick ()
  (interactive)
  (insert-char 96)
  )

(use-package sx
  :config
  (bind-keys :prefix "C-c s"
             :prefix-map my-sx-map
             :prefix-docstring "Global keymap for SX."
             ("q" . sx-tab-all-questions)
             ("i" . sx-inbox)
             ("o" . sx-open-link)
             ("u" . sx-tab-unanswered-my-tags)
             ("a" . sx-ask)
             ("s" . sx-search)))

(global-set-key (kbd "C-M-*") 'insert-backtick) 

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(global-set-key (kbd "C-c C-k") 'kill-other-buffers)

(use-package :visual-regexp-steroids
  :bind (("C-c r" . vr/replace)
	 ("C-c q" . vr/query-replace)
	 ("C-c m" . vr/mc-mark)
	 ("C-c C-r" . vr/isearch-backward)
	 ("C-c C-s" . vr/isearch-forward)))

;; avy
(use-package avy
  :init
  (avy-setup-default)
  (avy-flycheck-setup)

  :bind (("C-c a l" . avy-goto-line)
	 ("C-c a c" . avy-goto-char)
	 ("C-c a w" . avy-goto-word-1))
  )

;; (add-hook 'prog-mode-hook #'aggressive-indent-mode)
(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(company-idle-delay 0.24)
 '(company-minimum-prefix-length 3)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "3c98d13ae2fc7aa59f05c494e8a15664ff5fe5db5256663a907272869c4130dd" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "71182be392aa922f3c05e70087a40805ef2d969b4f8f965dfc0fc3c2f5df6168" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "b9293d120377ede424a1af1e564ba69aafa85e0e9fd19cf89b4e15f8ee42a8bb" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "5436e5df71047d1fdd1079afa8341a442b1e26dd68b35b7d3c5ef8bd222057d1" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "0ae52e74c576120c6863403922ee00340a3bf3051615674c4b937f9c99b24535" "2da65cb7074c176ca0a33f06bcc83ef692c9175e41b6370f5e94eb5811d6ee3a" default)))
 '(elpy-eldoc-show-current-function nil)
 '(elpy-rpc-python-command "python3")
 '(elpy-test-discover-runner-command (quote ("python3" "-m" "unittest")))
 '(exec-path
   (quote
    ("/home/nicholas/anaconda3/bin/" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/snap/bin" "/usr/lib/emacs/24.5/x86_64-linux-gnu" "/home/nicholas/.local/bin")))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd elixir emacs-lisp erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck haml handlebars haskell-ghc haskell-hlint html-tidy javascript-jshint javascript-eslint javascript-gjslint json-jsonlint less luacheck lua perl perl-perlcritic php php-phpmd php-phpcs puppet-parser puppet-lint r-lintr racket rpm-rpmlint rst rst-sphinx ruby-rubocop ruby-rubylint ruby ruby-jruby rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim tex-chktex tex-lacheck texinfo verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-commit-arguments (quote ("--all")))
 '(markdown-command "pandoc")
 '(markdown-command-needs-filename t)
 '(markdown-open-command "nil")
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("~/Documents")))
 '(org-capture-templates
   (quote
    (("r" "Random things that must be refiled later, not a TODO" entry
      (file+headline "~/Documents/gtd.org" "Refile")
      "* %? %t %^g")
     ("t" "Immediate tasks or TODO entries" entry
      (file+headline "~/Documents/gtd.org" "Tasks")
      "* TODO %? %t %^g" :prepend t))))
 '(org-fast-tag-selection-single-key t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/"))))
 '(package-selected-packages
   (quote
    (sx emacs-xkcd spaceline symon pretty-mode visual-regexp-steroids focus typo neotree dired+ projectile-speedbar cython-mode sr-speedbar realgud helm-pydoc py-isort hemisu-theme shm company-ghc ghc hindent haskell-mode csv-mode grandshell-theme alect-themes ample-theme use-package ein company-auctex auctex company-web company-anaconda exec-path-from-shell web-mode zenburn-theme xpm visual-fill-column theme-changer swiper solarized-theme shell-here seq rainbow-mode rainbow-delimiters multi monokai-theme markdown-mode+ magit helm-projectile helm-gtags gtags flycheck expand-region elpy company-c-headers base16-theme avy ascii-art-to-unicode)))
 '(python-shell-completion-native-disabled-interpreters (quote ("pypy" "ipython3" "ipython" "python3")))
 '(python-shell-interpreter "python3")
 '(python-shell-interpreter-interactive-arg "-i")
 '(rainbow-delimiters-max-face-count 8)
 '(realgud:pdb-command-name "python3 -m pdb")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(symon-monitors
   (quote
    (symon-linux-memory-monitor symon-linux-cpu-monitor symon-linux-battery-monitor)))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(visible-bell t)
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(projectile-global-mode)
(helm-projectile-on)

;; maximize on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun find-init ()
  (interactive)
  (find-file "/home/nicholas/.emacs.d/init.el")
  )
(global-set-key (kbd "C-c i") 'find-init)

;; shell-here
(require 'shell-here)
(global-set-key (kbd "C-c M-h") 'shell-here)

(put 'dired-find-alternate-file 'disabled nil)

;; (global-flycheck-mode)

(setq-default preview-scale-function 1.2)
(require 'tex-site)
(require 'company-auctex)
(company-auctex-init)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))


;; load other configuration files
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/completion.el")
(load-file "~/.emacs.d/haskellconfig.el")
(load-file "~/.emacs.d/pythonconfig.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-doc-face ((t (:foreground "#87ceeb"))))
 '(mode-line ((t (:foreground "#ababcb" :background "#4d4d4d" :box nil))))
 '(mode-line-inactive ((t (:foreground "#5e5e5e" :background "#2d2d2d" :box nil))))
 '(powerline-active1 ((t (:background "#859900" :foreground "#fdf6e3"))))
 '(powerline-active2 ((t (:background "#268bd2" :foreground "#fdf6e3"))))
 '(rainbow-delimiters-depth-1-face ((t (:background "#00ccff" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-2-face ((t (:background "#9400d3" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-3-face ((t (:background "#Ff1493" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-4-face ((t (:background "#Ff0000" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-5-face ((t (:background "#Ff4500" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-6-face ((t (:background "#Ffd700" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-7-face ((t (:background "#7cfc00" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-8-face ((t (:background "#44ff77" :foreground "#34342a"))))
 '(rainbow-delimiters-mis-matched-face ((t (:background "#000000" :foreground "#ffff00"))))
 '(rainbow-delimiters-mismatched-face ((t (:background "#000000" :foreground "#ffff00"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "#ffff00" :foreground "#000000")))))

(server-start)


(put 'scroll-left 'disabled nil)
