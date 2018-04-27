
;; base16-jxytxt.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-jxytxt-colors
  '(:base00 "#ffffc6"
    :base01 "#e5e0b3"
    :base02 "#bdbca1"
    :base03 "#96998e"
    :base04 "#70787c"
    :base05 "#4b5869"
    :base06 "#253a57"
    :base07 "#001f45"
    :base08 "#5a9393"
    :base09 "#6e9090"
    :base0A "#5d92a1"
    :base0B "#678fa6"
    :base0C "#6e8daa"
    :base0D "#8d8a66"
    :base0E "#818d73"
    :base0F "#768f7f")
  "All colors for Base16 jxytxt are defined here.")

;; Define the theme
(deftheme base16-jxytxt)

;; Add all the faces to the theme
(base16-theme-define 'base16-jxytxt base16-jxytxt-colors)

;; Mark the theme as provided
(provide-theme 'base16-jxytxt)

(provide 'base16-jxytxt-theme)

;; Run theme
;; (load-theme base16-jxytxt)

;;; base16-jxytxt-theme.el ends here
