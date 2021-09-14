# CitableText

This Julia module defines the `CtsUrn`, a URN notation for canonically citing texts.

A `CtsUrn` can be instantiated from a string value.  The `show` function returns this value.

```jldoctest urn
using CitableText
urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
show(urn)

# output

"urn:cts:greekLit:tlg0012.tlg001.msA:1.1"
```

There are many ways to malform the string value for a `CtsUrn`.  The `CitableText` module aspires to catch all of them.

```jldoctest urn
try 
    CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA")
catch e
    e
end

# output

ArgumentError("Invalid URN `urn:cts:greekLit:tlg0012.tlg001.msA`.  CtsUrns must have 5 top-level components.")
```