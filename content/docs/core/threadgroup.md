---
title: "ThreadGroup"
slug: threadgroup
description: "The methods ruby/spec describes in core/threadgroup, and which Metorex implements."
---

ruby/spec describes 4 methods in `core/threadgroup`, and Metorex implements 4 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`ThreadGroup#add`**: implemented, parameters `[[:req, :thread]]`. Adds the given `thread` to this group, removing it from any other group to which it may have previously been a member. [An example calling it](/examples/advanced-dsl-example).
- **`ThreadGroup#enclose`**: implemented, parameters `[]`. Prevents threads from being added to or removed from the receiving ThreadGroup. [An example calling it](/examples/builtins-core-class-additions).
- **`ThreadGroup#enclosed?`**: implemented, parameters `[]`. Returns `true` if the `thgrp` is enclosed. [An example calling it](/examples/builtins-core-class-additions).
- **`ThreadGroup#list`**: implemented, parameters `[]`. Returns an array of all existing Thread objects that belong to this group. [An example calling it](/examples/builtins-core-class-additions).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
