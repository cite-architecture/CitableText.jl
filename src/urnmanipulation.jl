# Functions generating CtsUrns by manipulating or changing a given CtsUrn.


"""
$(SIGNATURES)
Create a new CtsUrn by dropping the passage component of a given CtsUrn.

# Examples
```julia-repl
julia>
droppassage(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function droppassage(u::CtsUrn)::CtsUrn
    save = components(u.urn)[URN:WORK]
    newarray = push!(save,"")
    newstring = join(newarray,":")
    CtsUrn(newstring)
end


"""
$(SIGNATURES)
Create a new CtsUrn by replacing any passage component in a given CtsUrn with a new
passage component.

# Examples
```julia-repl
julia>
addpassage(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function addpassage(u::CtsUrn, psg::AbstractString)::CtsUrn
    trimmed = droppassage(u)
    CtsUrn(trimmed.urn * psg)
end


"""
$(SIGNATURES)
Create a new CtsUrn by dropping the version part of a given CtsUrn's work component.

# Examples
```julia-repl
julia>
dropversion(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function dropversion(u::CtsUrn)::CtsUrn
    top = components(u.urn)[URN:NAMESPACE]
    if workdepth(u) < TEXTVERSION
        withwork = push!(top,workcomponent(u))
        urnparts = push!(withwork, passagecomponent(u))
        CtsUrn(join(urnparts,":"))
    else
        newwork = join(workparts(u)[GROUP:TEXT],".")
        withwork = push!(top, newwork)
        urnparts = push!(withwork, passagecomponent(u))
        CtsUrn(join(urnparts,":"))
    end
end


"""
$(SIGNATURES)
Create a new CtsUrn by replacing any version part of a given CtsUrn's
work component with a new version part.

# Examples
```julia-repl
julia>
addversion(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function addversion(u::CtsUrn, vers::AbstractString)
    top = components(u.urn)[URN:NAMESPACE]
    trimmed = dropversion(u)
    newparts = push!(workparts(trimmed),vers)
    newversion = join(newparts,".")
    newcomponents = push!(top,newversion)
    newurnstring = push!(newcomponents, passagecomponent(u))
    CtsUrn(join(newurnstring,":"))
end



"""
$(SIGNATURES)
Create a new CtsUrn by dropping the exemplar part of a given CtsUrn's work component.

# Examples
```julia-repl
julia>
dropexemplar(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function dropexemplar(u::CtsUrn)::CtsUrn
    top = components(u.urn)[URN:NAMESPACE]
    if workdepth(u) <= TEXTVERSION
        withversion = push!(top,workcomponent(u))
        urnparts = push!(withversion, passagecomponent(u))
        CtsUrn(join(urnparts,":"))
    else
        newversion = join(workparts(u)[GROUP:TEXTVERSION],".")
        withversion = push!(top, newversion)
        urnparts = push!(withversion, passagecomponent(u))
        CtsUrn(join(urnparts,":"))
    end
end


"""
$(SIGNATURES)
Create a new CtsUrn by replacing any exemplar part of a given CtsUrn's
work component with a new exemplar part.

# Examples
```julia-repl
julia>
addexemplar(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function addexemplar(u::CtsUrn, ex::AbstractString)::CtsUrn
    if workdepth(u) < TEXTVERSION
        throw(ArgumentError("Cannot add exemplar to URN without version: `$(u.urn)`."))

    else
        top = components(u.urn)[URN:NAMESPACE]
        trimmed = dropexemplar(u)
        newparts = push!(workparts(trimmed),ex)
        newexemplar = join(newparts,".")
        newcomponents = push!(top,newexemplar)
        newurnstring = push!(newcomponents, passagecomponent(u))
        CtsUrn(join(newurnstring,":"))
    end
end


"""Create a new CtsUrn by replacing any work part of a given
URN's work component with a new work ID part.

$(SIGNATURES)
"""
function addworkid(u::CtsUrn, workid::AbstractString)
    workparts = split(workcomponent(u), ".")
    workparts[2] = workid

    components = split(u.urn, ":")
    components[4] = join(workparts,".")
    CtsUrn(join(components,":"))
end


"""
$(SIGNATURES)
Create a new CtsUrn by collapsing a given CtsUrn's
passage hierarchy to a given level.

# Examples
```julia-repl
julia>
collapsePassageTo(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function collapsePassageTo(u::CtsUrn, count::Int64)::CtsUrn
    if count > passagedepth(u)
        throw(ArgumentError("Invalid request: requested depth $(count) too deep for URN `$(u.urn)`."))
    else
        newcomponents = components(u.urn)[URN:WORK]
        if count == 1
            newpassageparts = passageparts(u)[1]
            push!(newcomponents, newpassageparts)
        else
            newpassageparts = passageparts(u)[1:count]
            push!(newcomponents,join(newpassageparts,"."))
        end
        CtsUrn(join(newcomponents,":"))
    end
end


"""
$(SIGNATURES)
Create a new CtsUrn by collapsing a given CtsUrn's
passage hierarchy by a given number of levels.

# Examples
```julia-repl
julia>
collapsePassageBy(CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1.1-1.10"))
```
"""
function collapsePassageBy(u::CtsUrn, n::Int64)::CtsUrn
    if n > passagedepth(u)
        throw(ArgumentError("Invalid request: requested depth $(n) too deep for URN `$(u.urn)`."))
    elseif n == passagedepth(u)
        droppassage(u)
    else
        top = components(u.urn)[CitableText.URN:CitableText.WORK]
        diff = passagedepth(u) - n
        newpassageparts = passageparts(u)[1:diff]
        newpassage = join(newpassageparts,".")
        newcomponents = push!(top,newpassage)
        CtsUrn(join(newcomponents,":"))
    end
end
