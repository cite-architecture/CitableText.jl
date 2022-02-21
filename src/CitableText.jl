module CitableText
using Documenter, DocStringExtensions

import Base: show

using CitableBase 

import CitableBase: supportsversion
import CitableBase: dropversion
import CitableBase: addversion
import CitableBase: versionid

import CitableBase: supportssubref
import CitableBase: dropsubref
import CitableBase: hassubref
import CitableBase: subref


import CitableBase: urncomparisontrait
import CitableBase: urncontains
import CitableBase: urnsimilar
import CitableBase: urnequals

export CtsUrn
export CitableByCtsUrn
export CtsUrnComparable

export namespace, 
  workcomponent, workcontains, 
  workdepth, workparts, groupid, workid, versionid, exemplarid,
  addworkid,
  dropexemplar, addexemplar,

  passagecomponent, passagecontains,
  passagedepth, passageparts, 
  isrange, 
  range_begin, range_end,
  droppassage, addpassage,
  
  collapsePassageTo, collapsePassageBy
  
    
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