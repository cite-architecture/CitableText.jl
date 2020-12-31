module CitableText

using CitableBase, Documenter, DocStringExtensions


export CtsUrn,
    namespace, workcomponent, passagecomponent,
    passagedepth, passageparts, droppassage, addpassage,
    workdepth, workparts, dropversion, addversion, dropexemplar, addexemplar,
    collapsePassageTo, collapsePassageBy,
    isrange, rangebegin, rangeend,
    hassubref, subref,
    workContains, passageContains,
    >,
    CitableNode,
    CitableCorpus


include("constants.jl")
include("ctsUrn.jl")
include("urncomponents.jl")
include("componentparts.jl")
include("urnmanipulation.jl")
include("ranges.jl")
include("subrefs.jl")
include("validUrn.jl")
include("urncomparison.jl")
include("citableNode.jl")
include("corpus.jl")

end # module
