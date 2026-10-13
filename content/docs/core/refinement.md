---
title: "Refinement"
slug: refinement
description: "The methods ruby/spec describes in core/refinement, and which Metorex implements."
---

ruby/spec describes 8 methods in `core/refinement`, and Metorex implements 7 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Refinement#append_features`**: implemented, parameters `[[:req]]`. When this module is included in another, Ruby calls #append_features in this module, passing it the receiving module in *mod*. [An example calling it](/examples/oop-module-append-features-hook).
- **`Refinement#extend_object`**: implemented, parameters `[[:req]]`. Extends the specified object by adding this module's constants and methods (which are added as singleton methods). [An example calling it](/examples/oop-extend-object-hook).
- **`Refinement#import_methods`**: implemented, parameters `[[:rest]]`. Imports methods from modules.
- **`Refinement#include`**: implemented, parameters `[[:rest]]`. Invokes Module.append_features on each parameter in reverse order. [An example calling it](/examples/c-extensions-c-modules).
- **`Refinement#prepend`**: implemented, parameters `[[:rest]]`. Invokes Module.prepend_features on each parameter in reverse order. [An example calling it](/examples/c-extensions-c-iteration).
- **`Refinement#prepend_features`**: implemented, parameters `[[:req]]`. When this module is prepended in another, Ruby calls #prepend_features in this module, passing it the receiving module in *mod*. [An example calling it](/examples/oop-prepend-features-hook).
- **`Refinement#refined_class`**: not implemented. [An example calling it](/examples/oop-refinement-names-target).
- **`Refinement#target`**: implemented, parameters `[]`. Return the class or module refined by the receiver. [An example calling it](/examples/oop-refinement-names-target).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
