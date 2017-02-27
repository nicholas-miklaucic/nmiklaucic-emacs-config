(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  (kbd "C-TAB") 'company-complete)
(define-key c++-mode-map  (kbd "C-TAB") 'company-complete)
(add-to-list 'company-backends 'company-c-headers)

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(global-semantic-idle-summary-mode 1)

(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (global-set-key (kbd "C-c") (lambda ()
					  (interactive)
					  (setq-local compilation-read-command nil)
					  (call-interactively 'compile)))))

(add-hook 'c-mode-common-hook 'flymake-mode)
