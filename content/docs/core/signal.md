---
title: "Signal"
slug: signal
description: "The methods ruby/spec describes in core/signal, and which Metorex implements."
---

ruby/spec describes 3 methods in `core/signal`, and Metorex implements 3 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Signal.list`**: implemented, parameters `[[:req, :args]]`. Returns a list of signal names mapped to the corresponding underlying signal numbers. [An example calling it](/examples/signals-delivery).
- **`Signal.signame`**: implemented, parameters `[[:req, :args]]`. Convert signal number to signal name. [An example calling it](/examples/signals-child-status).
- **`Signal.trap`**: implemented, parameters `[[:rest]]`. Specifies the handling of signals. [An example calling it](/examples/signals-delivery).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
