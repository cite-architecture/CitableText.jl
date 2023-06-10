using Pkg
Pkg.activate("..")

using CitableText
using CitableBase

#import CitableBase: CitableTrait
#import CitableBase: urn

using Test
using TestSetExtensions



@testset "All the tests" begin
    println(map(s -> replace(s, r".jl$" => ""), ARGS))
    @includetests map(s -> replace(s, r".jl$" => ""), ARGS)
end