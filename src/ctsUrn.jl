
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

"""Dispatch `show` for `CtsUrn` type.

$(SIGNATURES)
"""
function show(u::CtsUrn)
    u.urn
end
