function passagedepth(u::CtsUrn)::Int64
    if passagecomponent(u) == ""
        0
    else
        size(parts(passagecomponent(u)), 1)
    end
end
