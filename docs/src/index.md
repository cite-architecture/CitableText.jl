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
addpassage(u::CtsUrn, psg::AbstractString)
dropversion(u::CtsUrn)
addversion(u::CtsUrn, vers::String)
dropexemplar(u::CtsUrn)
addexemplar(u::CtsUrn, ex::String)
dropsubref(u::CtsUrn)
collapsePassageTo(u::CtsUrn, count::Int64)
collapsePassageBy(u::CtsUrn, count::Int64)
workcontains(urn1::CtsUrn, urn2::CtsUrn)
passagecontains(urn1::CtsUrn, urn2::CtsUrn)
urncontains(urn1::CtsUrn, urn2::CtsUrn)
fromdelimited(::Type{T}, cex::AbstractString, delimiter::AbstractString="#") where {T <: Union{CitableCorpus, CatalogedText}} 
fromfile(::Type{T}, filename::AbstractString, delimiter::AbstractString="#") where {T <: Union{CitableCorpus, CatalogedText}} 
fromurl(::Type{T}, url::AbstractString, delimiter::AbstractString="#") where {T <: Union{CitableCorpus, CatalogedText}} 
nextnode(n::CitableNode, c::CitableCorpus)
prevnode(n::CitableNode, c::CitableCorpus)
```
## Index
```@index
```
