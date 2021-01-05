"A catalog description of a text."
struct CatalogedText
    urn::CtsUrn
    citation
    group
    work
    version
    exemplar
    online::Bool
    lang
end


"""
$(SIGNATURES)
Create a DataFrame with text catalog information from an Array of `CatalogedText`s.
"""
function to_df(arr)
    urns = map(row -> row.urn, arr)
    citations = map(row -> row.citation, arr)
    groups = map(row -> row.group, arr)
    works = map(row -> row.work, arr)
    versions = map(row -> row.version, arr)
    exemplars = map(row -> row.exemplar, arr)
    onlines = map(row -> row.online, arr)
    langs = map(row -> row.lang, arr)
    DataFrame(
        urn = urns,
        citation = citations,

        group = groups,
        work = works,        
        version = versions,
        exemplar = exemplars,

        online = onlines,
        lang = langs
    )
end

"""
$(SIGNATURES)
Decompose members of CatalogedText into an Array.
"""
function unmarshall(entry)
    [entry.urn, entry.citation, 
    entry.group, entry.work, entry.version, entry.exemplar,
    entry.online, entry.lang]
end


function catalog(csvrow::CSV.Row)
    if length(csvrow) < 8
        throw(ArgumentError("Invalid argument $(csvrow); array should have 6 components."))
    elseif ismissing(csvrow[2])
        throw(ArgumentError("Invalid argument $(csvrow); citation scheme must be included."))
    elseif ismissing(csvrow[3])
        throw(ArgumentError("Invalid argument $(csvrow); name of text group must be included."))
    elseif ismissing(csvrow[4])
        throw(ArgumentError("Invalid argument $(csvrow); work title must be included."))
        
    else
        try
            urn = CtsUrn(csvrow[1])
            citescheme = csvrow[2]
            textgroup = csvrow[3]
            title = csvrow[4]
            vers = ismissing(csvrow[5]) ? nothing : csvrow[5]
            ex = ismissing(csvrow[6]) ? nothing : csvrow[6]
            online = csvrow[7]
            lang = csvrow[8]
            CatalogedText(urn, citescheme, textgroup, title, vers, ex, online, lang)

        catch e
            throw(e)
        end
    end
end

"""
$(SIGNATURES)
Create a `CatalogedText` from an array of String values.
"""
function catalog(arr)
    if length(arr) < 8
        throw(ArgumentError("Invalid argument $(arr); array should have 6 components."))
    elseif arr[2] == ""
        throw(ArgumentError("Invalid argument $(arr); citation scheme must be included."))
    elseif arr[3] == ""
        throw(ArgumentError("Invalid argument $(arr); name of text group must be included."))
    elseif arr[4] == ""
        throw(ArgumentError("Invalid argument $(arr); work title must be included."))
        
    else
        try
            urn = CtsUrn(arr[1])
            citescheme = arr[2]
            textgroup = arr[3]
            title = arr[4]
            vers = arr[5] == "" ? nothing : arr[5]
            ex = arr[6] == "" ? nothing : arr[6]
            online = lowercase(arr[7]) in ["t", "true", "yes", "y"]
            lang = arr[8]
            CatalogedText(urn, citescheme, textgroup, title, vers, ex, online, lang)

        catch e
            throw(e)
        end
    end
end