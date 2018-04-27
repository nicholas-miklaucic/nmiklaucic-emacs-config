
;; base16-fallwallpaper.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-fallwallpaper-colors
  '(:base00 "#e8e4b4"
    :base01 "#d6d2a6"
    :base02 "#b9b590"
    :base03 "#433e34"
    :base04 "#2c2722"
    :base05 "#1f1b18"
    :base06 "#16100f"
    :base07 "#0c0304"
    :base08 "#640000"
    :base09 "#6c0000"
    :base0A "#490000"
    :base0B "#580000"
    :base0C "#251901"
    :base0D "#2b1d00"
    :base0E "#0e2300"
    :base0F "#640000")
  "All colors for Base16 fallwallpaper are defined here.")

;; Define the theme
(deftheme base16-fallwallpaper)

;; Add all the faces to the theme
(base16-theme-define 'base16-fallwallpaper base16-fallwallpaper-colors)

;; Mark the theme as provided
(provide-theme 'base16-fallwallpaper)

(provide 'base16-fallwallpaper-theme)

;; Run theme
;; (load-theme base16-fallwallpaper)

;;; base16-fallwallpaper-theme.el ends here
