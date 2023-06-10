@testset "CTS URN construction and validation" begin
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
        @test_throws ArgumentError CitableText.validUrn("urn:cts:ns:work:1-")
        @test_throws ArgumentError CitableText.validUrn("urn:cts:ns:work:1-2-3")
        @test_throws ArgumentError CitableText.validUrn("urn:cts:ns:work:-1")

      
        @test_throws ArgumentError isrange(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:-1"))
        @test_throws ArgumentError isrange(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1-"))
        @test_throws ArgumentError isrange(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1-2-3"))

 
        passagerange = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10")
        @test isrange(passagerange)

        passagenode = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
        @test isrange(passagenode) == false

        @test_throws ArgumentError CtsUrn("urn:cts:ns:group.work:1-")
        @test_throws ArgumentError CtsUrn("urn:cts:ns:group.work:-1")
        @test_throws ArgumentError CtsUrn("urn:cts:ns:group.work:1-2-3")
end

@testset "Validate subreference syntax" begin
     
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν"))
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")) == false
        @test_throws ArgumentError hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:@μῆνιν"))
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν-1.2"))
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν-1.2@οὐλομένην"))
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.2@οὐλομένην"))

        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν"))
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")) == false
        @test_throws ArgumentError hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:@μῆνιν"))

        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν-1.2"))
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1@μῆνιν-1.2@οὐλομένην"))
        @test hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.2@οὐλομένην"))

end
end
