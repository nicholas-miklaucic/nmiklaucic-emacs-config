
;; base16-uujm.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-uujm-colors
  '(:base00 "#000000"
    :base01 "#201617"
    :base02 "#433a38"
    :base03 "#6a615c"
    :base04 "#948b82"
    :base05 "#c0b8ab"
    :base06 "#eee6d6"
    :base07 "#ffffff"
    :base08 "#497b78"
    :base09 "#687292"
    :base0A "#73717c"
    :base0B "#7a7071"
    :base0C "#7a706e"
    :base0D "#8b6d3e"
    :base0E "#846f4d"
    :base0F "#69774d")
  "All colors for Base16 uujm are defined here.")

;; Define the theme
(deftheme base16-uujm)

;; Add all the faces to the theme
(base16-theme-define 'base16-uujm base16-uujm-colors)

;; Mark the theme as provided
(provide-theme 'base16-uujm)

(provide 'base16-uujm-theme)

;; Run theme
;; (load-theme base16-uujm)

;;; base16-uujm-theme.el ends here
