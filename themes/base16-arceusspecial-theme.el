
;; base16-arceusspecial.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-arceusspecial-colors
  '(:base00 "#e1e3e1"
    :base01 "#d8d4dc"
    :base02 "#c8bdd4"
    :base03 "#7e56af"
    :base04 "#6c40a7"
    :base05 "#6032a2"
    :base06 "#58279e"
    :base07 "#501e9a"
    :base08 "#005689"
    :base09 "#0041c7"
    :base0A "#5d00f6"
    :base0B "#9200d0"
    :base0C "#b20000"
    :base0D "#b20000"
    :base0E "#833100"
    :base0F "#4c4b49")
  "All colors for Base16 arceusspecial are defined here.")

;; Define the theme
(deftheme base16-arceusspecial)

;; Add all the faces to the theme
(base16-theme-define 'base16-arceusspecial base16-arceusspecial-colors)

;; Mark the theme as provided
(provide-theme 'base16-arceusspecial)

(provide 'base16-arceusspecial-theme)

;; Run theme
;; (load-theme base16-arceusspecial)

;;; base16-arceusspecial-theme.el ends here
