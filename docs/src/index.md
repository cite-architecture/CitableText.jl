# CitableText.jl Documentation
```@meta
CurrentModule = CitableText
```
```@contents
```
## Types
```@docs
CtsUrn
CitableNode
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
subref(s::String)
droppassage(u::CtsUrn)
addpassage(u::CtsUrn)
dropversion(u::CtsUrn)
addversion(u::CtsUrn)
dropexemplar(u::CtsUrn)
addexemplar(u::CtsUrn)
collapsePassageTo(u::CtsUrn, count::Int64)
collapsePassageBy(u::CtsUrn, count::Int64)
```
## Index
```@index
```
