using CitableText
using Test


@testset "Syntax of URN must be good" begin
        @test_throws ArgumentError CtsUrn("")
        @test_throws ArgumentError CtsUrn("too:darn:short")
        @test_throws ArgumentError CtsUrn("urnX:cts:namespace:group:")
        @test_throws ArgumentError CtsUrn("urn:cts::group:")
        @test_throws ArgumentError CtsUrn("urn:cts:namespace::")
end
