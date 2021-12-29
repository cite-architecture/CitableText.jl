@testset "Test URN comparable trait" begin
    ctsurn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
    @test urncomparable(ctsurn)
end
