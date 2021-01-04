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