---
title: "globals/special_globals.rb"
slug: globals-special-globals
description: "The metorex example program globals/special_globals.rb and its output."
---

`tests/_examples/globals/special_globals.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/special_globals.rb){target=_blank rel=noopener}.

```metorex
# The load path counts what was put on it, including anything RUBYLIB named,
# so the example measures the change rather than the total.
puts $:.class
started = $:.length
$:.unshift("test_path")
puts $:.length - started
puts $LOAD_PATH.length - started
puts $:.equal?($LOAD_PATH)
puts $/.class
puts $/
puts $!.class
puts $DEBUG.class
```

Output:

```
Array
1
1
true
String

NilClass
FalseClass
```
