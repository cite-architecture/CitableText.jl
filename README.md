# CitableText.jl

A Julia module for working with citable texts following the OHCO2 model of an ordered hierarchy of citable objects.

## Plans for version 1.0


### Working with CTS URNs.


- [x] adding/dropping the passage component of a CtsUrn
- [x] adding/dropping the version part of a CtsUrn's work hierarchy
- [x] adding/dropping the exemplar part of a CtsUrn's work hierarchy
- [x] finding the depth of the passage citation hierarchy
- [x] collapsing the passage citation hierarchy to a given depth or by a relative amount





## Working with a corpus of citable passages


URN comparison

- [x] containment
- [ ] equality (==)
- [ ] similarity

Retrieval:

- [ ] eaf node
- [ ]containing node
- [ ] range

Navigation:

- [x] find next node
- [x] find previous node


## Working with a catalog of texts

- [x] load from delimited text sources
- [ ] compare contents of catalog with contents of a corpus
