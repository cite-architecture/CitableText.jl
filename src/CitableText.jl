module CitableText

using CitableBase, Documenter, DocStringExtensions


export CtsUrn,
    namespace, workcomponent, passagecomponent,
    passagedepth, passageparts, workdepth, workparts,
    isrange, 
    rangebegin, rangeend,
    hassubref, subref,
    droppassage, addpassage,
    dropversion, addversion, dropexemplar, addexemplar,
    collapsePassageTo, collapsePassageBy,
    workContains, passageContains, urncontains,
    CitableNode,
    CitableCorpus,
    nextnode, prevnode,
    retrieve


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
include("retrieval.jl")
include("navigation.jl")

end # module
