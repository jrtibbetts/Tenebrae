# Tenebrae
A `CAGradientLayer` that can be attached to the inner edges of `UIView`s.

A simple framework and sample application for adding inner shadows to the edges of views. It was prompted by http://stackoverflow.com/questions/37668965.

To use it, just

```
import Tenebrae

let targetView = ...
let topShadow = EdgeShadowLayer(forView: targetView, edge: .Top)
targetView.layer.addSublayer(topShadow)
```

Because it's a `CAGradientLayer`, you can set the usual attributes, such as `radius` and `colors`, the usual way, or you can pass them to the initializer. See the class's documentation for the initializer signature.
