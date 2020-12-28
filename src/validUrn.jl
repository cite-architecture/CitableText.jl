"True if s fully compiles with CtsUrn syntax."
function validUrn(s::String)::Bool
    toplevel = components(s)

    if size(toplevel,1) != 5
        throw(ArgumentError("Invalid URN `$(s)`.  CtsUrns must have 5 top-level components."))
    elseif toplevel[1] != "urn"
        throw(ArgumentError("Invalid string: `$(s)`. First component of a CtsUrn must be `urn`."))
    elseif toplevel[2] != "cts"
        throw(ArgumentError("Invalid string: `$(s)`. Second component of a CtsUrn must be `cts`."))
    elseif toplevel[3] == ""
        throw(ArgumentError("Invalid string: `$(s)`. CTS namespace cannot be empty."))
    elseif toplevel[4] == ""
        throw(ArgumentError("Invalid string: `$(s)`. CTS work hierarchy cannot be empty."))
        # OK for passage hierarchy to be empty.
    else
        # Check for malformed passage syntax:
        if toplevel[5] == ""
            true
        else
            psg = toplevel[5]
            try
                # isrange throws errors if it finds invalid range syntax
                range = isrange(psg)
            catch e
                throw(e)
            end
            true
        end
    end
end
