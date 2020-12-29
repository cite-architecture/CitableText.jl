
function droppassage(u::CtsUrn)::CtsUrn
    save = components(u.urn)[URN:WORK]
    newarray = push!(save,"")
    newstring = join(newarray,":")
    CtsUrn(newstring)
end


function addpassage(u::CtsUrn, psg::AbstractString)::CtsUrn
    trimmed = droppassage(u)
    CtsUrn(trimmed.urn * psg)
end

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

function addversion(u::CtsUrn, vers::String)
    top = components(u.urn)[URN:NAMESPACE]
    trimmed = dropversion(u)
    newparts = push!(workparts(trimmed),vers)
    newversion = join(newparts,".")
    newcomponents = push!(top,newversion)
    newurnstring = push!(newcomponents, passagecomponent(u))
    CtsUrn(join(newurnstring,":"))
end

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

function addexemplar(u::CtsUrn,ex::String)::CtsUrn
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

# addexemplar/dropexemplar
# collapseby/collapseto
