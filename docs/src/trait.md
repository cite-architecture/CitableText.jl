# The `CitableTrait`

The `CitableBase` package defines a `CitableTrait`.  Types implementing the trait implement a function, `urn`, that identifies an object by a value that is a subtype of `Urn`.

By default, the value of the trait for a subtype of `Urn` is `Citable`.  There are times, however, when it may be useful to have a more specific value for the trait. For that situation, the `CitableText` package defines the `CitableByCtsUrn` type.  Here is an example of how you can use it.

Define your custom type, import `CitableTrait`, and assign it the value `CitableByCtsUrn()` for your new type.  Implement the `urn` function.

```@example trait
using CitableBase, CitableText

struct TinyText <: Citable
    urn::CtsUrn
    txt::AbstractString
end

import CitableBase: urn
function urn(tinyText::TinyText)
    tinyText.urn
end

import CitableBase: CitableTrait
CitableTrait(::Type{TinyText}) = CitableByCtsUrn()
```


Now when we create objects of type `TinyText`, we can use the `citable` function from `CitableBase` to find out if our objets of our type are citable by some type of URN.

```@example trait
ctsurn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:")
txt = "The Iliad"
tiny = TinyText(ctsurn, txt)
if citable(tiny)
    urn(tiny)
else
    nothing
end        
```

But we can also more specifically check the value of the `CitableTrait`.

```@example trait
if CitableTrait(typeof(tiny)) == CitableByCtsUrn()
    "Citation is by CtsUrn"
else
    "Citation is NOT by CtsUrn"
end    
```