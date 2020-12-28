
function validUrn(s::String)::Bool
    range = isrange(s)
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
        true
    end
end
