;; base16-material-dark-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Scheme: Nicholas Miklaucic
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-material-dark-colors
  '(:base00 "#212121"
    :base01 "#212121"
    :base02 "#424242"
    :base03 "#424242"
    :base04 "#757575"
    :base05 "#bdbdbd"
    :base06 "#e0e0e0"
    :base07 "#f5f5f5"
    :base08 "#f44336"
    :base09 "#ff9800"
    :base0A "#fdd835"
    :base0B "#8bc34a"
    :base0C "#00bcd4"
    :base0D "#2196f3"
    :base0E "#673ab7"
    :base0F "#d81b60")
  "All colors for Base16 Material Dark are defined here.")

;; Define the theme
(deftheme base16-material-dark)

;; Add all the faces to the theme
(base16-theme-define 'base16-material-dark base16-material-dark-colors)

;; Mark the theme as provided
(provide-theme 'base16-material-dark)

(provide 'base16-material-dark-theme)

;;; base16-material-dark-theme.el ends here
