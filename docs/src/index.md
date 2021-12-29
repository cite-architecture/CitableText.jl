# CitableText

## Overview

The `CitableText` package defines the `CtsUrn`, a URN notation for canonically citing texts.

A `CtsUrn` can be instantiated from a string value. When displayed or printed, the string value is formatted within pointy brackets. 

```@example urn
using CitableText
urn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:1.1")
```

There are many ways to malform the string value for a `CtsUrn`.  The `CitableText` module aspires to catch all of them.  (See the unit tests for numerous examples of the kinds of errors the `CitableText` module can identify.)

One classic syntax error is to include too few top-level components in a CTS URN.  A CTS URN must have five components, even if the final passage component is empty.

```@example urn
try 
    CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA")
catch e
    e
end
```