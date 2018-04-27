;; Deals with Python
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "/home/nicholas/anaconda3/bin/ipython3"
      python-shell-interpreter-args "-i --simple-prompt")

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


;; (require 'python-django)
;; (global-set-key (kbd "C-x j") 'python-django-open-project)


(add-to-list 'load-path "~/.emacs.d/lisp/anaconda-mode/anaconda-mode/")
(add-to-list 'load-path "~/.emacs.d/lisp/company-anaconda/company-anaconda/")
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(defun py-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Python 3" "Pandas" "NumPy")))

(add-hook 'python-mode-hook 'py-doc)

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

;; (use-package ein
;;   :bind (("C-c C-j C-n" . ein:notebooklist-new-notebook-with-name)
;; 	 ("C-c C-j C-o" . ein:notebooklist-open))
;;   :config
;;   (require 'ein-loaddefs)
;;   (require 'ein-notebook)
;;   (require 'ein-subpackages)
;;   (setq ein:use-auto-complete-superpack t)
;;   (setq ein:jupyter-default-server-command "~/anaconda3/bin/jupyter")
;;   (setq ein:jupyter-default-notebook-directory "~")
;;   )
 
(defun profile-current-python-file ()
  (interactive)
  (shell-command
   (concat "python3 -m cProfile " (buffer-file-name))
   ))

(global-set-key (kbd "C-c l") 'profile-current-python-file)
