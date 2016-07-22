(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; this is the cool bit--change themes on time of days
(setq calendar-current-location-name "Charlotte, NC")
(setq calendar-longitude -80.796)
(setq calendar-latitude 35.153)
(require 'theme-changer)
(change-theme 'solarized-light 'monokai)

;; font
(set-face-attribute 'default nil :font "Source Code Pro for Powerline 13")


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
 )

;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;; (require 'powerline)
;; (setq powerline-color1 "#657b83")
;; (setq powerline-color2 "#839496")

;; (set-face-attribute 'mode-line nil
;;                     :foreground "#fdf6e3"
;;                     :background "#859900"
;;                     :box nil)
;; (set-face-attribute 'mode-line-inactive nil
;;                     :box nil)

(sml/setup)

(display-battery-mode 0)
(display-time-mode 0)
(line-number-mode 0)
(column-number-mode 0)
