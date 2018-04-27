(TeX-add-style-hook
 "austrian"
 (lambda ()
   (TeX-run-style-hooks
    "babel"
    "germanb")
   (TeX-add-symbols
    "LdfInit"
    "bblstyerror"
    "ProvidesLanguage"
    "atcatcode"
    "CurrentOption"))
 :latex)

