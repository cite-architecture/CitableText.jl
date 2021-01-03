module CitableText

using CitableBase, CSV, DataFrames, HTTP
using Documenter, DocStringExtensions

export CtsUrn
export namespace, workcomponent, passagecomponent,
  passagedepth, passageparts, workdepth, workparts,
  isrange, 
  rangebegin, rangeend,
  hassubref, subref,
  droppassage, addpassage,
  dropversion, addversion, dropexemplar, addexemplar,
  dropsubref,
  collapsePassageTo, collapsePassageBy,
  workcontains, passagecontains, urncontains
    
export CitableNode, CitableCorpus
export fromdelimited, fromfile, fromurl,
  nextnode, prevnode #,
  #retrieve


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
include("corpusloading.jl")

end # module
