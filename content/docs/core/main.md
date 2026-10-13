---
title: "main"
slug: main
description: "The methods ruby/spec describes in core/main, and which Metorex implements."
---

ruby/spec describes 7 methods in `core/main`, and Metorex implements 7 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`main#define_method`**: implemented, parameters `[[:rest, :*]]`. [An example calling it](/examples/advanced-dynamic-method-definition).
- **`main#include`**: implemented, parameters `[[:rest, :*]]`. [An example calling it](/examples/c-extensions-c-modules).
- **`main#private`**: implemented, parameters `[[:rest, :*]]`.
- **`main#public`**: implemented, parameters `[[:rest, :*]]`.
- **`main.ruby2_keywords`**: implemented, parameters `[[:rest, :*]]`.
- **`main#to_s`**: implemented, parameters `[]`. [An example calling it](/examples/addresses-internet-addresses).
- **`main.using`**: implemented, parameters `[[:rest, :*]]`.

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
