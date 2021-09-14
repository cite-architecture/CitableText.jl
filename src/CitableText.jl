module CitableText
import Base: show


using Documenter, DocStringExtensions
# using BenchmarkTools

using CitableBase 
import CitableBase: dropversion
import CitableBase: addversion

export CtsUrn

export namespace, workcomponent, passagecomponent,
  passagedepth, passageparts, workdepth, workparts,
  isrange, 
  rangebegin, rangeend,
  hassubref, subref,
  droppassage, addpassage,
  addworkid, dropversion, addversion, dropexemplar, addexemplar,
  dropsubref,
  collapsePassageTo, collapsePassageBy,
  workcontains, passagecontains, urncontains,
  urnmatches
export show  
    
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