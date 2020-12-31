

"True if work component or `urn1` contains or is equal to work component of `urn2`."
function workContains(urn1::CtsUrn, urn2::CtsUrn)::Bool
    if workdepth(urn1) > workdepth(urn2)
        false
    else

        workparts(urn2)[1:workdepth(urn1)] == workparts(urn1)
    end
end

"True if passage component or `urn1` contains or is equal to passage component of `urn2`."
function passageContains(urn1::CtsUrn, urn2::CtsUrn)::Bool
    if passagedepth(urn1) > passagedepth(urn2)
        false
    else
        sliver = passageparts(urn2)[1:passagedepth(urn1)]
        sliver == passageparts(urn1)
    end
end


function urncontains(urn1::CtsUrn, urn2::CtsUrn)::Bool
    workContains(urn1,urn2) && passageContains(urn1, urn2)
end
