# The `CitableTrait`

The `CitableBase` package defines a `CitableTrait`. For any Julia type, the value of the trait is identified by a singleton value returned by the `citabletrait` function.  By default, the value of the trait is  `NotCitable()`.   (See a fuller discussion in the [documentation for `CitableBase`](https://cite-architecture.github.io/CitableBase.jl/stable/citable/#Implementing-the-CitableTrait)).


The `CitableText` package defines a singleton-type `CitableByCtsUrn` which you use as the value for `CitableTrait` for your own types of content identified by `CtsUrn`s.  Here is a brief example.


First define your type with a `CtsUrn`.

```@example trait
using CitableBase, CitableText

struct TinyText <: Citable
    urn::CtsUrn
    txt::AbstractString
end
ctsurn = CtsUrn("urn:cts:greekLit:tlg0012.tlg001.msA:")
txt = "The Iliad"
tiny = TinyText(ctsurn, txt)
```

Override the `citabletrait` function when its parameter is the type `TinyText`, and return the concrete value `CitableByCtsUrn()`.

```@example trait
import CitableBase: citabletrait
function citabletrait(::Type{TinyText}) 
    CitableByCtsUrn()
end
```

Check the result:

```@example trait
citabletrait(typeof(tiny))
```

Now you can use the `citable` function (from `CitableBase`) to check whether individual objects of your new type are citable.

```@example trait
citable(tiny)
```

At this point, you can also implement the required functions of the `CitableTrait`, `urn` and `label`.

```@example trait
import CitableBase: urn
function urn(tinyText::TinyText)
    tinyText.urn
end
function label(tinyText::TinyText)
    string(tinyText.urn) * ": " * tinyText.txt
end
```

```@example trait
urn(tiny)
```

```@example trait
label(tiny)
```