(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; this is the cool bit--change themes on time of days
;; other main locale: Andover, MA, 42.65 N, -71.13 E
;; Charlotte NC is 35.22 N, -80.84 E
(setq calendar-current-location-name "Andover MA")
(setq calendar-longitude -71.13)
(setq calendar-latitude 42.65)
(require 'theme-changer)
(change-theme 'base16-tomorrow 'base16-tomorrow-night)

;; font
(set-face-attribute 'default nil :font "Ubuntu Mono derivative Powerline 15")
(setq line-spacing 0)

(use-package spaceline
  :init
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (setq powerline-active1 "#923232")
  (setq powerline-active2 "#38535b")
  (setq mode-line "#394939")

  )


;; pretty symbols in LaTeX
(defvar pretty-alist
  (cl-pairlis '("alpha" "beta" "gamma" "delta" "epsilon" "zeta" "eta"
                "theta" "iota" "kappa" "lambda" "mu" "nu" "xi"
                "omicron" "pi" "rho" "sigma_final" "sigma" "tau"
                "upsilon" "phi" "chi" "psi" "omega")
              (mapcar
               (lambda (x) (make-char 'greek-iso8859-7 x))
               (number-sequence 97 121))))
(add-to-list 'pretty-alist '("rangle" . ?\⟩))
(defun pretty-things ()
  (mapc
   (lambda (x)
     (let ((word (car x))
           (char (cdr x)))
       (font-lock-add-keywords
        nil
        `((,(concat "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[a-zA-Z]")
            (0 (progn
                 (decompose-region (match-beginning 2) (match-end 2))
                 nil)))))
       (font-lock-add-keywords
        nil
        `((,(concat "\\(^\\|[^a-zA-Z0-9]\\)\\(" word "\\)[^a-zA-Z]")
            (0 (progn
                 (compose-region (1- (match-beginning 2)) (match-end 2)
                  ,char)
                 nil)))))))
   pretty-alist))
(add-hook 'LaTeX-mode-hook 'pretty-things)

;; more pretty symbols
(add-hook 'prog-mode-hook
	  (lambda ()
	    (push '("<=" . ?≤) prettify-symbols-alist)
	    (push '(">=" . ?≥) prettify-symbols-alist)
	    (push '("!=" . ?≠) prettify-symbols-alist)
	    (push '("neq" . ?≠) prettify-symbols-alist)
	    (push '("\infty" . ?∞) prettify-symbols-alist)
	    (push '("<-" . ?←) prettify-symbols-alist)
	    (push '("->" . ?→) prettify-symbols-alist)
	    (push '("<==" . ?⇐) prettify-symbols-alist)
	    (push '("==>" . ?⇒) prettify-symbols-alist)
	    ))
	    
(global-prettify-symbols-mode +1)

(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(my-global-rainbow-mode 1)

;; prompts
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
	kill-buffer-query-functions))


;; tooltips
(tooltip-mode -1)

(use-package typo
  :init
  (typo-global-mode 1)
  (add-hook 'text-mode-hook 'typo-mode))

(use-package pretty-mode
  :init
  (global-pretty-mode t))

(use-package focus
  :init
  (add-hook 'prog-mode-hook 'focus-mode)
  :bind ("C-c c f" . focus-mode)
  )

(add-hook 'prog-mode-hook 'linum-mode)

;; rainbow-delimiters config
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:background "#00ccff" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-2-face ((t (:background "#9400d3" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-3-face ((t (:background "#Ff1493" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-4-face ((t (:background "#Ff0000" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-5-face ((t (:background "#Ff4500" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-6-face ((t (:background "#Ffd700" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-7-face ((t (:background "#7cfc00" :foreground "#34342a"))))
 '(rainbow-delimiters-depth-8-face ((t (:background "#44ff77" :foreground "#34342a"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "#ffff00" :foreground "#000000"))))
 '(mode-line ((t (:foreground "#ababcb" :background "#4d4d4d" :box nil))))
 '(mode-line-inactive ((t (:foreground "#5e5e5e" :background "#2d2d2d" :box nil))))
 )

