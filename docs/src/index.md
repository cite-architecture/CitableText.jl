# CitableText

## Overview

CitableText defines the `CtsUrn`, a URN notation for canonically citing texts.

A `CtsUrn` can be instantiated from a string value.  Note that the output of `print` is *not* a quoted string value, however: it is a `CtsUrn` object.

```jldoctest urn
using CitableText
urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
print(urn)

# output

urn:cts:greekLit:tlg0012.tlg001.msA:1.1
```

There are many ways to malform the string value for a `CtsUrn`.  The `CitableText` module aspires to catch all of them.  (See the unit tests for numerous examples of the kinds of errors the `CitableText` module can identify.)

One classic syntax error is to include too few top-level components in a CTS URN.  A CTS URN must have five components, even if the final passage component is empty.

```jldoctest urn
try 
    CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA")
catch e
    e
end

# output

ArgumentError("Invalid URN `urn:cts:greekLit:tlg0012.tlg001.msA`.  CtsUrns must have 5 top-level components.")
```