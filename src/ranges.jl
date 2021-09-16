
"""
$(SIGNATURES)
True if passage component string is a range..

# Examples
```julia-repl
julia>
isrange("1.1-1.10"))
```
"""
function isrange(psg::AbstractString)::Bool
    # Kludge to work around some kind of error when first
    # range element is empty
    if psg == ""
        false
    elseif psg[1] == "-"
        throw(ArgumentError("Invalid passage component `$(psg)`.  Range parts may not be empty."))
    end

    rangeparts = split(psg,"-")
    partcount = size(rangeparts,1)
    if (partcount > 2)
        throw(ArgumentError("Invalid passage component `$(psg)`.  Too many hyphen-delimited parts."))
    elseif partcount == 2
        if "" in rangeparts
            throw(ArgumentError("Invalid passage component `$(psg)`.  Range parts may not be empty."))
        else
            true
        end

    else
        # Not a range if 0 or 1 part
        false
    end

end


"""
$(SIGNATURES)
True if passage component is a range..

# Examples
```julia-repl
julia>
isrange(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function isrange(u::CtsUrn)::Bool
    isrange(passagecomponent(u))
end


"""
$(SIGNATURES)
Extract first range part from a passage component.

# Examples
```julia-repl
julia>
range_begin("1.1-1.10"))
```
"""
function range_begin(s::AbstractString)::AbstractString
    try
        if isrange(s)
            rangeparts = split(s,"-")
            rangeparts[1]
        else
            throw(ArgumentError("Passage expression $(s) is not a range."))
        end
    catch e
        throw(e)
    end
end



"""
$(SIGNATURES)
Extract first range part from a CtsUrn.

# Examples
```julia-repl
julia>
range_begin(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function range_begin(u::CtsUrn)::AbstractString
    range_begin(passagecomponent(u))
end



"""
$(SIGNATURES)
Extract second range part from a passage component.

# Examples
```julia-repl
julia>
range_end("1.1-1.10"))
```
"""
function range_end(u::CtsUrn)::AbstractString
    range_end(passagecomponent(u))
end

"""
$(SIGNATURES)
Extract second range part from a CtsUrn.

# Examples
```julia-repl
julia>
range_end(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function range_end(s::AbstractString)::AbstractString
    try
        if isrange(s)
            rangeparts = split(s,"-")
            rangeparts[2]
        else
            throw(ArgumentError("Passage expression $(s) is not a range."))
        end
    catch e
        throw(e)
    end
end
