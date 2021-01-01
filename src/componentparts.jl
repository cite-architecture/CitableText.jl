# Functions to work with second-tier parts of top-level components


"""
$(SIGNATURES)
Count number of levels in the passage hierarchy of a CTS URN.

# Examples
```julia-repl
julia>
passagedepth(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1"))
```
"""
function passagedepth(u::CtsUrn)::Int64
    if passagecomponent(u) == ""
        0
    else
        if (isrange(u))
            pt1 = rangebegin(u)
            size(parts(pt1), 1)
        else
            size(passageparts(u), 1)
        end

    end
end

"""
$(SIGNATURES)
Count number of levels in the work hierarchy of a CTS URN.

# Examples
```julia-repl
julia>
workdepth(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1"))
```
"""
function workdepth(u::CtsUrn)::Int64
    if workcomponent(u) == ""
        0
    else
        size(workparts(u), 1)
    end
end

"""
$(SIGNATURES)
Extract an array with all the parts of the work hierarchy of a CTS URN.

# Examples
```julia-repl
julia>
workparts(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1"))
```
"""
function workparts(u::CtsUrn)
    parts(workcomponent(u))
end


"""
$(SIGNATURES)
Extract an array with all the parts of the passage hierarchy of a CTS URN.

# Examples
```julia-repl
julia>
workparts(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1"))
```
"""
function passageparts(u::CtsUrn)
    parts(passagecomponent(u))
end
