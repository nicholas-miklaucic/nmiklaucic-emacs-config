
;; base16-uplff.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-uplff-colors
  '(:base00 "#1a1b26"
    :base01 "#28282f"
    :base02 "#413e3f"
    :base03 "#bfb48a"
    :base04 "#ddd19c"
    :base05 "#f0e2a7"
    :base06 "#fef0af"
    :base07 "#fffbb6"
    :base08 "#dce3f4"
    :base09 "#dee2f2"
    :base0A "#dbe2ff"
    :base0B "#e1e2ee"
    :base0C "#f4dddb"
    :base0D "#ffd9cf"
    :base0E "#ffd0a9"
    :base0F "#ffd47f")
  "All colors for Base16 uplff are defined here.")

;; Define the theme
(deftheme base16-uplff)

;; Add all the faces to the theme
(base16-theme-define 'base16-uplff base16-uplff-colors)

;; Mark the theme as provided
(provide-theme 'base16-uplff)

(provide 'base16-uplff-theme)

;; Run theme
;; (load-theme base16-uplff)

;;; base16-uplff-theme.el ends here
