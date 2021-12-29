# User's guide: the `CtsUrn`

The `CitableText` module includes a panoply of functions for working with `CtsUrn`s.  (The API documentation has a more complete list than those illutrated here).

## Top-level components

Include the `CitableBase` module to use its generic `components` and `parts` functions.

```@example manip
using CitableText, CitableBase
urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
components(urn)
```


```@example manip
components(urn)[4] |> parts
```

You can also use functions in `CitableText` to extract components by name, and work with parts of those components.

```@example manip
namespace(urn)
```

```@example manip
workcomponent(urn)
```


```@example manip
passagecomponent(urn)
```


### The work component

```@example manip
workdepth(urn)
```

```@example manip
workparts(urn)
```





### The passage component


```@example manip
passagedepth(urn)
```

```@example manip
passageparts(urn)
```

## URN manipulation

Several functions take a `CtsUrn` as an argument, and create a new `CtsUrn`.

```@example manip
addversion(urn, "rev2")
```


```@example manip
dropversion(urn)
```

Similar functions are `addworkid`,   `dropversion`, `addversion`,  `dropexemplar`, `addexemplar`,  `collapsePassageTo`, and `collapsePassageBy`.

You could, for example, chain together `dropversion` and `addworkid` to turn a reference to a specific version of *Iliad* 1.1 into a generic reference to *Odyssey* 1.1.


```@example manip
# change "tlg001" (Iliad) to "tlg002" (Odyssey)
addworkid(dropversion(urn), "tlg002") 
```

## URN comparison

In addition to comparing two `CtsUrn`s for equality with `==`, you can compare them for URN containment or URN similarity.

```@example manip
iliad1 =  CtsUrn("urn:cts:greekLit:tlg0012.tlg001:1")
urncontains(iliad1, urn)
```

Two `CtsUrn`s are *similar* if they are equal, or if either URN contains the other.


```@example manip
urnsimilar(iliad1, urn)
```

Note that this definition means the function is symmetric.


```@example manip
urnsimilar(iliad1, urn) == urnsimilar(urn, iliad1)
```


## Ranges

`CtsUrn`s can identify passages of text as continuous ranges of citable passages.  


```@example manip
openinglines = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1-1.10")
isrange(openinglines)
```

The `range_begin` and `range_end` functions return string values.

```@example manip
range_begin(openinglines)
```

```@example manip
range_end(openinglines)
```

## Extended identifiers ("subreferences")

CTS URNs can include an extended identifier to point into the text content of a specific version of a passage. You can determine if a `CtsUrn` includes an extended identifier, extract the subreference, or drop it.


```@example manip
wrath = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1@μῆνιν")
hassubref(wrath)
```


```@example manip
subref(wrath)
```



```@example manip
dropsubref(wrath) == urn
```

