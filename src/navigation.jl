# Functions for navigation in a CitableCorpus


function nextnode(n::CitableNode, c::CitableCorpus)
    idx = findfirst(cn -> cn == n, c.corpus)
    if idx == size(c.corpus, 1)
        nothing
    else
        c.corpus[idx + 1]
    end
end


function prevnode(n::CitableNode, c::CitableCorpus)#::CitableNode
    idx = findfirst(cn -> cn == n, c.corpus)
    if idx == 1
        nothing
    else
        c.corpus[idx - 1]
    end
end