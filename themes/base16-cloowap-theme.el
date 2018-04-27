
;; base16-cloowap.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-cloowap-colors
  '(:base00 "#000000"
    :base01 "#1c1b23"
    :base02 "#393e43"
    :base03 "#596667"
    :base04 "#7a908d"
    :base05 "#9dbdb5"
    :base06 "#c2ebde"
    :base07 "#e8ffff"
    :base08 "#3e918b"
    :base09 "#638c8a"
    :base0A "#78878d"
    :base0B "#658a9e"
    :base0C "#828394"
    :base0D "#5c8f76"
    :base0E "#588f76"
    :base0F "#618d7d")
  "All colors for Base16 cloowap are defined here.")

;; Define the theme
(deftheme base16-cloowap)

;; Add all the faces to the theme
(base16-theme-define 'base16-cloowap base16-cloowap-colors)

;; Mark the theme as provided
(provide-theme 'base16-cloowap)

(provide 'base16-cloowap-theme)

;; Run theme
;; (load-theme base16-cloowap)

;;; base16-cloowap-theme.el ends here
