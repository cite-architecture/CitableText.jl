using CitableText
using DataFrames
using Test

include("test_urn_validation.jl")
include("test_urn_extracts.jl")
include("test_urn_manipulation.jl")
include("test_urn_comparison.jl")
include("test_citable_nodes.jl")
include("test_corpus_navigation.jl")
include("test_corpus.jl")
include("test_catalog.jl")

# Only include this if you're online:
# include("test_online.jl")