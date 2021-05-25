# Use this from root directory of repository, e.g.,
# julia --project=docs/ docs/make.jl

using Pkg
Pkg.activate(".")
Pkg.instantiate()


using Documenter, DocStringExtensions, CitableText

makedocs(
    sitename = "CitableText Documentation",
    pages = [
        "Home" => "index.md",
        "Guide" => "guide.md",
        "API documentation" => "apis.md"
    ]
    )
