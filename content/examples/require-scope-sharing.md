---
title: "require/scope_sharing.rb"
slug: require-scope-sharing
description: "The metorex example program require/scope_sharing.rb and its output."
---

`tests/_examples/require/scope_sharing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/scope_sharing.rb).

```metorex
# Constants, methods, and classes from a required file are reachable, and its
# local variables are not: each file keeps its own top-level locals.
require_relative "lib/shared_scope"

puts SHARED_VALUE

puts shared_function()

obj = SharedClass.new
puts obj.name

begin
  puts shared_var
rescue NameError => refused
  puts refused.message
end
```

Output:

```
shared value
shared function result
SharedClass instance
undefined local variable or method 'shared_var' for main
```
