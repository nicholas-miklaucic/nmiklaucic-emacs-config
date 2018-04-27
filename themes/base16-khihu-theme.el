
;; base16-khihu.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-khihu-colors
  '(:base00 "#000000"
    :base01 "#1c1b1c"
    :base02 "#2f4040"
    :base03 "#426967"
    :base04 "#559592"
    :base05 "#67c3bf"
    :base06 "#79f4ee"
    :base07 "#8bffff"
    :base08 "#567275"
    :base09 "#3d7680"
    :base0A "#007a94"
    :base0B "#ba4600"
    :base0C "#9b5d39"
    :base0D "#786b5e"
    :base0E "#866738"
    :base0F "#6c6f5f")
  "All colors for Base16 khihu are defined here.")

;; Define the theme
(deftheme base16-khihu)

;; Add all the faces to the theme
(base16-theme-define 'base16-khihu base16-khihu-colors)

;; Mark the theme as provided
(provide-theme 'base16-khihu)

(provide 'base16-khihu-theme)

;; Run theme
;; (load-theme base16-khihu)

;;; base16-khihu-theme.el ends here
