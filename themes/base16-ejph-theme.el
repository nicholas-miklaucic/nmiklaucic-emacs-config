
;; base16-ejph.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-ejph-colors
  '(:base00 "#1c1b21"
    :base01 "#28282e"
    :base02 "#3f3e45"
    :base03 "#b2b5b9"
    :base04 "#ced1d5"
    :base05 "#dfe3e6"
    :base06 "#ecf1f4"
    :base07 "#f7fcff"
    :base08 "#dae3fa"
    :base09 "#d8e3ff"
    :base0A "#dbe2fb"
    :base0B "#dae2fc"
    :base0C "#dfe2f7"
    :base0D "#ffbeff"
    :base0E "#ffd5ca"
    :base0F "#f4ded0")
  "All colors for Base16 ejph are defined here.")

;; Define the theme
(deftheme base16-ejph)

;; Add all the faces to the theme
(base16-theme-define 'base16-ejph base16-ejph-colors)

;; Mark the theme as provided
(provide-theme 'base16-ejph)

(provide 'base16-ejph-theme)

;; Run theme
;; (load-theme base16-ejph)

;;; base16-ejph-theme.el ends here
