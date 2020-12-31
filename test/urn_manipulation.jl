@testset "Modify CtsUrns" begin

@testset "Test add/dropping passage component" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test droppassage(urn) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:")
        @test addpassage(urn, "2.1") == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:2.1")

end
@testset "Test add/dropping work parts" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        # add/drop version
        @test dropversion(urn) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")
        @test dropversion(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:")) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001:")
        @test dropversion(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:")) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001:")
        @test dropversion(CtsUrn("urn:cts:greekLit:tlg0012:")) == CtsUrn("urn:cts:greekLit:tlg0012:")

        @test addversion(urn, "msB").urn == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msB:1.1").urn
        @test addversion( CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1"), "msB").urn == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msB:1.1").urn
        @test addversion( CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:1.1"), "msB").urn == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msB:1.1").urn

        # add/drop exemplar
        @test dropexemplar(urn) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test dropexemplar(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:1.1")) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")

        @test addexemplar(urn, "tokens") == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA.tokens:1.1")
        @test_throws ArgumentError("Cannot add exemplar to URN without version: `urn:cts:greekLit:tlg0012.tlg001:1.1`.") addexemplar(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1"), "tokens")
end

@testset "Test collapsing passage hierarchy" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test_throws ArgumentError("Invalid request: requested depth 3 too deep for URN `urn:cts:greekLit:tlg0012.tlg001.msA:1.1`.") collapsePassageTo(urn,3)
        @test collapsePassageTo(urn,1) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1")
        @test collapsePassageBy(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1"), 0) == CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test collapsePassageBy(CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc:8pr.title"), 1) ==  CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc:8pr")
end
end
