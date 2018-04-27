
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)
  (setq package-archives '())
  (package-initialize)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives
	       '("gnu" . "http://elpa.gnu.org/packages/"))  
  (add-to-list 'package-archives
	       '("marmalade" . "https://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
	       '("org" . "http://orgmode.org/elpa/") t)
  (add-to-list 'package-archives
	       '("tromey" . "http://tromey.com/elpa/") t)
  )
(package-initialize)

(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  )


(projectile-global-mode)
(helm-projectile-on)

;; maximize on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun find-init ()
  (interactive)
  (find-file "/home/nicholas/.emacs.d/init.el")
  )
(global-set-key (kbd "C-c i") 'find-init)

(put 'dired-find-alternate-file 'disabled nil)

(use-package quickrun
  :bind ("C-c C-SPC" . helm-quickrun))

;; keybindings
(global-set-key [f1] 'shell)
(global-set-key [f10] 'magit-status)
(global-set-key (kbd "M-o") 'other-window)
;; magit
(add-to-list 'load-path "~/.emacs.d/lisp/magit/lisp")
(require 'magit)
(global-set-key (kbd "C-x C-e") 'eval-buffer)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c f") 'helm-recentf)
(global-set-key (kbd "C-x C-r") 'recompile)
(global-set-key (kbd "<C-return>") 'set-mark-command)

;; because I'm dumb
(global-set-key (kbd "C-z") 'undo)

(require 'paradox)
(paradox-enable)

;; taking care of fill stuff
(setq-default fill-column 100)
(add-hook 'prog-mode-hook 'auto-fill-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'auto-fill-mode)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/lisp/magit/Documentation/"))

(defun elisp-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Emacs Lisp")))

(add-hook 'emacs-lisp-mode-hook 'elisp-doc)


;; this needs to be a thing
(global-set-key (kbd "C-c C-w") 'kill-region)

(use-package cdlatex
  :bind
  (("C-$" . cdlatex-dollar))
  :config
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  )

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(use-package latex-pretty-symbols)
(use-package magic-latex-buffer
  :config
  (add-hook 'TeX-mode-hook magic-latex-buffer)
  (add-hook 'LaTeX-mode-hook 'magic-latex-buffer)
  )

(use-package neotree
  :bind (([f8] . neotree-toggle))
  )

;; because I use ` for a drop-down terminal (sometimes), set a global keybinding
(defun insert-backtick ()
  (interactive)
  (insert-char 96)
  )

(global-set-key (kbd "C-8") 'insert-backtick) 

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

  :bind (("C-c C-a l" . avy-goto-line)
	 ("C-c C-a c" . avy-goto-char)
	 ("C-c C-a w" . avy-goto-word-1))
  )

(setq-default preview-scale-function 1.2)
(require 'tex-site)
(require 'company-auctex)
(company-auctex-init)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(put 'scroll-left 'disabled nil)

(use-package sublimity
  :config
  (require 'sublimity-scroll)
  (sublimity-mode 1)
  )


(use-package racer
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  )

(defun rust-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Rust")))

(add-hook 'rust-mode-hook 'rust-doc)
(add-hook 'rust-mode-hook #'cargo-minor-mode)
(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'rust-mode-hook #'flycheck-rust-setup)

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

(defun web-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("HTML" "CSS" "Javascript")))

(add-hook 'web-mode-hook 'web-doc)

;; This would fix problems with PATH, but then you get a prompt after each shell command and stuff breaks
;; (setq shell-command-switch "-ic")
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; load other configuration files
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/completion.el")
;; (load-file "~/.emacs.d/haskellconfig.el")
;; (load-file "~/.emacs.d/mu.el")
(load-file "~/.emacs.d/pythonconfig.el")
(load-file "~/.emacs.d/org-publishing.el")
(load-file "~/.emacs.d/org-mode-config.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :slant normal))))
 '(highlight-indentation-face ((t (:inherit default))))
 '(nlinum-current-line ((t (:inherit font-lock-comment-delimiter-face :slant italic))))
 '(org-level-1 ((t (:inherit outline-1 :weight bold))))
 '(org-level-2 ((t (:inherit outline-2 :weight semi-bold))))
 '(org-level-3 ((t (:inherit outline-3 :weight normal))))
 '(rainbow-delimiters-mis-matched-face ((t (:background "#000000" :foreground "#ffff00"))))
 '(rainbow-delimiters-mismatched-face ((t (:background "#000000" :foreground "#ffff00"))))
 '(rainbow-delimiters-unmatched-face ((t (:inherit error :inverse-video t :weight bold))))
 '(variable-pitch ((t (:family "Metropolis"))))
 '(vertical-border ((t (:background "transparent")))))

(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#fafafa" "#e64a19" "#66bb6a" "#fbc02d" "#303f9f" "#7b1fa2" "#303f9f" "#757575"])
 '(ansi-term-color-vector
   [unspecified "#fafafa" "#e64a19" "#66bb6a" "#fbc02d" "#303f9f" "#7b1fa2" "#303f9f" "#757575"] t)
 '(company-ghc-show-info t)
 '(custom-enabled-themes (quote (base16-material-light)))
 '(custom-safe-themes
   (quote
    ("e10bb3925df2217eff929eee64198700bed6d789d6e7d7a167fa5b453990574c" . t)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(lsp-ui-flycheck-enable nil)
 '(lsp-ui-sideline-enable t)
 '(org-fontify-whole-heading-line t)
 '(org-hide-leading-stars t)
 '(package-selected-packages
   (quote
    (lsp-javascript-typescript lsp-rust lsp-python lsp-ui company-lsp quickrun nov nlinum zenburn-theme web-mode visual-regexp-steroids use-package typo theme-changer symon sx swiper sublimity spacemacs-theme spaceline solarized-theme smooth-scrolling smart-mode-line-powerline-theme shm shell-history shell-here realgud rainbow-mode rainbow-delimiters racer python-django py-isort projectile-speedbar pretty-mode-plus pretty-mode paradox org-bullets org ob-ipython neotree multi monokai-theme moe-theme mingus matlab-mode material-theme material-light-theme material-dark-theme markdown-mode+ magit magic-latex-buffer latex-pretty-symbols latex-math-preview latex-extra kaolin-themes js-comint hyperbole htmlize hindent hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-dash helm-ag gratuitous-dark-theme grandshell-theme font-lock+ focus flycheck-rust flatui-theme expand-region exec-path-from-shell esup eshell-prompt-extras emacs-xkcd elpy ein dired+ diminish cython-mode csv-mode company-web company-tern company-racer company-quickhelp company-math company-ghc company-c-headers company-bibtex company-auctex company-anaconda color-theme-modern cdlatex cargo bongo base16-theme avy-flycheck autumn-light-theme ample-theme all-the-icons alect-themes airline-themes ac-js2 2048-game)))
 '(paradox-github-token t)
 '(racer-rust-src-path
   "/home/nicholas/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"))
(put 'downcase-region 'disabled nil)
