
"Implementation of the CTS URN. See  [http://cite-architecture.org/ctsurn/](http://cite-architecture.org/ctsurn/)."
struct CtsUrn <: Urn
    urn::AbstractString
    function CtsUrn(s)
        try
            ok = validUrn(s)
        catch e
            throw(e)
        end
        new(s)
    end
end

"""A value of `CitableBase.CitableTrait` that can be used for content citable by `CtsUrn`.
"""
struct CitableByCtsUrn <: CitableTrait end


"""Dispatch `show` for `CtsUrn` type.

$(SIGNATURES)
"""
function show(io::IO, u::CtsUrn)
    print(io, u.urn)
end

"""`CtsUrn`s support version ids.
$(SIGNATURES)
"""
function supportsversion(u::CtsUrn)
    true
end

"""`CtsUrn`s support subreferences.
$(SIGNATURES)
"""
function supportssubref(u::CtsUrn)
    true
end