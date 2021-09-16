
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

"""Dispatch `print` for `CtsUrn` type.

$(SIGNATURES)
"""
function print(io::IO, u::CtsUrn)
    print(io, u.urn)
end


"""Dispatch `show` for `CtsUrn` type.

$(SIGNATURES)
"""
function show(io::IO, u::CtsUrn)
    print(io, u.urn)
end