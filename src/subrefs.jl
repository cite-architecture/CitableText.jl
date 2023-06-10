
"""
$(SIGNATURES)
True if String has a subreference.

# Examples
```julia-repl
julia>
hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10@μῆνιν"))
```
"""
function hassubref(psg::AbstractString)::Bool
    if isrange(psg)
        hassubref(range_begin(psg)) || hassubref(range_end(psg))
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


"""
$(SIGNATURES)
True if CtsUrn has a subreference.

# Examples
```julia-repl
julia>
hassubref(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10@μῆνιν"))
```
"""
function hassubref(u::CtsUrn)::Bool
    hassubref(passagecomponent(u))
end


"""
$(SIGNATURES)
Extract subreference part of a passage string.

# Examples
```julia-repl
julia>
subref(1.1-1.10@μῆνιν")
```
"""
function subref(s::AbstractString)
    segments = split(s,"@")
    count = size(segments,1)
    if count == 2
        sub = segments[2]
        sub
    elseif count > 2
        throw(ArgumentError("Invalid subreference syntax `$(s)`.  Too many `@` characters."))
    else
        ""
    end
end

"""Create a new CtsUrn dropping any extended reference in `u`.

$(SIGNATURES)
"""
function subref(u::CtsUrn)
    subref(u.urn)
end

"""
$(SIGNATURES)
Remove any subreference substrings in a string.
If `s` is a range expression, separately drop subreference
from each of range-begin and range-end parts.
"""
function dropsubref(s::AbstractString)
    if isrange(s)
        r1parts = split(range_begin(s),"@")
        r2parts = split(range_end(s),"@")
        r1parts[1] * "-" * r2parts[1]
    else 
        parts = split(s, "@")
        parts[1]
    end
end


"""
$(SIGNATURES)
Remove any subreferences from a CtsUrn.
"""
function dropsubref(u::CtsUrn)
    psg = dropsubref(passagecomponent(u))
    addpassage(u, psg)
end