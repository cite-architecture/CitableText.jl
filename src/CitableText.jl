module CitableText

using CitableBase, Documenter, DocStringExtensions

export CtsUrn,
    namespace, workcomponent, passagecomponent,
    isrange, rangebegin, rangeend,
    hassubref, subref,
    CitableNode


include("ctsUrn.jl")
include("urncomponents.jl")
include("ranges.jl")
include("subrefs.jl")
include("validUrn.jl")
include("citableNode.jl")


end # module
