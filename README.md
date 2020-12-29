# CitableText.jl

A Julia library for working with citable texts following the OHCO2 model of an ordered hierarchy of citable objects.

## Plans for version 1.0

The 1.0 release will focus on a robust library for working with CTS URNs.



Some functions defined in the Scala library ([API docs](https://cite-architecture.github.io/cite-api-docs/xcite/api/edu/holycross/shot/cite/CtsUrn.html)) that could be implemented here:

- [ ] adding/dropping a passage component
- [ ] adding/dropping a version
- [ ] adding/dropping an exemplar
- [ ] finding the depth of the citation hierarchy
- [ ] collapsing passage to a given depth or by a relative amount

URN comparison:

- [ ] <, >, equality, <=, >=
- [ ] URN similarity (twiddling/negate twiddling )
