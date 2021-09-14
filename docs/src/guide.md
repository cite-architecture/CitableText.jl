# User guide

The `CitableText` module includes a panoply of functions for working with Cts Urns.  The API documentation has a more complete list than the few illustrated here.

## Top-level components

Include the `CitableBase` module for access to the generic `components` and `parts` functions.

```jldoctest manip
using CitableText, CitableBase
urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
components(urn)

# output

5-element Vector{SubString{String}}:
 "urn"
 "cts"
 "greekLit"
 "tlg0012.tlg001.msA"
 "1.1"
```


```jldoctest manip
components(urn)[4] |> parts

# output

3-element Vector{SubString{String}}:
 "tlg0012"
 "tlg001"
 "msA"
```

Or use these functions to refer to them by name.

```jldoctest manip
namespace(urn)

# output

"greekLit"
```

```jldoctest manip
workcomponent(urn)

# output

"tlg0012.tlg001.msA"
```


```jldoctest manip
passagecomponent(urn)

# output

"1.1"
```


## The work component

```jldoctest manip
workdepth(urn)

# output

3
```

```jldoctest manip
workparts(urn)

# output

3-element Vector{SubString{String}}:
 "tlg0012"
 "tlg001"
 "msA"
```





## The passage component


```jldoctest manip
passagedepth(urn)

# output

2
```

```jldoctest manip
passageparts(urn)

# output

2-element Vector{SubString{String}}:
 "1"
 "1"
```


## Ranges

TBA

## Subreferences

TBA