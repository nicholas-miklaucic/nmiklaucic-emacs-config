(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(use-package rust-mode
  :config
  (setq company-tooltip-align-annotations t)
  (setq rust-format-on-save t)
  )

(use-package company-racer
  :config
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-racer))
  )
