
;; base16-recpd.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-recpd-colors
  '(:base00 "#000000"
    :base01 "#1f1d22"
    :base02 "#423f40"
    :base03 "#686360"
    :base04 "#918a81"
    :base05 "#bcb4a5"
    :base06 "#e9dfc9"
    :base07 "#fffff0"
    :base08 "#847b7a"
    :base09 "#a96e52"
    :base0A "#92776b"
    :base0B "#98765d"
    :base0C "#8b7a65"
    :base0D "#837c71"
    :base0E "#867c6a"
    :base0F "#7f7d76")
  "All colors for Base16 recpd are defined here.")

;; Define the theme
(deftheme base16-recpd)

;; Add all the faces to the theme
(base16-theme-define 'base16-recpd base16-recpd-colors)

;; Mark the theme as provided
(provide-theme 'base16-recpd)

(provide 'base16-recpd-theme)

;; Run theme
;; (load-theme base16-recpd)

;;; base16-recpd-theme.el ends here
