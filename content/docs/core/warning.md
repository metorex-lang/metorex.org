---
title: "Warning"
slug: warning
description: "The methods ruby/spec describes in core/warning, and which Metorex implements."
---

ruby/spec describes 4 methods in `core/warning`, and Metorex implements 4 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Warning.[]`**: implemented, parameters `[[:req, :args]]`. Returns the flag to show the warning messages for `category`.
- **`Warning.[]=`**: implemented, parameters `[[:req, :args]]`. Sets the warning flags for `category`.
- **`Warning.categories`**: implemented, parameters `[[:req, :args]]`. Returns a list of the supported category symbols. [An example calling it](/examples/basics-warn-categories).
- **`Warning.warn`**: implemented, parameters `[[:req, :message], [:key, :category]]`. Writes warning message `msg` to $stderr. [An example calling it](/examples/basics-warn-categories).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
