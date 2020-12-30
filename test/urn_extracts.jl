@testset "Extract pieces from a CtsUrn" begin
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
end
