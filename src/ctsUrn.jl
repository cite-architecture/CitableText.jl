
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

UrnComparisonTrait(CtsUrn)  = UrnComparable()

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