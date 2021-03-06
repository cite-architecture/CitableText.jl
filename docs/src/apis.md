# API documentation

```@meta
CurrentModule = CitableText
```
```@contents
```
## Types
```@docs
CtsUrn
```

## Functions
```@docs
namespace(u::CtsUrn)
workcomponent(u::CtsUrn)
passagecomponent(u::CtsUrn)
passagedepth(u::CtsUrn)
passageparts(u::CtsUrn)
workdepth(u::CtsUrn)
workparts(u::CtsUrn)
isrange(u::CtsUrn)
rangebegin(u::CtsUrn)
rangeend(u::CtsUrn)
hassubref(u::CtsUrn)
subref(s::AbstractString)
droppassage(u::CtsUrn)
addpassage(u::CtsUrn, psg::AbstractString)
dropversion(u::CtsUrn)
addversion(u::CtsUrn, vers::AbstractString)
dropexemplar(u::CtsUrn)
addexemplar(u::CtsUrn, ex::AbstractString)
dropsubref(u::CtsUrn)
collapsePassageTo(u::CtsUrn, count::Int64)
collapsePassageBy(u::CtsUrn, count::Int64)
workcontains(urn1::CtsUrn, urn2::CtsUrn)
passagecontains(urn1::CtsUrn, urn2::CtsUrn)
urncontains(urn1::CtsUrn, urn2::CtsUrn)
==(urn1::CtsUrn, urn2::CtsUrn)
similar(urn1::CtsUrn, urn2::CtsUrn)
```
