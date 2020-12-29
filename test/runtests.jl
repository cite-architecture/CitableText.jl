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


@testset "Validate range syntax" begin
        @test_throws ArgumentError("Invalid passage component `1-`.  Range parts may not be empty.") CitableText.validUrn("urn:cts:ns:work:1-")

        @test_throws ArgumentError("Invalid passage component `1-2-3`.  Too many hyphen-delimited parts.") CitableText.validUrn("urn:cts:ns:work:1-2-3")

        @test_throws ArgumentError("Invalid passage component `-1`.  Range parts may not be empty.") CitableText.validUrn("urn:cts:ns:work:-1")

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

@testset "Validate subreference syntax" begin
        # String method
        @test hassubref("1.1@μῆνιν")
        @test hassubref("1.1") == false
        @test_throws ArgumentError("Invalid passage component `@μῆνιν`.  Subreference may not be empty.") hassubref("@μῆνιν")
        @test hassubref("1.1@μῆνιν-1.2")
        @test hassubref("1.1@μῆνιν-1.2@οὐλομένην")
        @test hassubref("1.1-1.2@οὐλομένην")

        # URN method
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν"))
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")) == false
        @test_throws ArgumentError("Invalid passage component `@μῆνιν`.  Subreference may not be empty.") hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:@μῆνιν"))

        @test hassubref("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν-1.2")
        @test hassubref("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν-1.2@οὐλομένην")
        @test hassubref("urn:cts:greekLit:tlg0012.tlg001:1.1-1.2@οὐλομένην")

end

@testset "Extract top-level components of a CtsUrn" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")

        @test namespace(urn) == "greekLit"

        @test workcomponent(urn) == "tlg0012.tlg001.msA"

        @test passagecomponent(urn) == "1.1"
end

@testset "Extract range components" begin
        @test rangebegin(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10")) == "1.1"
        @test rangebegin(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1@μῆνιν-1.10")) == "1.1@μῆνιν"
        @test rangeend(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10")) == "1.10"
        @test rangeend(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10@οὐλομένην")) == "1.10@οὐλομένην"
end

@testset "Extract passage subreferences" begin
        @test CitableText.subref("1.1@μῆνιν") == "μῆνιν"

        @test CitableText.subref("1.1") == ""

        @test_throws ArgumentError("Invalid subreference syntax `1.1@μῆνιν @ἄειδε`.  Too many `@` characters.") CitableText.subref("1.1@μῆνιν @ἄειδε") == "μῆνιν"
end

@testset "Count parts in top-tier hierarchies" begin
        @test passagedepth(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1")) == 1
        @test passagedepth(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")) == 2
        @test passagedepth(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:")) == 0

        @test workdepth(CtsUrn("urn:cts:greekLit:tlg0012:")) == CitableText.GROUP
        @test workdepth(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:")) == CitableText.TEXT
        @test workdepth(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:")) == CitableText.TEXTVERSION
        @test workdepth(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:")) == CitableText.EXEMPLAR
end

@testset "Test URN manipulation" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test droppassage(urn) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:")
        @test addpassage(urn, "2.1") == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:2.1")

        @test dropversion(urn) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")
        @test dropversion(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:")) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001:")
        @test dropversion(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:")) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001:")
        @test dropversion(CtsUrn("urn:cts:greekLit:tlg0012:")) == CtsUrn("urn:cts:greekLit:tlg0012:")

        @test addversion(urn, "msB").urn == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msB:1.1").urn
        @test addversion( CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1"), "msB").urn == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msB:1.1").urn
        @test addversion( CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:1.1"), "msB").urn == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msB:1.1").urn


        @test dropexemplar(urn) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test dropexemplar(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:1.1")) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")

        @test addexemplar(urn, "tokens") == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:1.1")
        @test_throws ArgumentError("Cannot add exemplar to URN without version: `urn:cts:greekLit:tlg0012.tlg001:1.1`.") addexemplar(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1"), "tokens")


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
