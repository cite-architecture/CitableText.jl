module CitableText

using CitableBase
using Documenter, DocStringExtensions, BenchmarkTools

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
  workcontains, passagecontains, urncontains,
  ==, similar
    
#export CitableNode#, CitableCorpus
#export fromdelimited, fromfile, fromurl,
#  nextnode, prevnode,
#  combine, composite_array
  #retrieve
#export to_df, cex

#export CatalogedText
#export catalog, cataloged_to_df, citationdepth

include("constants.jl")
include("ctsUrn.jl")
include("urncomponents.jl")
include("componentparts.jl")
include("urnmanipulation.jl")
include("ranges.jl")
include("subrefs.jl")
include("validUrn.jl")
include("urncomparison.jl")




end # module