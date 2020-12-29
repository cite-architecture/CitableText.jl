module CitableText

using CitableBase, Documenter, DocStringExtensions

export CtsUrn,
    namespace, workcomponent, passagecomponent,
    passagedepth, droppassage, addpassage,
    isrange, rangebegin, rangeend,
    hassubref, subref,
    CitableNode


include("constants.jl")
include("ctsUrn.jl")
include("urncomponents.jl")
include("urnmanipulation.jl")
include("passages.jl")
include("ranges.jl")
include("subrefs.jl")
include("validUrn.jl")
include("citableNode.jl")

end # module
