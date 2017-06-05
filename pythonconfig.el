;; Deals with Python
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(elpy-use-cpython)
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-interactive-arg "-i")

;; remove garbled color text
(use-package ansi-color
  :init
  (defun display-ansi-colors ()
    (interactive)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max))))
  (add-hook 'python-shell-send-setup-code 'display-ansi-colors)
  )

(add-hook 'compilation-mode-hook 'ansi-color-for-comint-mode-on)


(require 'python-django)
(global-set-key (kbd "C-x j") 'python-django-open-project)


(add-to-list 'load-path "~/.emacs.d/lisp/anaconda-mode/anaconda-mode/")
(add-to-list 'load-path "~/.emacs.d/lisp/company-anaconda/company-anaconda/")
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(setq gud-pdb-command-name "python3 -m pdb")
(global-set-key (kbd "C-c d") 'realgud:pdb)

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

(use-package ein
  :bind (("C-c C-j C-n" . ein:notebooklist-new-notebook-with-name)
	 ("C-c C-j C-o" . ein:notebooklist-open))
  )
 
(defun profile-current-python-file ()
  (interactive)
  (shell-command
   (concat "python3 -m cProfile " (buffer-file-name))
   ))

(global-set-key (kbd "C-c l") 'profile-current-python-file)
