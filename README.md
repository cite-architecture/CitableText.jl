# CitableText.jl

A Julia library for working with citable texts following the OHCO2 model of an ordered hierarchy of citable objects.

## Plans for version 1.0

The 1.0 release will focus on a robust library for working with CTS URNs.



Some functions defined in the Scala library ([API docs](https://cite-architecture.github.io/cite-api-docs/xcite/api/edu/holycross/shot/cite/CtsUrn.html)) that could be implemented here:

- [x] adding/dropping the passage component of a CtsUrn
- [x] adding/dropping the version part of a CtsUrn's work hierarchy
- [x] adding/dropping the exemplar part of a CtsUrn's work hierarchy
- [x] finding the depth of the passage citation hierarchy
- [x] collapsing the passage citation hierarchy to a given depth or by a relative amount

URN comparison:

- [ ] <, >, equality, <=, >=
- [ ] URN similarity (twiddling/negate twiddling )

## Plans for version 2.0

Version 2.0 will focus on working with a Corpus modelled on the the OHCO2 model of an ordered hierarchy of citable objects.
