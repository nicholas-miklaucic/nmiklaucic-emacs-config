;; base16-material-light-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Nicholas Miklaucic (nicholas-miklaucic.github.io)
;; Scheme: Chris Kempson (http://chriskempson.com)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-material-light-colors
  '(:base00 "#fafafa"
    :base01 "#fafafa"
    :base02 "#e0e0e0"
    :base03 "#9e9e9e"
    :base04 "#9e9e9e"
    :base05 "#757575"
    :base06 "#424242"
    :base07 "#e0e0e0"
    :base08 "#e64a19"
    :base09 "#f57c00"
    :base0A "#fbc02d"
    :base0B "#66bb6a"
    :base0C "#0288d1"
    :base0D "#303f9f"
    :base0E "#7b1fa2"
    :base0F "#d32f2f")
  "All colors for Base16 Material Light are defined here.")

;; Define the theme
(deftheme base16-material-light)

;; Add all the faces to the theme
(base16-theme-define 'base16-material-light base16-material-light-colors)

;; Mark the theme as provided
(provide-theme 'base16-material-light)

(provide 'base16-material-light-theme)

;;; base16-material-light-theme.el ends here
