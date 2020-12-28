module CitableText

using CitableBase, Documenter, DocStringExtensions

export CtsUrn, CitableNode, workcomponent, passagecomponent, namespace, isrange

include("validUrn.jl")
include("ctsUrn.jl")
include("citableNode.jl")


end # module
