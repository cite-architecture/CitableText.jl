
@testset "Pair-wise comparison of CtsUrns" begin
        urn1 = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        urn2 = CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")
        urn3 =  CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1")

        @test workContains(urn1,urn2) == false
        @test workContains(urn2,urn1)
        @test workContains(urn1,urn1)

        @test passageContains(urn3, urn1)
        @test passageContains(urn1, urn3) == false
        @test passageContains(urn1, urn1)

        @test urncontains(urn2, urn1)
        @test urncontains(urn1, urn2) == false
        @test urncontains(urn3, urn2)

end
