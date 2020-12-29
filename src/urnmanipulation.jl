
function droppassage(u::CtsUrn)
    save = components(u.urn)[1:4]
    newarray = push!(save,"")
    newstring = join(newarray,":")
    CtsUrn(newstring)
end


function addpassage(u::CtsUrn, psg::AbstractString)
    trimmed = droppassage(u)
    CtsUrn(trimmed.urn * psg)
end

# addpassage/droppassage
# addversion/dropversion
# addexemplar/dropexemplar
# collapseby/collapseto
