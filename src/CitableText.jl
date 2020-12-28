module CitableText

using CitableBase

export CtsUrn


struct CtsUrn
    urn::String
    function CtsUrn(s)
        toplevel = components(s)
        if size(toplevel,1) != 5
            throw(ArgumentError("CtsUrns must have 5 top-level components"))
        elseif toplevel[1] != "urn"
            throw(ArgumentError("First component of a CtsUrn must be `urn`"))
        elseif toplevel[2] != "cts"
            throw(ArgumentError("Second component of a CtsUrn must be `cts`"))
        elseif toplevel[3] != ""
            throw(ArgumentError("CTS namespace cannot be empty"))
        elseif toplevel[4] != ""
            throw(ArgumentError("CTS work hierarchy cannot be empty"))


        else
            new(s)
        end
    end
end

end # module
