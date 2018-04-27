(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

(add-to-list 'custom-theme-load-path "/home/nicholas/.emacs.d/themes")

;; this is now managed by a Python shell commandd
;; on startup, read in a file for what to do
;; it will change automatically

;; this is the cool bit--change themes on time of days
;; other main locale: Andover, MA, 42.65 N, -71.13 E
;; Charlotte NC is 35.22 N, -80.84 E
(setq calendar-current-location-name "Andover MA")
(setq calendar-longitude -71.13)
(setq calendar-latitude 42.65)
(require 'theme-changer)
(change-theme 'base16-material-light 'base16-material-dark)

(defun custom-powerline-reset (theme &optional no-confirm no-enable)
  "Version that allows for advice hooks to work."
  (interactive)
  (powerline-reset)
  )
(add-function :after (symbol-function 'load-theme) #'custom-powerline-reset)

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defun switch-dark ()
  (interactive)
  (disable-theme 'base16-material-light)
  (load-theme 'base16-material-dark t)
  (powerline-reset)
  )

(defun switch-light ()
  (interactive)
  (disable-theme 'base16-material-dark)
  (load-theme 'base16-material-light t)
  (powerline-reset)
  )


;; font
(set-face-attribute 'default nil :font "IBM Plex Mono 18" :height 140 :weight 'regular)
(setq line-spacing 1)

;; make comments appear in italics so it looks nice
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
		    
(setq redisplay-dont-pause t)

(use-package powerline
  :config
  (powerline-default-theme)
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
	    (push '("neq" . ?≠) prettify-symbols-alist)
	    (push '("\infty" . ?∞) prettify-symbols-alist)
	    ))
	    
(global-prettify-symbols-mode +1)

(add-hook 'prog-mode-hook 'nlinum-mode)

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

(setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering

;; tooltips
(tooltip-mode -1)

(use-package typo
  :init
  (typo-global-mode 1))

(use-package pretty-mode
  :init
  (global-pretty-mode t))

;;; Fira code
;; This works when using emacs --daemon + emacsclient
(add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; This works when using emacs without server/client
(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
;; I haven't found one statement that makes both of the above situations work, so I use both for now

(defconst fira-code-font-lock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ;; The first argument to concat is a string containing a literal tab
                                   ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
          '(("\\(www\\)"                   #Xe100)
            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
            ("\\(\\*\\*\\*\\)"             #Xe102)
            ("\\(\\*\\*/\\)"               #Xe103)
            ("\\(\\*>\\)"                  #Xe104)
            ("[^*]\\(\\*/\\)"              #Xe105)
            ("\\(\\\\\\\\\\)"              #Xe106)
            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
            ("\\({-\\)"                    #Xe108)
            ("\\(\\[\\]\\)"                #Xe109)
            ("\\(::\\)"                    #Xe10a)
            ("\\(:::\\)"                   #Xe10b)
            ("[^=]\\(:=\\)"                #Xe10c)
            ("\\(!!\\)"                    #Xe10d)
            ("\\(!=\\)"                    #Xe10e)
            ("\\(!==\\)"                   #Xe10f)
            ("\\(-}\\)"                    #Xe110)
            ("\\(--\\)"                    #Xe111)
            ("\\(---\\)"                   #Xe112)
            ("\\(-->\\)"                   #Xe113)
            ("[^-]\\(->\\)"                #Xe114)
            ("\\(->>\\)"                   #Xe115)
            ("\\(-<\\)"                    #Xe116)
            ("\\(-<<\\)"                   #Xe117)
            ("\\(-~\\)"                    #Xe118)
            ("\\(#{\\)"                    #Xe119)
            ("\\(#\\[\\)"                  #Xe11a)
            ("\\(##\\)"                    #Xe11b)
            ("\\(###\\)"                   #Xe11c)
            ("\\(####\\)"                  #Xe11d)
            ("\\(#(\\)"                    #Xe11e)
            ("\\(#\\?\\)"                  #Xe11f)
            ("\\(#_\\)"                    #Xe120)
            ("\\(#_(\\)"                   #Xe121)
            ("\\(\\.-\\)"                  #Xe122)
            ("\\(\\.=\\)"                  #Xe123)
            ("\\(\\.\\.\\)"                #Xe124)
            ("\\(\\.\\.<\\)"               #Xe125)
            ("\\(\\.\\.\\.\\)"             #Xe126)
            ("\\(\\?=\\)"                  #Xe127)
            ("\\(\\?\\?\\)"                #Xe128)
            ("\\(;;\\)"                    #Xe129)
            ("\\(/\\*\\)"                  #Xe12a)
            ("\\(/\\*\\*\\)"               #Xe12b)
            ("\\(/=\\)"                    #Xe12c)
            ("\\(/==\\)"                   #Xe12d)
            ("\\(/>\\)"                    #Xe12e)
            ("\\(//\\)"                    #Xe12f)
            ("\\(///\\)"                   #Xe130)
            ("\\(&&\\)"                    #Xe131)
            ("\\(||\\)"                    #Xe132)
            ("\\(||=\\)"                   #Xe133)
            ("[^|]\\(|=\\)"                #Xe134)
            ("\\(|>\\)"                    #Xe135)
            ("\\(\\^=\\)"                  #Xe136)
            ("\\(\\$>\\)"                  #Xe137)
            ("\\(\\+\\+\\)"                #Xe138)
            ("\\(\\+\\+\\+\\)"             #Xe139)
            ("\\(\\+>\\)"                  #Xe13a)
            ("\\(=:=\\)"                   #Xe13b)
            ("[^!/]\\(==\\)[^>]"           #Xe13c)
            ("\\(===\\)"                   #Xe13d)
            ("\\(==>\\)"                   #Xe13e)
            ("[^=]\\(=>\\)"                #Xe13f)
            ("\\(=>>\\)"                   #Xe140)
            ("\\(<=\\)"                    #Xe141)
            ("\\(=<<\\)"                   #Xe142)
            ("\\(=/=\\)"                   #Xe143)
            ("\\(>-\\)"                    #Xe144)
            ("\\(>=\\)"                    #Xe145)
            ("\\(>=>\\)"                   #Xe146)
            ("[^-=]\\(>>\\)"               #Xe147)
            ("\\(>>-\\)"                   #Xe148)
            ("\\(>>=\\)"                   #Xe149)
            ("\\(>>>\\)"                   #Xe14a)
            ("\\(<\\*\\)"                  #Xe14b)
            ("\\(<\\*>\\)"                 #Xe14c)
            ("\\(<|\\)"                    #Xe14d)
            ("\\(<|>\\)"                   #Xe14e)
            ("\\(<\\$\\)"                  #Xe14f)
            ("\\(<\\$>\\)"                 #Xe150)
            ("\\(<!--\\)"                  #Xe151)
            ("\\(<-\\)"                    #Xe152)
            ("\\(<--\\)"                   #Xe153)
            ("\\(<->\\)"                   #Xe154)
            ("\\(<\\+\\)"                  #Xe155)
            ("\\(<\\+>\\)"                 #Xe156)
            ("\\(<=\\)"                    #Xe157)
            ("\\(<==\\)"                   #Xe158)
            ("\\(<=>\\)"                   #Xe159)
            ("\\(<=<\\)"                   #Xe15a)
            ("\\(<>\\)"                    #Xe15b)
            ("[^-=]\\(<<\\)"               #Xe15c)
            ("\\(<<-\\)"                   #Xe15d)
            ("\\(<<=\\)"                   #Xe15e)
            ("\\(<<<\\)"                   #Xe15f)
            ("\\(<~\\)"                    #Xe160)
            ("\\(<~~\\)"                   #Xe161)
            ("\\(</\\)"                    #Xe162)
            ("\\(</>\\)"                   #Xe163)
            ("\\(~@\\)"                    #Xe164)
            ("\\(~-\\)"                    #Xe165)
            ("\\(~=\\)"                    #Xe166)
            ("\\(~>\\)"                    #Xe167)
            ("[^<]\\(~~\\)"                #Xe168)
            ("\\(~~>\\)"                   #Xe169)
            ("\\(%%\\)"                    #Xe16a)
           ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

(defun add-fira-code-symbol-keywords ()
  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

(add-hook 'prog-mode-hook
          #'add-fira-code-symbol-keywords)

;; rainbow-delimiters config
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;; eshell stuff
(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")



(require 'em-cmpl)
(require 'em-prompt)
(require 'em-term)
;; TODO: for some reason requiring this here breaks it, but
;; requiring it after an eshell session is started works fine.
;; (require 'eshell-vc)
(setenv "PAGER" "cat")
					; (set-face-attribute 'eshell-prompt nil :foreground "turquoise1")
(add-hook 'eshell-mode-hook ;; for some reason this needs to be a hook
	  '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-bol)))
(add-to-list 'eshell-visual-commands "ssh")
(add-to-list 'eshell-visual-commands "tail")
(add-to-list 'eshell-command-completions-alist
	     '("gunzip" "gz\\'"))
(add-to-list 'eshell-command-completions-alist
	     '("tar" "\\(\\.tar|\\.tgz\\|\\.tar\\.gz\\)\\'"))
(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)
(autoload 'epe-theme-lambda "eshell-prompt-extras")
(setq eshell-highlight-prompt nil
      eshell-prompt-function 'epe-theme-lambda)

(switch-dark)
