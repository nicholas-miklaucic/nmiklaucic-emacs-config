(setq org-hide-emphasis-markers t)
(setq org-agenda-include-diary t)
(setq org-columns-default-format "%50ITEM %5TODO %3PRIORITY %30TAGS")
(setq org-log-done t)
(setq org-pretty-entities t)
(setq org-startup-with-latex-preview t)
(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
(global-set-key (kbd "C-c t") 'org-time-stamp)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(setq org-refile-targets (quote (("~/Dropbox/personal/agenda.org" :maxlevel . 1) 
				 ("~/Dropbox/personal/someday-maybe.org" :level . 2))))
(use-package ob-ipython)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   (python . t)
   ))

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
;; gets overwitten by hyperbole, so substitute
(global-set-key (kbd "M-n") 'org-meta-return)
