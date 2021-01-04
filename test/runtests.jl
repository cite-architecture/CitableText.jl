using CitableText
using Test

include("test_urn_validation.jl")
include("test_urn_extracts.jl")
include("test_urn_manipulation.jl")
include("test_urn_comparison.jl")
include("test_citable_nodes.jl")
include("test_corpus_navigation.jl")
# This one is slow:
include("test_corpus.jl")
include("test_catalog.jl")