
;; base16-rlajxb.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-rlajxb-colors
  '(:base00 "#000000"
    :base01 "#1b1b1f"
    :base02 "#3e3e3b"
    :base03 "#64635a"
    :base04 "#8d8c7a"
    :base05 "#b9b79d"
    :base06 "#e6e4c0"
    :base07 "#ffffe5"
    :base08 "#747f7d"
    :base09 "#67827f"
    :base0A "#737e8d"
    :base0B "#5e7fb3"
    :base0C "#bf613d"
    :base0D "#8a796d"
    :base0E "#847b6c"
    :base0F "#907a25")
  "All colors for Base16 rlajxb are defined here.")

;; Define the theme
(deftheme base16-rlajxb)

;; Add all the faces to the theme
(base16-theme-define 'base16-rlajxb base16-rlajxb-colors)

;; Mark the theme as provided
(provide-theme 'base16-rlajxb)

(provide 'base16-rlajxb-theme)

;; Run theme
;; (load-theme base16-rlajxb)

;;; base16-rlajxb-theme.el ends here
