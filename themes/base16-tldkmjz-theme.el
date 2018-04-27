
;; base16-tldkmjz.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-tldkmjz-colors
  '(:base00 "#000000"
    :base01 "#221b22"
    :base02 "#443d44"
    :base03 "#686369"
    :base04 "#8f8b90"
    :base05 "#b8b6ba"
    :base06 "#e2e2e5"
    :base07 "#ffffff"
    :base08 "#697598"
    :base09 "#6f739f"
    :base0A "#76719c"
    :base0B "#79737f"
    :base0C "#867072"
    :base0D "#aa6059"
    :base0E "#cf412a"
    :base0F "#897159")
  "All colors for Base16 tldkmjz are defined here.")

;; Define the theme
(deftheme base16-tldkmjz)

;; Add all the faces to the theme
(base16-theme-define 'base16-tldkmjz base16-tldkmjz-colors)

;; Mark the theme as provided
(provide-theme 'base16-tldkmjz)

(provide 'base16-tldkmjz-theme)

;; Run theme
;; (load-theme base16-tldkmjz)

;;; base16-tldkmjz-theme.el ends here
