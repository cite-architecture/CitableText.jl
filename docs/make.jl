using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")


using Documenter, DocStringExtensions, CitableText

makedocs(sitename = "CitableText Documentation")
