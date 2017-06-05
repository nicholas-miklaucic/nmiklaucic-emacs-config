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
    :base01 "#424242"
    :base02 "#7cb342"
    :base03 "#9e9e9e"
    :base04 "#bdbdbd"
    :base05 "#e0e0e0"
    :base06 "#eeeeee"
    :base07 "#f5f5f5"
    :base08 "#f4511e"
    :base09 "#ffb300"
    :base0A "#7cb342"
    :base0B "#00bcd4"
    :base0C "#3f51b5"
    :base0D "#673ab7"
    :base0E "#e91e63"
    :base0F "#f44336")
  "All colors for Base16 Material Dark are defined here.")

;; Define the theme
(deftheme base16-material-dark)

;; Add all the faces to the theme
(base16-theme-define 'base16-material-dark base16-material-dark-colors)

;; Mark the theme as provided
(provide-theme 'base16-material-dark)

(provide 'base16-material-dark-theme)

;;; material-dark-theme.el ends here
