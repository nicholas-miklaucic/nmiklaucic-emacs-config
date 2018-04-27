
;; base16-tgmyxpt.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-tgmyxpt-colors
  '(:base00 "#000000"
    :base01 "#13100d"
    :base02 "#39362e"
    :base03 "#636151"
    :base04 "#908f76"
    :base05 "#c0c09d"
    :base06 "#f3f3c7"
    :base07 "#fffff2"
    :base08 "#687c78"
    :base09 "#ca4e37"
    :base0A "#a56756"
    :base0B "#d73e1b"
    :base0C "#a8682f"
    :base0D "#727d42"
    :base0E "#657e6c"
    :base0F "#637e6b")
  "All colors for Base16 tgmyxpt are defined here.")

;; Define the theme
(deftheme base16-tgmyxpt)

;; Add all the faces to the theme
(base16-theme-define 'base16-tgmyxpt base16-tgmyxpt-colors)

;; Mark the theme as provided
(provide-theme 'base16-tgmyxpt)

(provide 'base16-tgmyxpt-theme)

;; Run theme
;; (load-theme base16-tgmyxpt)

;;; base16-tgmyxpt-theme.el ends here
