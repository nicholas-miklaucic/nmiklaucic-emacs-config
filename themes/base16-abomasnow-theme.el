
;; base16-abomasnow.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-abomasnow-colors
  '(:base00 "#e2e2e2"
    :base01 "#e0dee0"
    :base02 "#dcd8db"
    :base03 "#c9bac8"
    :base04 "#c5b4c3"
    :base05 "#c2b0c1"
    :base06 "#c1adbf"
    :base07 "#bfabbd"
    :base08 "#ccabce"
    :base09 "#cbaccc"
    :base0A "#cdabcc"
    :base0B "#cdabcc"
    :base0C "#cfaace"
    :base0D "#cfaacc"
    :base0E "#cfaacc"
    :base0F "#cfaacc")
  "All colors for Base16 abomasnow are defined here.")

;; Define the theme
(deftheme base16-abomasnow)

;; Add all the faces to the theme
(base16-theme-define 'base16-abomasnow base16-abomasnow-colors)

;; Mark the theme as provided
(provide-theme 'base16-abomasnow)

(provide 'base16-abomasnow-theme)

;; Run theme
;; (load-theme base16-abomasnow)

;;; base16-abomasnow-theme.el ends here
