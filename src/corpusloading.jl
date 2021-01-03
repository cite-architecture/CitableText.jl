

"""
$(SIGNATURES)
Create a `CitableCorpus` from a delimited-text String.
The file should be in two columns with a CTS URN and the text content of that passage.
"""
function fromdelimited(src::AbstractString, delimiter::AbstractString="#")#::CitableCorpus
    
    lines = split(src,"\n")
    nonempty = filter(ln -> ln != "", lines)
    cols = map(l -> split(l, delimiter), nonempty)
    citablenodes = map(col -> CitableNode(CtsUrn(col[1]), col[2]), cols)
    CitableCorpus(citablenodes)
end
    

"""
$(SIGNATURES)
Create a `CitableCorpus` from a delimited-text file with header line.
The file should be in two columns with a CTS URN and the text content of that passage.
"""
function fromfile(filename::AbstractString, delimiter::AbstractString="#")::CitableCorpus
    hyg = "data/hyginus.csv"
    raw = CSV.File(hyg, skipto=2, delim=delimiter)  |> Array
    corpusdata = map(row -> (CitableNode(CtsUrn(row[1]), row[2])),  raw)
    CitableCorpus(corpusdata)
end

