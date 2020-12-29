module CitableText

using CitableBase, Documenter, DocStringExtensions

export CtsUrn,
    namespace, workcomponent, passagecomponent,
    passagedepth, passageparts, droppassage, addpassage,
    workdepth, workparts, dropversion, addversion, dropexemplar, addexemplar,
    isrange, rangebegin, rangeend,
    hassubref, subref,
    CitableNode


include("constants.jl")
include("ctsUrn.jl")
include("urncomponents.jl")
include("componentparts.jl")
include("urnmanipulation.jl")
include("ranges.jl")
include("subrefs.jl")
include("validUrn.jl")
include("citableNode.jl")

end # module
