---
title: "Marshal"
slug: marshal
description: "The methods ruby/spec describes in core/marshal, and which Metorex implements."
---

ruby/spec describes 3 methods in `core/marshal`, and Metorex implements 3 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Marshal.dump`**: implemented, parameters `[[:req, :object], [:opt, :target], [:opt, :limit]]`. Serializes obj and all descendant objects. [An example calling it](/examples/c-extensions-c-calls).
- **`Marshal.load`**: implemented, parameters `[[:req, :source], [:opt, :handler], [:key, :freeze]]`. Returns the result of converting the serialized data in source into a Ruby object (possibly with associated subordinate objects). [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler).
- **`Marshal.restore`**: implemented, parameters `[[:req, :source], [:opt, :handler], [:key, :freeze]]`. Returns the result of converting the serialized data in source into a Ruby object (possibly with associated subordinate objects).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
