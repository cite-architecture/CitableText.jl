

@testset "Construct catalog from text array" begin
    cex = split("urn:cts:latinLit:stoa1263.stoa001.hc:|chapter,section|Hyginus|Fabulae|Holy Cross edition||true|lat", "|")
    cataloged = catalog(cex)
    @test isa(cataloged, CatalogedText)
    @test cataloged.online
end

@testset "Unmarshall CatalogedText" begin
    cex = split("urn:cts:latinLit:stoa1263.stoa001.hc:|chapter,section|Hyginus|Fabulae|Holy Cross edition||true|lat", "|")
    cataloged = catalog(cex)
    unmarshalled = CitableText.unmarshall(cataloged)
    # Need equality test on CtsUrns from 
    
    @test all(unmarshalled .==
    [CtsUrn("urn:cts:latinLit:stoa1263.stoa001.hc:"), 
    "chapter,section", 
    "Hyginus", "Fabulae", "Holy Cross edition", nothing, 
    true, "lat"])
    
end

@testset "Convert array of CatalogedTexts to DataFrame" begin
    cex = split("urn:cts:latinLit:stoa1263.stoa001.hc:|chapter,section|Hyginus|Fabulae|Holy Cross edition||true|lat", "|")
    cataloged = [catalog(cex)]
    df = to_df(cataloged)
    @test isa(df, DataFrame)

end


@testset "Load catalog from local file" begin
    catfile = "data/catalog.cex"
    catalog_df = fromfile(CatalogedText, catfile)
    @test isa(catalog_df, DataFrame)
end