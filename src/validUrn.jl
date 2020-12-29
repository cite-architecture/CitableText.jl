"True if s fully compiles with CtsUrn syntax."
function validUrn(s::AbstractString)::Bool
    toplevel = components(s)

    if size(toplevel,1) != PASSAGE
        throw(ArgumentError("Invalid URN `$(s)`.  CtsUrns must have 5 top-level components."))
    elseif toplevel[URN] != "urn"
        throw(ArgumentError("Invalid string: `$(s)`. First component of a CtsUrn must be `urn`."))
    elseif toplevel[URNTYPE] != "cts"
        throw(ArgumentError("Invalid string: `$(s)`. Second component of a CtsUrn must be `cts`."))
    elseif toplevel[NAMESPACE] == ""
        throw(ArgumentError("Invalid string: `$(s)`. CTS namespace cannot be empty."))
    elseif toplevel[WORK] == ""
        throw(ArgumentError("Invalid string: `$(s)`. CTS work hierarchy cannot be empty."))
        # OK for passage hierarchy to be empty.
    else
        # Check for malformed passage syntax:
        if toplevel[PASSAGE] == ""
            true
        else
            psg = toplevel[PASSAGE]
            try
                # isrange throws errors if it finds invalid range syntax
                range = isrange(psg)
                #hassubref throws errors if it finds invalid subref syntax
                subref = hassubref(psg)
            catch e
                throw(e)
            end
            true
        end
    end
end
