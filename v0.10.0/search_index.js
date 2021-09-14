var documenterSearchIndex = {"docs":
[{"location":"guide/#User-guide","page":"Guide","title":"User guide","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"The CitableText module includes a panoply of functions for working with Cts Urns.  The API documentation has a more complete list than the few illustrated here.","category":"page"},{"location":"guide/#Top-level-components","page":"Guide","title":"Top-level components","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"Include the CitableBase module for access to the generic components and parts functions.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"using CitableText, CitableBase\nurn = CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\")\ncomponents(urn)\n\n# output\n\n5-element Vector{SubString{String}}:\n \"urn\"\n \"cts\"\n \"greekLit\"\n \"tlg0012.tlg001.msA\"\n \"1.1\"","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"components(urn)[4] |> parts\n\n# output\n\n3-element Vector{SubString{String}}:\n \"tlg0012\"\n \"tlg001\"\n \"msA\"","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"Or use these functions to refer to them by name.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"namespace(urn)\n\n# output\n\n\"greekLit\"","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"workcomponent(urn)\n\n# output\n\n\"tlg0012.tlg001.msA\"","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"passagecomponent(urn)\n\n# output\n\n\"1.1\"","category":"page"},{"location":"guide/#The-work-component","page":"Guide","title":"The work component","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"workdepth(urn)\n\n# output\n\n3","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"workparts(urn)\n\n# output\n\n3-element Vector{SubString{String}}:\n \"tlg0012\"\n \"tlg001\"\n \"msA\"","category":"page"},{"location":"guide/#The-passage-component","page":"Guide","title":"The passage component","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"passagedepth(urn)\n\n# output\n\n2","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"passageparts(urn)\n\n# output\n\n2-element Vector{SubString{String}}:\n \"1\"\n \"1\"","category":"page"},{"location":"guide/#Ranges","page":"Guide","title":"Ranges","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"TBA","category":"page"},{"location":"guide/#Subreferences","page":"Guide","title":"Subreferences","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"TBA","category":"page"},{"location":"apis/#API-documentation","page":"API documentation","title":"API documentation","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"","category":"page"},{"location":"apis/#Types","page":"API documentation","title":"Types","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"CtsUrn","category":"page"},{"location":"apis/#CitableText.CtsUrn","page":"API documentation","title":"CitableText.CtsUrn","text":"Implementation of the CTS URN. See  http://cite-architecture.org/ctsurn/.\n\n\n\n\n\n","category":"type"},{"location":"apis/#Functions","page":"API documentation","title":"Functions","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"namespace\nworkcomponent\npassagecomponent\npassagedepth\npassageparts\nworkdepth\nworkparts\nisrange\nrangebegin\nrangeend\nhassubref\nsubref\ndroppassage\naddpassage\ndropversion\naddversion\ndropexemplar\naddexemplar\ndropsubref\ncollapsePassageTo\ncollapsePassageBy\nworkcontains\npassagecontains\nurncontains\nurnmatches","category":"page"},{"location":"apis/#CitableText.namespace","page":"API documentation","title":"CitableText.namespace","text":"namespace(u)\n\n\nExtract CTS namespace from a CtsUrn.\n\nExamples\n\njulia>\nnamespace(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.workcomponent","page":"API documentation","title":"CitableText.workcomponent","text":"workcomponent(u)\n\n\nExtract work component from a CtsUrn.\n\nExamples\n\njulia>\nworkcomponent(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.passagecomponent","page":"API documentation","title":"CitableText.passagecomponent","text":"passagecomponent(u)\n\n\nExtract passage component from a CtsUrn.\n\nExamples\n\njulia>\npassagecomponent(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.passagedepth","page":"API documentation","title":"CitableText.passagedepth","text":"passagedepth(u)\n\n\nCount number of levels in the passage hierarchy of a CTS URN.\n\nExamples\n\njulia>\npassagedepth(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.passageparts","page":"API documentation","title":"CitableText.passageparts","text":"passageparts(u)\n\n\nExtract an array with all the parts of the passage hierarchy of a CTS URN.\n\nExamples\n\njulia>\nworkparts(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.workdepth","page":"API documentation","title":"CitableText.workdepth","text":"workdepth(u)\n\n\nCount number of levels in the work hierarchy of a CTS URN.\n\nExamples\n\njulia>\nworkdepth(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.workparts","page":"API documentation","title":"CitableText.workparts","text":"workparts(u)\n\n\nExtract an array with all the parts of the work hierarchy of a CTS URN.\n\nExamples\n\njulia>\nworkparts(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.isrange","page":"API documentation","title":"CitableText.isrange","text":"isrange(psg)\n\n\nTrue if passage component string is a range..\n\nExamples\n\njulia>\nisrange(\"1.1-1.10\"))\n\n\n\n\n\nisrange(u)\n\n\nTrue if passage component is a range..\n\nExamples\n\njulia>\nisrange(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.rangebegin","page":"API documentation","title":"CitableText.rangebegin","text":"rangebegin(s)\n\n\nExtract first range part from a passage component.\n\nExamples\n\njulia>\nrangebegin(\"1.1-1.10\"))\n\n\n\n\n\nrangebegin(u)\n\n\nExtract first range part from a CtsUrn.\n\nExamples\n\njulia>\nrangebegin(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.rangeend","page":"API documentation","title":"CitableText.rangeend","text":"rangeend(u)\n\n\nExtract second range part from a passage component.\n\nExamples\n\njulia>\nrangeend(\"1.1-1.10\"))\n\n\n\n\n\nrangeend(s)\n\n\nExtract second range part from a CtsUrn.\n\nExamples\n\njulia>\nrangeend(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.hassubref","page":"API documentation","title":"CitableText.hassubref","text":"hassubref(psg)\n\n\nTrue if String has a subreference.\n\nExamples\n\njulia>\nhassubref(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10@μῆνιν\"))\n\n\n\n\n\nhassubref(u)\n\n\nTrue if CtsUrn has a subreference.\n\nExamples\n\njulia>\nhassubref(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10@μῆνιν\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.subref","page":"API documentation","title":"CitableText.subref","text":"subref(s)\n\n\nExtract subrerence part of a passage string.\n\nExamples\n\njulia>\nsubref(1.1-1.10@μῆνιν\")\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.droppassage","page":"API documentation","title":"CitableText.droppassage","text":"droppassage(u)\n\n\nCreate a new CtsUrn by dropping the passage component of a given CtsUrn.\n\nExamples\n\njulia>\ndroppassage(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.addpassage","page":"API documentation","title":"CitableText.addpassage","text":"addpassage(u, psg)\n\n\nCreate a new CtsUrn by replacing any passage component in a given CtsUrn with a new passage component.\n\nExamples\n\njulia>\naddpassage(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.dropversion","page":"API documentation","title":"CitableBase.dropversion","text":"Catch-all function for dropversion method.\n\ndropversion(u)\n\n\n\n\n\n\ndropversion(u)\n\n\nCreate a new CtsUrn by dropping the version part of a given CtsUrn's work component.\n\nExamples\n\njulia>\ndropversion(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.addversion","page":"API documentation","title":"CitableBase.addversion","text":"Catch-all function for addversion method.\n\naddversion(u, s)\n\n\n\n\n\n\naddversion(u, vers)\n\n\nCreate a new CtsUrn by replacing any version part of a given CtsUrn's work component with a new version part.\n\nExamples\n\njulia>\naddversion(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.dropexemplar","page":"API documentation","title":"CitableText.dropexemplar","text":"dropexemplar(u)\n\n\nCreate a new CtsUrn by dropping the exemplar part of a given CtsUrn's work component.\n\nExamples\n\njulia>\ndropexemplar(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.addexemplar","page":"API documentation","title":"CitableText.addexemplar","text":"addexemplar(u, ex)\n\n\nCreate a new CtsUrn by replacing any exemplar part of a given CtsUrn's work component with a new exemplar part.\n\nExamples\n\njulia>\naddexemplar(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.dropsubref","page":"API documentation","title":"CitableText.dropsubref","text":"dropsubref(s)\n\n\nRemove any subreference substrings in a string. If s is a range expression, separately drop subreference from each of range-begin and range-end parts.\n\n\n\n\n\ndropsubref(u)\n\n\nRemove any subreferences from a CtsUrn.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.collapsePassageTo","page":"API documentation","title":"CitableText.collapsePassageTo","text":"collapsePassageTo(u, count)\n\n\nCreate a new CtsUrn by collapsing a given CtsUrn's passage hierarchy to a given level.\n\nExamples\n\njulia>\ncollapsePassageTo(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.collapsePassageBy","page":"API documentation","title":"CitableText.collapsePassageBy","text":"collapsePassageBy(u, n)\n\n\nCreate a new CtsUrn by collapsing a given CtsUrn's passage hierarchy by a given number of levels.\n\nExamples\n\njulia>\ncollapsePassageBy(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1-1.10\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.workcontains","page":"API documentation","title":"CitableText.workcontains","text":"workcontains(urn1, urn2)\n\n\nTrue if work component of urn1 contains or is equal to work component of urn2.\n\nExamples\n\njulia>\nworkcontains(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1\")\nCtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1\")\n)\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.passagecontains","page":"API documentation","title":"CitableText.passagecontains","text":"passagecontains(urn1, urn2)\n\n\nTrue if passage component of urn1 contains or is equal to passage component of urn2.\n\nExamples\n\njulia>\npassagecontains(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1.1\")\nCtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1\")\n)\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.urncontains","page":"API documentation","title":"CitableText.urncontains","text":"urncontains(urn1, urn2)\n\n\nTrue if urn1 contains urn2 according to URN logic.\n\nExamples\n\njulia>\nurncontains(CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\")\nCtsUrn(\"urn:cts:greekLit:tlg0012.tlg001:1\")\n)\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableText.urnmatches","page":"API documentation","title":"CitableText.urnmatches","text":"urnmatches(urn1, urn2)\n\n\nOverride urnmatches function to be true if urn1 and urn1 are urnmatches by URN logic.\n\n\n\n\n\n","category":"function"},{"location":"#CitableText","page":"Home","title":"CitableText","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This Julia module defines the CtsUrn, a URN notation for canonically citing texts.","category":"page"},{"location":"","page":"Home","title":"Home","text":"A CtsUrn can be instantiated from a string value.  The generic show function displays this value to an IOStream.","category":"page"},{"location":"","page":"Home","title":"Home","text":"using CitableText\nurn = CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA:1.1\")\nshow(urn)\n\n# output\n\nurn:cts:greekLit:tlg0012.tlg001.msA:1.1","category":"page"},{"location":"","page":"Home","title":"Home","text":"There are many ways to malform the string value for a CtsUrn.  The CitableText module aspires to catch all of them.  (See the unit tests for numerous examples of the kinds of errors the CitableText module can identify.)","category":"page"},{"location":"","page":"Home","title":"Home","text":"try \n    CtsUrn(\"urn:cts:greekLit:tlg0012.tlg001.msA\")\ncatch e\n    e\nend\n\n# output\n\nArgumentError(\"Invalid URN `urn:cts:greekLit:tlg0012.tlg001.msA`.  CtsUrns must have 5 top-level components.\")","category":"page"}]
}
