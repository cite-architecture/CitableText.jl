"A canonically citable text corpus."
struct CitableCorpus
    corpus
end

function to_df(c::CitableCorpus)
    urns = map(cn -> cn.urn, c.corpus)
    psgs = map(cn -> cn.text, c.corpus)
    df = DataFrame(urn = urns,text = psgs)
    df
end
