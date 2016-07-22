;; setup packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
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

;; wind-move
(windmove-default-keybindings)

(exec-path-from-shell-initialize)

;; avy
(avy-setup-default)
(global-set-key (kbd "C-c a l") 'avy-goto-line)
(global-set-key (kbd "C-c a c") 'avy-goto-char)
(global-set-key (kbd "C-c a w") 'avy-goto-word-1)

;; (add-hook 'prog-mode-hook #'aggressive-indent-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.24)
 '(company-minimum-prefix-length 3)
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "0ae52e74c576120c6863403922ee00340a3bf3051615674c4b937f9c99b24535" "2da65cb7074c176ca0a33f06bcc83ef692c9175e41b6370f5e94eb5811d6ee3a" default)))
 '(elpy-eldoc-show-current-function nil)
 '(elpy-rpc-python-command "python3")
 '(exec-path
   (quote
    ("/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/snap/bin" "/usr/lib/emacs/24.5/x86_64-linux-gnu" "/home/nicholas/.local/bin")))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd elixir emacs-lisp erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck haml handlebars haskell-ghc haskell-hlint html-tidy javascript-jshint javascript-eslint javascript-gjslint json-jsonlint less luacheck lua perl perl-perlcritic php php-phpmd php-phpcs puppet-parser puppet-lint r-lintr racket rpm-rpmlint rst rst-sphinx ruby-rubocop ruby-rubylint ruby ruby-jruby rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim tex-chktex tex-lacheck texinfo verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(magit-commit-arguments (quote ("--all")))
 '(markdown-command "pandoc")
 '(markdown-command-needs-filename t)
 '(markdown-open-command "nil")
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
 '(package-selected-packages
   (quote
    (exec-path-from-shell web-mode zenburn-theme xpm visual-fill-column theme-changer swiper solarized-theme shell-here seq rainbow-mode rainbow-delimiters multi monokai-theme markdown-mode+ magit helm-projectile helm-gtags gtags flycheck expand-region elpy company-c-headers base16-theme avy ascii-art-to-unicode)))
 '(python-shell-interpreter "ipython3")
 '(python-shell-interpreter-interactive-arg "-i")
 '(rainbow-delimiters-max-face-count 8)
 '(visible-bell t))

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

(global-flycheck-mode)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; load other configuration files
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/clang.el")
(load-file "~/.emacs.d/completion.el")
(load-file "~/.emacs.d/org.el")
(load-file "~/.emacs.d/pythonconfig.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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

(put 'dired-find-alternate-file 'disabled nil)
