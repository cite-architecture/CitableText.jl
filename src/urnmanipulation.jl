
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
    psg = components(u.urn)[PASSAGE]
    workparts = parts(workcomponent(u))
    
end


# addversion/dropversion
# addexemplar/dropexemplar
# collapseby/collapseto
