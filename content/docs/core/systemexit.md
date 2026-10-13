---
title: "SystemExit"
slug: systemexit
description: "The methods ruby/spec describes in core/systemexit, and which Metorex implements."
---

ruby/spec describes 2 methods in `core/systemexit`, and Metorex implements 2 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`SystemExit#initialize`**: implemented, parameters `[[:rest]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`SystemExit#success?`**: implemented, parameters `[]`. Returns `true` if exiting successful, `false` if not. [An example calling it](/examples/advanced-native-thread-ids).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
