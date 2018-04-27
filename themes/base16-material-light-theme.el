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
    :base03 "#bdbdbd"
    :base04 "#9e9e9e"
    :base05 "#636363"
    :base06 "#424242"
    :base07 "#212121"
    :base08 "#ab4121"
    :base09 "#965200"
    :base0A "#007a00"
    :base0B "#007d93"
    :base0C "#0066b9"
    :base0D "#6952ba"
    :base0E "#96409a"
    :base0F "#a5319a")
  "All colors for Base16 Material Light are defined here.")

;; Define the theme
(deftheme base16-material-light)

;; Add all the faces to the theme
(base16-theme-define 'base16-material-light base16-material-light-colors)

;; Mark the theme as provided
(provide-theme 'base16-material-light)

(provide 'base16-material-light-theme)

;;; base16-material-light-theme.el ends here
