
"Implementation of the CTS URN. See  [http://cite-architecture.org/ctsurn/](http://cite-architecture.org/ctsurn/)."
struct CtsUrn <: Urn
    urn::String
    function CtsUrn(s)
        try
            ok = validUrn(s)
        catch e
            throw(e)
        end
        new(s)
    end
end
