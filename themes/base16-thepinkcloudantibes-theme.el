
;; base16-thepinkcloudantibes.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Author: Nicholas Miklaucic (nicholas-miklaucic@github.io)
;; This code is computer-generated from an image.

;;; Code:

(require 'base16-theme)

(defvar base16-thepinkcloudantibes-colors
  '(:base00 "#e5e3d1"
    :base01 "#d3d1c1"
    :base02 "#b6b5a8"
    :base03 "#3f3f40"
    :base04 "#28282c"
    :base05 "#1b1b20"
    :base06 "#111117"
    :base07 "#04040f"
    :base08 "#002138"
    :base09 "#001568"
    :base0A "#4c0006"
    :base0B "#5e0000"
    :base0C "#3b0e00"
    :base0D "#3e0f00"
    :base0E "#0b2100"
    :base0F "#002138")
  "All colors for Base16 thepinkcloudantibes are defined here.")

;; Define the theme
(deftheme base16-thepinkcloudantibes)

;; Add all the faces to the theme
(base16-theme-define 'base16-thepinkcloudantibes base16-thepinkcloudantibes-colors)

;; Mark the theme as provided
(provide-theme 'base16-thepinkcloudantibes)

(provide 'base16-thepinkcloudantibes-theme)

;; Run theme
;; (load-theme base16-thepinkcloudantibes)

;;; base16-thepinkcloudantibes-theme.el ends here
