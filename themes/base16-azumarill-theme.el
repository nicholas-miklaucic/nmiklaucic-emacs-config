
;; base16-azumarill.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-azumarill-colors
  '(:base00 "#e3e2de"
    :base01 "#d2d1cd"
    :base02 "#b6b5b2"
    :base03 "#424241"
    :base04 "#2c2c2b"
    :base05 "#1f1f1f"
    :base06 "#161616"
    :base07 "#0c0c0c"
    :base08 "#002435"
    :base09 "#002544"
    :base0A "#11212b"
    :base0B "#002543"
    :base0C "#002548"
    :base0D "#002443"
    :base0E "#00254f"
    :base0F "#002552")
  "All colors for Base16 azumarill are defined here.")

;; Define the theme
(deftheme base16-azumarill)

;; Add all the faces to the theme
(base16-theme-define 'base16-azumarill base16-azumarill-colors)

;; Mark the theme as provided
(provide-theme 'base16-azumarill)

(provide 'base16-azumarill-theme)

;; Run theme
;; (load-theme base16-azumarill)

;;; base16-azumarill-theme.el ends here
