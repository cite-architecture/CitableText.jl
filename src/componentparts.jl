# Functions to work with second-tier parts of top-level components

function passagedepth(u::CtsUrn)::Int64
    if passagecomponent(u) == ""
        0
    else
        size(passageparts(u), 1)
    end
end

function workdepth(u::CtsUrn)::Int64
    if workcomponent(u) == ""
        0
    else
        size(workparts(u), 1)
    end
end

function workparts(u::CtsUrn)
    parts(workcomponent(u))
end

function passageparts(u::CtsUrn)
    parts(passagecomponent(u))
end
