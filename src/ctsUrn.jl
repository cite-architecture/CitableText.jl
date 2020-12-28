
"Implementation of the CTS URN. See  [http://cite-architecture.org/ctsurn/](http://cite-architecture.org/ctsurn/)."
struct CtsUrn
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

"""
$(SIGNATURES)
Extract work component from a CtsUrn.

# Examples
```julia-repl
julia>
workcomponent(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1"))
```
"""
function workcomponent(u::CtsUrn)::String
    allcomponents = components(u.urn)
    work::String = allcomponents[4]
    work
end



"""
$(SIGNATURES)
Extract passage component from a CtsUrn.

# Examples
```julia-repl
julia>
passagecomponent(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1"))
```
"""
function passagecomponent(u::CtsUrn)::String
    allcomponents = components(u.urn)
    passage::String= allcomponents[5]
    passage
end


"""
$(SIGNATURES)
Extract CTS namespace from a CtsUrn.

# Examples
```julia-repl
julia>
namespace(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1"))
```
"""
function namespace(u::CtsUrn)::String
    allcomponents = components(u.urn)
    ns::String = allcomponents[3]
    ns
end
