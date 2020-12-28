module CitableText

using CitableBase, Documenter, DocStringExtensions

export CtsUrn, workcomponent, passagecomponent, namespace

"Implementation of the CTS URN. See  [http://cite-architecture.org/ctsurn/](http://cite-architecture.org/ctsurn/)."
struct CtsUrn
    urn::String
    function CtsUrn(s)
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
            new(s)
        end
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
function workcomponent(u::CtsUrn)
    allcomponents = components(u.urn)
    allcomponents[4]
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
function passagecomponent(u::CtsUrn)
    allcomponents = components(u.urn)
    allcomponents[5]
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
function namespace(u::CtsUrn)
    allcomponents = components(u.urn)
    allcomponents[3]
end

end # module
