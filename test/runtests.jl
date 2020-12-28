using CitableText
using Test

#@testset "Test CtsUrns" begin
@testset "Test number of URN string's top-level components" begin
        @test_throws ArgumentError("Invalid URN ``.  CtsUrns must have 5 top-level components.") CtsUrn("")

        @test_throws ArgumentError("Invalid URN `too:darn:short`.  CtsUrns must have 5 top-level components.") CtsUrn("too:darn:short")
end

@testset "Test URN string's top-level components" begin
        @test_throws ArgumentError("Invalid URN ``.  CtsUrns must have 5 top-level components.") CitableText.validUrn("")

        @test_throws ArgumentError("Invalid URN `too:darn:short`.  CtsUrns must have 5 top-level components.") CitableText.validUrn("too:darn:short")

        @test_throws ArgumentError("Invalid string: `urnX:cts:namespace:group:`. First component of a CtsUrn must be `urn`.") CitableText.validUrn("urnX:cts:namespace:group:")

        @test_throws ArgumentError("Invalid string: `urn:ctsX:namespace:group:`. Second component of a CtsUrn must be `cts`.") CitableText.validUrn("urn:ctsX:namespace:group:")

        @test_throws ArgumentError("Invalid string: `urn:cts::group:`. CTS namespace cannot be empty.") CitableText.validUrn("urn:cts::group:")

        @test_throws ArgumentError("Invalid string: `urn:cts:namespace::`. CTS work hierarchy cannot be empty.") CitableText.validUrn("urn:cts:namespace::")


        @test_throws ArgumentError("Invalid string: `urnX:cts:namespace:group:`. First component of a CtsUrn must be `urn`.") CitableText.validUrn("urnX:cts:namespace:group:")

        @test_throws ArgumentError("Invalid string: `urn:ctsX:namespace:group:`. Second component of a CtsUrn must be `cts`.") CitableText.validUrn("urn:ctsX:namespace:group:")

        @test_throws ArgumentError("Invalid string: `urn:cts::group:`. CTS namespace cannot be empty.") CitableText.validUrn("urn:cts::group:")

        @test_throws ArgumentError("Invalid string: `urn:cts:namespace::`. CTS work hierarchy cannot be empty.") CitableText.validUrn("urn:cts:namespace::")

end


@testset "Validate range structure" begin
        @test_throws ArgumentError("Invalid passage component `1-`.  Range parts may not be empty.") CitableText.validUrn("urn:cts:ns:work:1-")

        @test_throws ArgumentError("Invalid passage component `1-2-3`.  Too many hyphen-delimited parts.") CitableText.validUrn("urn:cts:ns:work:1-2-3")

        @test_throws ArgumentError("Invalid passage component `-1`.  Range parts may not be empty.") CitableText.validUrn("urn:cts:ns:work:-1")
end

@testset "Extract top-level components of a CtsUrn" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")

        @test namespace(urn) == "greekLit"

        @test workcomponent(urn) == "tlg0012.tlg001.msA"

        @test passagecomponent(urn) == "1.1"
end

@testset "Extract range components" begin
        #@test rangebegin("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10") == "1.1"
end

@testset "Extract passage subreferences" begin
        @test CitableText.subref("1.1@μῆνιν") == "μῆνιν"

        @test CitableText.subref("1.1") == ""

        @test_throws ArgumentError("Invalid subreference syntax `1.1@μῆνιν @ἄειδε`.  Too many `@` characters.") CitableText.subref("1.1@μῆνιν @ἄειδε") == "μῆνιν"
end

@testset "Validate passage range syntax" begin
        # isrange has methods for Strings and for CtsUrns.
        # String method:
        @test_throws ArgumentError("Invalid passage component `-1`.  Range parts may not be empty.") isrange("-1")
        @test_throws ArgumentError("Invalid passage component `1-`.  Range parts may not be empty.") isrange("1-")
        @test_throws ArgumentError("Invalid passage component `1-2-3`.  Too many hyphen-delimited parts.") isrange("1-2-3")

        # CtsUrn method:
        passagerange = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10")
        @test isrange(passagerange)

        passagenode = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test isrange(passagenode) == false

        @test_throws ArgumentError("Invalid passage component `1-`.  Range parts may not be empty.") CtsUrn("urn:cts:ns:group.work:1-")
        @test_throws ArgumentError("Invalid passage component `-1`.  Range parts may not be empty.") CtsUrn("urn:cts:ns:group.work:-1")
        @test_throws ArgumentError("Invalid passage component `1-2-3`.  Too many hyphen-delimited parts.") CtsUrn("urn:cts:ns:group.work:1-2-3")
end



#end # End of testset for CtsUrns



@testset "Test canonically citable nodes" begin
@testset "Work with canonically citable nodes" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")
        content = "μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος"
        cn = CitableNode(urn,content)
        @test cn.text == content
end
end


@testset "Test OHCO2 corpus" begin
end
