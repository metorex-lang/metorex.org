---
title: "c_extensions/c_marking.rb"
slug: c-extensions-c-marking
description: "The metorex example program c_extensions/c_marking.rb and its output."
---

`tests/_examples/c_extensions/c_marking.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_marking.rb).

```metorex
# A C extension whose wrapped structs are freed when nothing reaches them
# any more: not Ruby, not the mark function of a struct something reaches,
# and not an address C registered. What is left is freed as the program ends.
require "tmpdir"
require_relative "build_helper"

directory = Dir.mktmpdir
require(build_extension("c_marking.c", "c_marking", directory))

chain = CMarking.node(1, CMarking.node(2, nil))
lone = CMarking.node(3, nil)
lone = nil
CMarking.plain
GC.start
p(CMarking.freed)

chain = nil
GC.start
p(CMarking.freed.sort)

CMarking.pin(CMarking.node(4, nil))
kept = CMarking.node(5, nil)
GC.start
p(CMarking.freed.sort)

CMarking.stop_recording
FileUtils.rm_rf(directory)
```

Output:

```
[3]
[1, 2, 3]
[1, 2, 3]
freed 4 as the program ended
freed 5 as the program ended
```
