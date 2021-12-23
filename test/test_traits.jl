@testset "Test URN comparable trait" begin
    ctsurn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
    @test urncomparable(ctsurn)
end

@test "Test citable trait" begin
    #=
    struct TinyText <: Citable
        urn::ctsurn
        txt::AbstractString
    end
    CitableTrait(::Type{TinyText}) = CitableByCtsUrn()


    ctsurn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:")
    txt = "The Iliad"
    tiny = TinyText(ctsurn, txt)
    @test citable(tiny)
   =# 
end