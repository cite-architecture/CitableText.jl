using CitableText
using Test


@testset "Test number of top-level components" begin
        @test_throws ArgumentError("Invalid URN ``.  CtsUrns must have 5 top-level components.") CtsUrn("")
        @test_throws ArgumentError("Invalid URN `too:darn:short`.  CtsUrns must have 5 top-level components.") CtsUrn("too:darn:short")

end

@testset "Test required components" begin
        @test_throws ArgumentError("Invalid string: `urnX:cts:namespace:group:`. First component of a CtsUrn must be `urn`.") CtsUrn("urnX:cts:namespace:group:")
        @test_throws ArgumentError("Invalid string: `urn:ctsX:namespace:group:`. Second component of a CtsUrn must be `cts`.") CtsUrn("urn:ctsX:namespace:group:")

        @test_throws ArgumentError("Invalid string: `urn:cts::group:`. CTS namespace cannot be empty.") CtsUrn("urn:cts::group:")
        @test_throws ArgumentError("Invalid string: `urn:cts:namespace::`. CTS work hierarchy cannot be empty.") CtsUrn("urn:cts:namespace::")
end

@testset "Extract top-level components of a CtsUrn" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test namespace(urn)== "greekLit"
        @test workcomponent(urn) == "tlg0012.tlg001.msA"
        @test passagecomponent(urn)== "1.1"
end

@testset "Work with passage ranges" begin
        passagenode = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        passagerange = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10")
        @test isrange(passagerange)
        @test isrange(passagenode) == false

end
