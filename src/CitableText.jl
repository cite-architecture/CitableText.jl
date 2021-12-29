module CitableText
#import Base: print
import Base: show

using Documenter, DocStringExtensions


using CitableBase 

import CitableBase: dropversion
import CitableBase: addversion

import CitableBase: urncomparisontrait
import CitableBase: urncontains
import CitableBase: urnsimilar
import CitableBase: urnequals

export CtsUrn
export CitableByCtsUrn
export CtsUrnComparable


export namespace, workcomponent, passagecomponent,
  passagedepth, passageparts, workdepth, workparts,
  isrange, 
  range_begin, range_end,
  hassubref, subref, dropsubref,
  
  droppassage, addpassage,
  addworkid, 
  dropversion, addversion, 
  dropexemplar, addexemplar,
  
  collapsePassageTo, collapsePassageBy,
  workcontains, passagecontains, 
  urncontains, urnsimilar, urnequals
  
#export print  
    
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