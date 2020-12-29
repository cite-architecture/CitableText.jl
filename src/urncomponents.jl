
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
