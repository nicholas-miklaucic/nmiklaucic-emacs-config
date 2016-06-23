
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

;; because I'm dumb
(global-set-key (kbd "C-z") 'undo)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/lisp/magit/Documentation/"))


;; wind-move
(windmove-default-keybindings)

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
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "0ae52e74c576120c6863403922ee00340a3bf3051615674c4b937f9c99b24535" "2da65cb7074c176ca0a33f06bcc83ef692c9175e41b6370f5e94eb5811d6ee3a" default)))
 '(exec-path
   (quote
    ("/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/snap/bin" "/usr/lib/emacs/24.5/x86_64-linux-gnu" "~/.local/bin")))
 '(magit-commit-arguments (quote ("--all")))
 '(rainbow-delimiters-max-face-count 8))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; load other configuration files
(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/completion.el")
(load-file "~/.emacs.d/pythonconfig.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:background "#6495ed" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-2-face ((t (:background "#5d478b" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-3-face ((t (:background "#8b0a50" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-4-face ((t (:background "#Ff1493" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-5-face ((t (:background "#Ff0000" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-6-face ((t (:background "#Ff4500" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-7-face ((t (:background "#Ffd700" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-8-face ((t (:background "#7cfc00" :foreground "#34342a"))))
 '(rainbow-delimiters-mis-matched-face ((t (:background "#000000" :foreground "#ffff00"))))
 '(rainbow-delimiters-mismatched-face ((t (:background "#000000" :foreground "#ffff00"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "#000000" :foreground "#ffff00")))))

(defvar bnb/really-kill-emacs nil)
(defadvice kill-emacs (around bnb/really-exit activate)
  "Only kill emacs if a prefix is set"
  (if bnb/really-kill-emacs
      ad-do-it)
    (iconify-frame))

(defun bnb/really-kill-emacs ()
  (interactive)
  (setq bnb/really-kill-emacs t)
  (kill-emacs))

(server-start)
