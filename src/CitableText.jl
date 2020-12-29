module CitableText

using CitableBase, Documenter, DocStringExtensions

export CtsUrn,
    namespace, workcomponent, passagecomponent,
    passagedepth,
    isrange, rangebegin, rangeend,
    hassubref, subref,
    CitableNode


include("ctsUrn.jl")
include("urncomponents.jl")
include("passages.jl")
include("ranges.jl")
include("subrefs.jl")
include("validUrn.jl")
include("citableNode.jl")


end # module
