(TeX-add-style-hook
 "UKenglish"
 (lambda ()
   (TeX-run-style-hooks
    "babel"
    "english")
   (TeX-add-symbols
    "LdfInit"
    "bblstyerror"
    "ProvidesLanguage"
    "atcatcode"
    "CurrentOption"))
 :latex)

