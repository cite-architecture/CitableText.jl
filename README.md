![build](https://github.com/cite-architecture/CitableText.jl/actions/workflows/Documentation.yml/badge.svg)


# CitableText.jl

A Julia module for working with citable texts following the OHCO2 model of an ordered hierarchy of citable objects.

##  Working with CTS URNs

CitableText.jl supports:


- [x] adding/dropping the passage component of a CtsUrn
- [x] adding/dropping the version part of a CtsUrn's work hierarchy
- [x] adding/dropping the exemplar part of a CtsUrn's work hierarchy
- [x] finding the depth of the passage citation hierarchy
- [x] collapsing the passage citation hierarchy to a given depth or by a relative amount


## Version 1.0

Version 1.0 release should implement the `addversion` and `dropversion` functions of `CitableBase`.

