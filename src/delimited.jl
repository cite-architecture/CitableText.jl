# Functions for working with delimited-text data from Strings, Files
# or URLs, to create different types of CitableText structures

"""
$(SIGNATURES)
Create an instance of type T from a delimited-text String.
"""
function fromdelimited(::Type{T}, src::AbstractString, delimiter::AbstractString="|")  where 
    {T <: Union{CitableCorpus, CatalogedText}} 
    lines = split(src,"\n")
    nonempty = filter(ln -> ln != "", lines)
    cols = map(l -> split(l, delimiter), nonempty)
    citablenodes = map(col -> CitableNode(CtsUrn(col[1]), col[2]), cols)
    CitableCorpus(citablenodes)
end
    

"""
$(SIGNATURES)
Create an instance of type T from a delimited-text file with header line.
"""
function fromfile(::Type{T}, filename::AbstractString, delimiter::AbstractString="|") where 
    {T <: Union{CitableCorpus, CatalogedText}} 
    raw = CSV.File(filename, skipto=2, delim=delimiter)  |> Array
    if T === CitableCorpus
        corpusdata = map(row -> (CitableNode(CtsUrn(row[1]), row[2])),  raw)
        CitableCorpus(corpusdata)
    elseif T === CatalogedText
        "Return an Array of CatalogedText objects"
    else
        throw(ArgumentError("Function not implemented for type $(T)") )
    end
end


"""
$(SIGNATURES)
Create a `CitableCorpus` from a URL to a delimited-text file with header line.
The file should be in two columns with a CTS URN and the text content of that passage.
"""
function fromurl(url::AbstractString, delimiter::AbstractString="#") #::CitableNode
    raw = CSV.File(HTTP.get(url).body, skipto=2, delim=delimiter)  |> Array
    corpusdata = map(row -> (CitableNode(CtsUrn(row[1]), row[2])),  raw)
    CitableCorpus(corpusdata)
end