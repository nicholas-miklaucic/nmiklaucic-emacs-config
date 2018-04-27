
;; base16-gelfossrainbow.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-gelfossrainbow-colors
  '(:base00 "#1a1c1c"
    :base01 "#262929"
    :base02 "#3c4040"
    :base03 "#aeb6b8"
    :base04 "#cad2d5"
    :base05 "#dbe4e7"
    :base06 "#e8f2f5"
    :base07 "#f3fdff"
    :base08 "#d3e6f0"
    :base09 "#c9e7fb"
    :base0A "#cfe5fe"
    :base0B "#e1e5c8"
    :base0C "#dfe5ca"
    :base0D "#dce7b7"
    :base0E "#c9ee92"
    :base0F "#d8e6d6")
  "All colors for Base16 gelfossrainbow are defined here.")

;; Define the theme
(deftheme base16-gelfossrainbow)

;; Add all the faces to the theme
(base16-theme-define 'base16-gelfossrainbow base16-gelfossrainbow-colors)

;; Mark the theme as provided
(provide-theme 'base16-gelfossrainbow)

(provide 'base16-gelfossrainbow-theme)

;; Run theme
;; (load-theme base16-gelfossrainbow)

;;; base16-gelfossrainbow-theme.el ends here
