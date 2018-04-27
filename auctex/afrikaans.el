(TeX-add-style-hook
 "afrikaans"
 (lambda ()
   (TeX-run-style-hooks
    "babel"
    "dutch")
   (TeX-add-symbols
    "LdfInit"
    "bblstyerror"
    "ProvidesLanguage"
    "atcatcode"
    "CurrentOption"))
 :latex)

