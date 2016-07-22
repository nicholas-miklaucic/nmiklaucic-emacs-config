;; Deals with Python
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(elpy-use-cpython)
(setq python-shell-interpreter "python3")

(require 'python-django)
(global-set-key (kbd "C-x j") 'python-django-open-project)
