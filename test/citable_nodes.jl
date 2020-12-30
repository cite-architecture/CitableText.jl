
@testset "Test canonically citable nodes" begin
@testset "Work with canonically citable nodes" begin
        urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")
        content = "μῆνιν ἄειδε, θεά, Πηληϊάδεω Ἀχιλῆος"
        cn = CitableNode(urn,content)
        @test cn.text == content
end
end
