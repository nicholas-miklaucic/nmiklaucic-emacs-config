
;; base16-hwxsd.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-hwxsd-colors
  '(:base00 "#231241"
    :base01 "#342045"
    :base02 "#4e384a"
    :base03 "#c2b555"
    :base04 "#dcd453"
    :base05 "#ede751"
    :base06 "#f9f54f"
    :base07 "#ffff4d"
    :base08 "#ffb7ff"
    :base09 "#ffa5ff"
    :base0A "#ffb9ff"
    :base0B "#ffccff"
    :base0C "#ffadff"
    :base0D "#ffc4fa"
    :base0E "#ffbef4"
    :base0F "#ffb598")
  "All colors for Base16 hwxsd are defined here.")

;; Define the theme
(deftheme base16-hwxsd)

;; Add all the faces to the theme
(base16-theme-define 'base16-hwxsd base16-hwxsd-colors)

;; Mark the theme as provided
(provide-theme 'base16-hwxsd)

(provide 'base16-hwxsd-theme)

;; Run theme
;; (load-theme base16-hwxsd)

;;; base16-hwxsd-theme.el ends here
