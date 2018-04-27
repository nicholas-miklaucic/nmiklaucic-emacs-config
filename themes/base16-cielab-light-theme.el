;; base16-cielab-light-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Nicholas Miklaucic (nicholas-miklaucic.github.io)
;; Scheme: Chris Kempson (http://chriskempson.com)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-cielab-light-colors
  '(:base00 "#ffffff"
    :base01 "#d6d6d6"
    :base02 "#afafaf"
    :base03 "#898989"
    :base04 "#656565"
    :base05 "#434343"
    :base06 "#242424"
    :base07 "#000000"
    :base08 "#DC2A67"
    :base09 "#BF570A"
    :base0A "#777C00"
    :base0B "#008D29"
    :base0C "#00918A"
    :base0D "#008BD9"
    :base0E "#2B75EE"
    :base0F "#B948BD")
  "All colors for Base16 Cielab Light are defined here.")

;; Define the theme
(deftheme base16-cielab-light)

;; Add all the faces to the theme
(base16-theme-define 'base16-cielab-light base16-cielab-light-colors)

;; Mark the theme as provided
(provide-theme 'base16-cielab-light)

(provide 'base16-cielab-light-theme)
;;; base16-cielab-light-theme.el ends here
