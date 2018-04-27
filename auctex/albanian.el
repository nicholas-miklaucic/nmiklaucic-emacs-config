(TeX-add-style-hook
 "albanian"
 (lambda ()
   (TeX-run-style-hooks
    "babel")
   (TeX-add-symbols
    "LdfInit"
    "bblstyerror"
    "ProvidesLanguage"
    "atcatcode"
    "CurrentOption"))
 :latex)

