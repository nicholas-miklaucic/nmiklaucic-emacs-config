
;; base16-ueacg.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-ueacg-colors
  '(:base00 "#000000"
    :base01 "#1c1b1f"
    :base02 "#383e40"
    :base03 "#556665"
    :base04 "#74908c"
    :base05 "#95bcb5"
    :base06 "#b7eae0"
    :base07 "#daffff"
    :base08 "#558882"
    :base09 "#148ca2"
    :base0A "#758185"
    :base0B "#5983b2"
    :base0C "#c0634e"
    :base0D "#96786b"
    :base0E "#bf652c"
    :base0F "#009276")
  "All colors for Base16 ueacg are defined here.")

;; Define the theme
(deftheme base16-ueacg)

;; Add all the faces to the theme
(base16-theme-define 'base16-ueacg base16-ueacg-colors)

;; Mark the theme as provided
(provide-theme 'base16-ueacg)

(provide 'base16-ueacg-theme)

;; Run theme
;; (load-theme base16-ueacg)

;;; base16-ueacg-theme.el ends here
