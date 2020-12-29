

function hassubref(psg::AbstractString)::Bool
    if isrange(psg)
        hassubref(rangebegin(psg)) || hassubref(rangeend(psg))
        #throw(ArgumentError("Function `hassubref` applies only to single-node URNs or passage-component Strings not to ranges like `$(psg)`."))
    else
        # Kludge to work around some kind of error when first
        # range element is empty
        if psg == ""
            false
        elseif psg[1] == "@"
            throw(ArgumentError("Invalid passage component `$(psg)`.  Subreference without canonical node reference."))
        end

        refparts = split(psg,"@")
        partcount = size(refparts,1)
        if (partcount > 2)
            throw(ArgumentError("Invalid passage component `$(psg)`.  Too many @-delimited parts."))
        elseif partcount == 2
            if "" in refparts
                throw(ArgumentError("Invalid passage component `$(psg)`.  Subreference may not be empty."))
            else
                true
            end

        else
            # No subref if 0 or 1 part
            false
        end
    end
end

function hassubref(u::CtsUrn)::Bool
    hassubref(passagecomponent(u))
end


function subref(s::String)::String
    segments = split(s,"@")
    count = size(segments,1)
    if count == 2
        sub::String = segments[2]
        sub
    elseif count > 2
        throw(ArgumentError("Invalid subreference syntax `$(s)`.  Too many `@` characters."))
    else
        ""
    end
end