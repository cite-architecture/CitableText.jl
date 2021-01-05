
@testset "Load a corpus from a url" begin
    url = "https://raw.githubusercontent.com/LinguaLatina/texts/master/texts/latin23/hyginus.cex"
    c = fromurl(CitableCorpus, url, "#")
    @test isa(c, CitableCorpus)
end

@test "Load an array of CatalogedTexts from a file" begin
    # TBA
end