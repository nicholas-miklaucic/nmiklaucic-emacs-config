
;; base16-dtvhst.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-dtvhst-colors
  '(:base00 "#00000b"
    :base01 "#1a1c1c"
    :base02 "#3e3f2a"
    :base03 "#656538"
    :base04 "#8d8f45"
    :base05 "#b8bb52"
    :base06 "#e5e95e"
    :base07 "#ffff6b"
    :base08 "#7f7f80"
    :base09 "#798089"
    :base0A "#7280a2"
    :base0B "#947a69"
    :base0C "#bd6910"
    :base0D "#a57542"
    :base0E "#8e7d63"
    :base0F "#9e7900")
  "All colors for Base16 dtvhst are defined here.")

;; Define the theme
(deftheme base16-dtvhst)

;; Add all the faces to the theme
(base16-theme-define 'base16-dtvhst base16-dtvhst-colors)

;; Mark the theme as provided
(provide-theme 'base16-dtvhst)

(provide 'base16-dtvhst-theme)

;; Run theme
;; (load-theme base16-dtvhst)

;;; base16-dtvhst-theme.el ends here
