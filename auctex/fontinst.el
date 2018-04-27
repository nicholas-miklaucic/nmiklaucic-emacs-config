(TeX-add-style-hook
 "fontinst"
 (lambda ()
   (TeX-run-style-hooks)
   (TeX-add-symbols
    "c"
    "d"
    "e"
    "f"
    "one"
    "five"
    "two"
    "closed"
    "result"
    "slot"
    "mapfont"
    "rawfont"
    "side"
    "curr"
    "font"
    "minimum"
    "bbox"
    "command"
    "transform"
    "fontinstversion"
    "NeedsTeXFormat"
    "ProvidesPackage"
    "fontinstcc"
    "supereject"
    "empty"
    "identity"
    "swap"
    "prep"
    "never"
    "eTeX"
    "pdfTeX"
    "needsTeXextension"
    "TeX"
    "allocate"
    "open"
    "close"
    "pout"
    "tempfileprefix"
    "temp"
    "then"
    "Else"
    "Fi"
    "primitiveinput"
    "process"
    "format"
    "generic"
    "messagebreak"
    "fontinsterror"
    "fontinstwarning"
    "fontinstwarningnoline"
    "fontinstinfo"
    "on"
    "error"
    "str"
    "strint"
    "eval"
    "g"
    "add"
    "sub"
    "int"
    "neg"
    "mul"
    "div"
    "max"
    "min"
    "half"
    "otherhalf"
    "scale"
    "rounded"
    "l"
    "ifnumber"
    "setcommand"
    "x"
    "resetint"
    "resetstr"
    "resetdim"
    "resetcommand"
    "dim"
    "ifisint"
    "ifisstr"
    "ifisdim"
    "ifiscommand"
    "unsetint"
    "unsetstr"
    "unsetdim"
    "unsetcommand"
    "offcommand"
    "oncommand"
    "generate"
    "count"
    "foreach"
    "begincomment"
    "inputetx"
    "nextslot"
    "skipslots"
    "setrightboundary"
    "Ligature"
    "oddligature"
    "usedas"
    "Unicode"
    "charseq"
    "useexamplefont"
    "slotexample"
    "setslotcomment"
    "resetslotcomment"
    "unsetslotcomment"
    "label"
    "inputmtx"
    "relax"
    "ProvidesMtxPackage"
    "usemtxpackage"
    "test"
    "mtx"
    "load"
    "resetkern"
    "setleftkerning"
    "setrightkerning"
    "setleftrightkerning"
    "set"
    "kerning"
    "ifiskern"
    "unsetkerns"
    "main"
    "noleftkerning"
    "norightkerning"
    "noleftrightkerning"
    "no"
    "height"
    "depth"
    "italic"
    "mapcommands"
    "mapfonts"
    "second"
    "third"
    "fourth"
    "fifth"
    "sixth"
    "setrawglyph"
    "setnotglyph"
    "unsetglyph"
    "glyphrule"
    "glyphspecial"
    "glyphwarning"
    "movert"
    "moveup"
    "push"
    "pop"
    "resetwidth"
    "resetheight"
    "resetdepth"
    "resetitalic"
    "glyphbboxright"
    "same"
    "ifisglyph"
    "ifareglyphs"
    "if"
    "etxtovpl"
    "etxtopl"
    "etx"
    "pre"
    "post"
    "tidying"
    "top"
    "makerightboundary"
    "assign"
    "bad"
    "ifisinslot"
    "ligature"
    "k"
    "rboundary"
    "rbserver"
    "wrn"
    "boundary"
    "out"
    "nextlarger"
    "vartop"
    "varmid"
    "varbot"
    "varrep"
    "saved"
    "notdef"
    "end"
    "vpl"
    "make"
    "installraw"
    "prev"
    "file"
    "installfontas"
    "autoinstallfamily"
    "input"
    "reset"
    "get"
    "ifoption"
    "fd"
    "remove"
    "substitute"
    "substitutesilent"
    "substitutenoisy"
    "declareencoding"
    "declaresize"
    "NOFILES"
    "installfont"
    "installrawfont"
    "installfamily"
    "touch"
    "CalculateSin"
    "CalculateCos"
    "UseSin"
    "UseCos"
    "CalculateTan"
    "UseTan"
    "afmtomtx"
    "cc"
    "uprightitalcorr"
    "slanteditalcorr"
    "calculate"
    "italcorr"
    "list"
    "char"
    "definealias"
    "glyph"
    "charnameprefix"
    "charnamealias"
    "alias"
    "afm"
    "init"
    "generalpltomtx"
    "setfontdimen"
    "pltomtx"
    "ignore"
    "gobble"
    "FAMILY"
    "FACE"
    "CHECKSUM"
    "HEADER"
    "SEVENBITSAFEFLAG"
    "COMMENT"
    "LIG"
    "NEXTLARGER"
    "VARCHAR"
    "VTITLE"
    "MAPFONT"
    "MAP"
    "CODINGSCHEME"
    "DESIGNSIZE"
    "DESIGNUNITS"
    "BOUNDARYCHAR"
    "PARAMETER"
    "FONTDIMEN"
    "SLANT"
    "SPACE"
    "STRETCH"
    "SHRINK"
    "XHEIGHT"
    "QUAD"
    "EXTRASPACE"
    "NUM"
    "DENOM"
    "SUP"
    "SUB"
    "SUPDROP"
    "SUBDROP"
    "AXISHEIGHT"
    "DELIM"
    "DEFAULTRULETHICKNESS"
    "BIGOPSPACING"
    "LABEL"
    "LIGTABLE"
    "STOP"
    "SKIP"
    "KRN"
    "CHARWD"
    "CHARHT"
    "CHARDP"
    "CHARIC"
    "CHARACTER"
    "write"
    "mtxtopl"
    "first"
    "pl"
    "transformfont"
    "fromafm"
    "frommtx"
    "frompl"
    "fromplgivenetx"
    "fromany"
    "scalefont"
    "xscalefont"
    "yscalefont"
    "slantfont"
    "reencodefont"
    "b"
    "italicslant"
    "width"
    "aliased"
    "mtxtomtx"
    "setsomething"
    "offmtxcommand"
    "onmtxcommand"
    "renameglyphweighted"
    "killglyphweighted"
    "reglyphfont"
    "setint"
    "setdim"
    "setstr"
    "setscaledrawglyph"
    "setscalednotglyph"
    "setkern"
    "glyphpcc"
    "samesize"
    "rename"
    "kill"
    "a"
    "glyphname"
    "reglyph"
    "latinfamily"
    "parse"
    "fakenarrow"
    "fake"
    "latin"
    "raw"
    "adobe"
    "expert"
    "caps"
    "oldstyle"
    "SlantAmount"
    "mapfrags"
    "storemapdata"
    "record"
    "declarepsencoding"
    "providepsencoding"
    "needsfontinstversion")
   (LaTeX-add-environments
    "recordtransforms"
    "setglyph"
    "reglyphfonts"
    "autoaliasafm"
    "installfonts"
    "varchar"
    "setleftboundary"
    "resetglyph"
    "metrics"
    "setslot"
    "encoding"
    "comment"
    "for"))
 :latex)

