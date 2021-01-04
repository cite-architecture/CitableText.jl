

@testset "Construct catalog from text array" begin
    cex = split("urn:cts:latinLit:stoa1263.stoa001.hc:|chapter,section|Hyginus|Fabulae|Holy Cross edition||true|lat", "|")
    cataloged = catalog(cex)
    @test isa(cataloged, CatalogedText)
end

@testset "Load catalog from local file" begin
    
end