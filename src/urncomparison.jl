"""
$(SIGNATURES)
Override `urnmatches` function to be true if `urn1` and `urn1` are urnmatches by URN logic.
"""
function urnmatches(urn1::CtsUrn, urn2::CtsUrn)
    urn1.urn == urn2.urn || urncontains(urn1, urn2) || urncontains(urn2, urn1)
end

"""
$(SIGNATURES)
True if `urn1` contains `urn2` according to URN logic.

# Examples
```julia-repl
julia>
urncontains(CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1")
)
```
"""
function urncontains(urn1::CtsUrn, urn2::CtsUrn)::Bool
    workcontains(urn1,urn2) && passagecontains(urn1, urn2)
end




"""
$(SIGNATURES)
True if work component of `urn1` contains or is equal to work component of `urn2`.

# Examples
```julia-repl
julia>
workcontains(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")
CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1")
)
```
"""
function workcontains(urn1::CtsUrn, urn2::CtsUrn)::Bool
    if workdepth(urn1) > workdepth(urn2)
        false
    else
     workparts(urn2)[1:workdepth(urn1)] == workparts(urn1)
    end
end


"""
$(SIGNATURES)
True if passage component of `urn1` contains or is equal to passage component of `urn2`.

# Examples
```julia-repl
julia>
passagecontains(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1")
CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1")
)
```
"""
function passagecontains(urn1::CtsUrn, urn2::CtsUrn)::Bool
    if isempty(passagecomponent(urn1))
        true
    elseif passagedepth(urn1) > passagedepth(urn2)
        false
    else
        sliver = passageparts(urn2)[1:passagedepth(urn1)]
        sliver == passageparts(urn1)
    end
end


