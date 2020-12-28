module CitableText

using CitableBase, Documenter, DocStringExtensions

export CtsUrn, CitableNode, workcomponent, passagecomponent, namespace, isrange

include("ctsUrn.jl")
include("citableNode.jl")


end # module
