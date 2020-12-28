using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")


using Documenter, CitableText

makedocs(sitename = "CitableText Documentation")
