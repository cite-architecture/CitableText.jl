# User's guide: the `CtsUrn`

The `CitableText` module includes a panoply of functions for working with `CtsUrn`s.  (The API documentation has a more complete list than those illutrated here).

## Top-level components

Include the `CitableBase` module to use its generic `components` and `parts` functions.

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

You can also functions in CitableText to extract components by name, and work with parts of those components.

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


### The work component

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





### The passage component


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

## URN manipulation

Several functions take a `CtsUrn` as an argument, and create a new `CtsUrn`.

```jldoctest manip
addversion(urn, "rev2")

# output

urn:cts:greekLit:tlg0012.tlg001.rev2:1.1
```


```jldoctest manip
dropversion(urn)

# output

urn:cts:greekLit:tlg0012.tlg001:1.1
```

Similar functions are `addworkid`,   `dropversion`, `addversion`,  `dropexemplar`, `addexemplar`,  `collapsePassageTo`, and `collapsePassageBy`.

You could, for example, chain together `dropversion` and `addworkid` to turn a reference to a specific version of *Iliad* 1.1 into a generic reference to *Odyssey* 1.1.


```jldoctest manip
# change "tlg001" (Iliad) to "tlg002" (Odyssey)
addworkid(dropversion(urn), "tlg002") 

# output

urn:cts:greekLit:tlg0012.tlg002:1.1
```

## URN comparison

In addition to comparing two `CtsUrn`s for equality with `==`, you can compare them for URN containment or URN similarity.

```jldoctest manip
iliad1 =  CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1")
urncontains(iliad1, urn)

# output

true
```

Two `CtsUrn`s are *similar* if they are equal, or if either URN contains the other.


```jldoctest manip
urnsimilar(iliad1, urn)

# output

true
```

Note that this definition means the function is symmetric.


```jldoctest manip
urnsimilar(iliad1, urn) == urnsimilar(urn, iliad1)

# output

true
```


## Ranges

`CtsUrn`s can identify passages of text as continuous ranges of citable passages.  


```jldoctest manip
openinglines = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10")
isrange(openinglines)

# output

true
```

The `range_begin` and `range_end` functions return string values.

```jldoctest manip
range_begin(openinglines)

# output

"1.1"
```

```jldoctest manip
range_end(openinglines)

# output

"1.10"
```

## Extended identifiers ("subreferences")

CTS URNs can include an extended identifier to point into the text content of a specific version of a passage. You can determine if a `CtsUrn` includes an extended identifier, extract the subreference, or drop it.


```jldoctest manip
wrath = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1@μῆνιν")
hassubref(wrath)

# output

true
```


```jldoctest manip
subref(wrath)

# output

"μῆνιν"
```



```jldoctest manip
dropsubref(wrath) == urn

# output

true
```